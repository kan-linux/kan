/*
 * manconv.c: convert manual page from one encoding to another
 *
 * Copyright (C) 2007, 2008, 2009, 2010, 2012 Colin Watson.
 * Based loosely on parts of glibc's iconv_prog.c, which is:
 * Copyright (C) 1998-2004, 2005, 2006, 2007 Free Software Foundation, Inc.
 *
 * This file is part of man-db.
 *
 * man-db is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * man-db is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with man-db; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

/* This program arose during a discussion with Adam Borowski. See:
 *   https://lists.debian.org/debian-mentors/2007/09/msg00245.html
 * It behaves like iconv, but allows multiple source encodings and
 * attempts to guess the first one that works. An Emacs-style
 * "-*- coding:" declaration overrides this.
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#ifdef HAVE_ICONV
#  include <iconv.h>
#endif /* HAVE_ICONV */

#include "argp.h"
#include "attribute.h"
#include "error.h"
#include "gl_list.h"
#include "xalloc.h"
#include "xstrndup.h"
#include "xvasprintf.h"

#include "gettext.h"
#include <locale.h>
#define _(String) gettext (String)

#include "manconfig.h"

#include "debug.h"
#include "fatal.h"
#include "glcontainers.h"

#include "decompress.h"
#include "manconv.h"

/* Encoding conversions from groff-1.20/src/preproc/preconv/preconv.cpp.
 * I've only included those not already recognised by GNU libiconv.
 */
struct conversion_entry {
	const char *from;
	const char *to;
};

static struct conversion_entry conversion_table[] = {
        {"chinese-big5",                 "Big5"       },
        {"chinese-euc",                  "GB2312"     },
        {"chinese-iso-8bit",             "GB2312"     },
        {"cn-gb-2312",                   "GB2312"     },
        {"cp878",                        "KOI8-R"     },
        {"cyrillic-iso-8bit",            "ISO-8859-5" },
        {"cyrillic-koi8",                "KOI8-R"     },
        {"euc-china",                    "GB2312"     },
        {"euc-japan",                    "EUC-JP"     },
        {"euc-japan-1990",               "EUC-JP"     },
        {"euc-kr",                       "EUC-KR"     },
        {"greek-iso-8bit",               "ISO-8859-7" },
        {"iso-latin-1",                  "ISO-8859-1" },
        {"iso-latin-2",                  "ISO-8859-2" },
        {"iso-latin-5",                  "ISO-8859-9" },
        {"iso-latin-7",                  "ISO-8859-13"},
        {"iso-latin-9",                  "ISO-8859-15"},
        {"japanese-iso-8bit",            "EUC-JP"     },
        {"japanese-euc",                 "EUC-JP"     },
        {"jis8",                         "EUC-JP"     },
        {"korean-euc",                   "EUC-KR"     },
        {"korean-iso-8bit",              "EUC-KR"     },
        {"latin-0",                      "ISO-8859-15"},
        {"latin-1",                      "ISO-8859-1" },
        {"latin-2",                      "ISO-8859-2" },
        {"latin-5",                      "ISO-8859-9" },
        {"latin-7",                      "ISO-8859-13"},
        {"mule-utf-16",                  "UTF-16"     },
        {"mule-utf-16be",                "UTF-16BE"   },
        {"mule-utf-16-be",               "UTF-16BE"   },
        {"mule-utf-16be-with-signature", "UTF-16"     },
        {"mule-utf-16le",                "UTF-16LE"   },
        {"mule-utf-16-le",               "UTF-16LE"   },
        {"mule-utf-16le-with-signature", "UTF-16"     },
        {"mule-utf-8",                   "UTF-8"      },
        {"utf-16-be",                    "UTF-16BE"   },
        {"utf-16be-with-signature",      "UTF-16"     },
        {"utf-16-be-with-signature",     "UTF-16"     },
        {"utf-16-le",                    "UTF-16LE"   },
        {"utf-16le-with-signature",      "UTF-16"     },
        {"utf-16-le-with-signature",     "UTF-16"     },
        {NULL,                           NULL         }
};

/* Convert Emacs-style coding tags to ones that libiconv understands. */
static char *convert_encoding (char *encoding)
{
	size_t encoding_len = strlen (encoding);
	const struct conversion_entry *entry;

#define STRIP(s, l)                                                           \
	do {                                                                  \
		if (encoding_len > (l) &&                                     \
		    !strcasecmp (encoding + encoding_len - (l), (s)))         \
			encoding[encoding_len - (l)] = '\0';                  \
	} while (0)

	STRIP ("-dos", 4);
	STRIP ("-mac", 4);
	STRIP ("-unix", 5);

#undef STRIP

	for (entry = conversion_table; entry->from; ++entry)
		if (!strcasecmp (entry->from, encoding)) {
			free (encoding);
			return xstrdup (entry->to);
		}

	return encoding;
}

/* Inspect the first line of data from a decompressor for preprocessor
 * encoding declarations.
 *
 * If to_encoding and modified_line are both non-NULL, and if the encoding
 * declaration in the input does not match to_encoding, then return an
 * encoding declaration line modified to refer to the given to_encoding in
 * *modified_line.  The caller should free *modified_line.
 */
char *check_preprocessor_encoding (decompress *decomp, const char *to_encoding,
                                   char **modified_line)
{
	char *pp_encoding = NULL;
	const char *line = decompress_peekline (decomp);
	const char *directive = NULL, *directive_end = NULL, *pp_search = NULL;
	size_t pp_encoding_len = 0;

	/* Some people use .\" incorrectly. We allow it for encoding
	 * declarations but not for preprocessor declarations.
	 */
	if (line &&
	    (STRNEQ (line, PP_COOKIE, 4) || STRNEQ (line, ".\\\" ", 4))) {
		const char *newline = strchr (line, '\n');

		directive = line + 4;
		directive_end = newline ? newline : strchr (directive, '\0');
		pp_search = memmem (directive, directive_end - directive,
		                    "-*-", 3);
	}

	if (directive && pp_search) {
		pp_search += 3;
		while (pp_search && pp_search < directive_end && *pp_search) {
			while (*pp_search == ' ')
				++pp_search;
			if (STRNEQ (pp_search, "coding:", 7)) {
				const char *pp_encoding_allow;
				pp_search += 7;
				while (*pp_search == ' ')
					++pp_search;
				pp_encoding_allow =
				        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
				        "abcdefghijklmnopqrstuvwxyz"
				        "0123456789-_/:.()";
				pp_encoding_len =
				        strspn (pp_search, pp_encoding_allow);
				pp_encoding =
				        xstrndup (pp_search, pp_encoding_len);
				pp_encoding = convert_encoding (pp_encoding);
				debug ("preprocessor encoding: %s\n",
				       pp_encoding);
				break;
			} else {
				pp_search = memchr (pp_search, ';',
				                    directive_end - pp_search);
				if (pp_search)
					++pp_search;
			}
		}
	}

	if (to_encoding && modified_line && pp_encoding &&
	    strcasecmp (pp_encoding, to_encoding)) {
		assert (directive_end);
		assert (pp_search);
		*modified_line = xasprintf (
		        "%.*s%s%.*s\n", (int) (pp_search - line), line,
		        to_encoding,
		        (int) (directive_end - (pp_search + pp_encoding_len)),
		        pp_search + pp_encoding_len);
	}

	return pp_encoding;
}

static int add_output (const char *inbuf, size_t inlen,
                       struct manconv_outbuf *outbuf)
{
	int ret = 0;

	if (outbuf) {
		if (outbuf->len + inlen >= outbuf->max)
			fatal (0, "out of space in output buffer");
		memcpy (outbuf->buf + outbuf->len, inbuf, inlen);
		outbuf->len += inlen;
	} else {
		int errno_save = errno;
		if (fwrite (inbuf, 1, inlen, stdout) < inlen ||
		    ferror (stdout)) {
			error (0, 0, _ ("can't write to standard output"));
			ret = -1;
		}
		errno = errno_save;
	}

	return ret;
}

#ifdef HAVE_ICONV

/* When converting text containing an invalid multibyte sequence to
 * UTF-8//IGNORE, GNU libc's iconv returns EILSEQ but sets *inbuf to the end
 * of the input buffer.  I'm not sure whether this is a bug or not (it seems
 * to contradict the documentation), but work around it anyway by recoding
 * to UTF-8 so that we can accurately position the error.
 */
static off_t locate_error (const char *try_from_code, const char *input,
                           size_t input_size, char *utf8, size_t utf8_size)
{
	iconv_t cd_utf8_strict;
	char *inptr = (char *) input, *utf8ptr = utf8;
	size_t inleft = input_size, utf8left = utf8_size;
	size_t n;
	off_t ret;

	cd_utf8_strict = iconv_open ("UTF-8", try_from_code);
	if (cd_utf8_strict == (iconv_t) -1) {
		error (0, errno, "iconv_open (\"UTF-8\", \"%s\")",
		       try_from_code);
		return 0;
	}

	n = iconv (cd_utf8_strict, (ICONV_CONST char **) &inptr, &inleft,
	           &utf8ptr, &utf8left);
	if (n == (size_t) -1)
		ret = inptr - input;
	else
		ret = 0;

	iconv_close (cd_utf8_strict);

	return ret;
}

typedef enum {
	TRIED_ICONV_OK = 0,
	TRIED_ICONV_ERROR = -1, /* can continue with another encoding */
	TRIED_ICONV_FATAL = -2  /* must give up */
} tried_iconv;

static tried_iconv try_iconv (decompress *decomp, const char *try_from_code,
                              const char *to, bool last,
                              struct manconv_outbuf *outbuf)
{
	char *try_to_code = xstrdup (to);
	static const size_t buf_size = 65536;
	size_t input_size = buf_size;
	off_t input_pos = 0;
	const char *input;
	static char *utf8 = NULL, *output = NULL;
	size_t utf8left = 0;
	iconv_t cd_utf8, cd = NULL;
	bool to_utf8 = STREQ (try_to_code, "UTF-8") ||
	               STRNEQ (try_to_code, "UTF-8//", 7);
	const char *utf8_target = last ? "UTF-8//IGNORE" : "UTF-8";
	bool ignore_errors = (strstr (try_to_code, "//IGNORE") != NULL);
	tried_iconv ret = TRIED_ICONV_OK;

	debug ("trying encoding %s -> %s\n", try_from_code, try_to_code);

	cd_utf8 = iconv_open (utf8_target, try_from_code);
	if (cd_utf8 == (iconv_t) -1) {
		error (0, errno, "iconv_open (\"%s\", \"%s\")", utf8_target,
		       try_from_code);
		free (try_to_code);
		return TRIED_ICONV_ERROR;
	}

	if (!to_utf8) {
		cd = iconv_open (try_to_code, "UTF-8");
		if (cd == (iconv_t) -1) {
			error (0, errno, "iconv_open (\"%s\", \"UTF-8\")",
			       try_to_code);
			free (try_to_code);
			return TRIED_ICONV_ERROR;
		}
	}

	input = decompress_peek (decomp, &input_size);
	if (input_size < buf_size) {
		/* End of file, error, or just a short read? Repeat until we
		 * have either a full buffer or EOF/error.
		 */
		while (input_size < buf_size) {
			size_t old_input_size = input_size;
			input_size = buf_size;
			input = decompress_peek (decomp, &input_size);
			if (input_size == old_input_size)
				break;
		}
	}

	if (!utf8)
		utf8 = xmalloc (buf_size);
	if (!output)
		output = xmalloc (buf_size);

	while (input_size || utf8left) {
		int handle_iconv_errors = 0;
		char *inptr = (char *) input, *utf8ptr = utf8, *outptr;
		size_t inleft = input_size, outleft;
		size_t n, n2 = -1;

		if (!utf8left) {
			/* First, convert the text to UTF-8. By assumption,
			 * all validly-encoded text can be converted to
			 * UTF-8 assuming that we picked the correct
			 * encoding. Any errors at this stage are due to
			 * selecting an incorrect encoding, or due to
			 * misencoded source text.
			 */
			utf8left = buf_size;
			n = iconv (cd_utf8, (ICONV_CONST char **) &inptr,
			           &inleft, &utf8ptr, &utf8left);
			utf8left = buf_size - utf8left;

			/* If we need to try the next encoding, do that
			 * before writing anything.
			 */
			if (!last && n == (size_t) -1 &&
			    (errno == EILSEQ ||
			     (errno == EINVAL && input_size < buf_size))) {
				ret = TRIED_ICONV_ERROR;
				break;
			} else if (n == (size_t) -1)
				handle_iconv_errors = errno;
		}

		/* If the target encoding is UTF-8 (the common case), then
		 * we can just write out what we've got. Otherwise, we need
		 * to convert to the target encoding. Any errors at this
		 * stage are due to characters that are not representable in
		 * the target encoding.
		 */
		if (handle_iconv_errors)
			/* Fall back to error handling below.  If we have
			 * anything to write out, we'll do it next time
			 * round the loop.
			 */
			outptr = output;
		else if (to_utf8) {
			memcpy (output, utf8, utf8left);
			outptr = output + utf8left;
			outleft = utf8left;
			utf8left = 0;
		} else if (utf8left) {
			outptr = output;
			outleft = buf_size;
			utf8ptr = utf8;
			n2 = iconv (cd, (ICONV_CONST char **) &utf8ptr,
			            &utf8left, &outptr, &outleft);
			outleft = buf_size - outleft;
			if (n2 == (size_t) -1)
				handle_iconv_errors = errno;

			if (n2 == (size_t) -1 && errno == EILSEQ &&
			    ignore_errors)
				errno = 0;
		} else
			/* We appear to have converted some input text, but
			 * not actually ended up with any UTF-8 text.  This
			 * is odd.  However, we can at least continue round
			 * the loop, skip the input text we converted, and
			 * then we should get a different result next time.
			 */
			outptr = output;

		if (outptr != output) {
			/* We have something to write out. */
			if (add_output (output, outleft, outbuf) != 0) {
				ret = TRIED_ICONV_FATAL;
				goto out;
			}
		}

		if (!to_utf8 && n2 != (size_t) -1) {
			/* All the UTF-8 text we have so far was processed.
			 * For state-dependent character sets we have to
			 * flush the state now.
			 */
			outptr = output;
			outleft = buf_size;
			iconv (cd, NULL, NULL, &outptr, &outleft);
			outleft = buf_size - outleft;

			if (outptr != output) {
				/* We have something to write out. */
				if (add_output (output, outleft, outbuf) !=
				    0) {
					ret = TRIED_ICONV_FATAL;
					goto out;
				}
			}
		} else if (handle_iconv_errors) {
			intmax_t error_pos;

			if (handle_iconv_errors == EILSEQ && !ignore_errors) {
				if (!quiet) {
					error_pos = input_pos +
					            locate_error (
					                    try_from_code,
					                    input, input_size,
					                    utf8, buf_size);
					error (0, handle_iconv_errors,
					       "byte %jd: iconv", error_pos);
				}
				ret = TRIED_ICONV_FATAL;
				goto out;
			} else if (handle_iconv_errors == EINVAL &&
			           input_size < buf_size) {
				if (!quiet) {
					error_pos = input_pos +
					            locate_error (
					                    try_from_code,
					                    input, input_size,
					                    utf8, buf_size);
					error (0, 0, "byte %jd: %s", error_pos,
					       _ ("iconv: incomplete "
					          "character "
					          "at end of buffer"));
				}
				ret = TRIED_ICONV_FATAL;
				goto out;
			}
		}

		if (inptr != input) {
			decompress_peek_skip (decomp, input_size - inleft);
			input_pos += input_size - inleft;
		}

		/* Unless we have some UTF-8 text left (which will only
		 * happen if the output encoding is more verbose than UTF-8,
		 * so is unlikely for legacy encodings), we need to fetch
		 * more input text now.
		 */
		if (!utf8left) {
			input_size = buf_size;
			input = decompress_peek (decomp, &input_size);
			while (input_size < buf_size) {
				size_t old_input_size = input_size;
				input_size = buf_size;
				input = decompress_peek (decomp, &input_size);
				if (input_size == old_input_size)
					break;
			}
		}
	}

out:
	if (!to_utf8)
		iconv_close (cd);
	iconv_close (cd_utf8);
	free (try_to_code);

	return ret;
}

int manconv (decompress *decomp, gl_list_t from, const char *to,
             struct manconv_outbuf *outbuf)
{
	char *pp_encoding;
	const char *try_from_code;
	char *plain_to, *modified_pp_line = NULL;
	tried_iconv tried;
	int ret = 0;

	plain_to = xstrndup (to, strcspn (to, "/"));
	pp_encoding = check_preprocessor_encoding (decomp, plain_to,
	                                           &modified_pp_line);
	if (pp_encoding) {
		if (modified_pp_line) {
			size_t len = strlen (modified_pp_line);
			decompress_readline (decomp);
			if (add_output (modified_pp_line, len, outbuf) != 0) {
				ret = -1;
				goto out;
			}
		}
		tried = try_iconv (decomp, pp_encoding, to, 1, outbuf);
		if (tried == TRIED_ICONV_FATAL)
			ret = -1;
	} else {
		GL_LIST_FOREACH (from, try_from_code) {
			bool last = !gl_list_next_node (from, from_node);
			tried = try_iconv (decomp, try_from_code, to, last,
			                   outbuf);
			if (tried == TRIED_ICONV_OK)
				break;
			else if (tried == TRIED_ICONV_FATAL) {
				ret = -1;
				goto out;
			}
		}
	}

out:
	free (modified_pp_line);
	free (pp_encoding);
	free (plain_to);
	return ret;
}

#else /* !HAVE_ICONV */

/* If we don't have iconv, there isn't much we can do; just pass everything
 * through unchanged.
 */
int manconv (decompress *decomp, gl_list_t from MAYBE_UNUSED,
             const char *to MAYBE_UNUSED, struct manconv_outbuf *outbuf)
{
	for (;;) {
		size_t len = 4096;
		const char *buffer = decompress_read (decomp, &len);
		if (len == 0)
			break;
		if (add_output (buffer, len, outbuf) != 0)
			return -1;
	}
	return 0;
}

#endif /* HAVE_ICONV */
