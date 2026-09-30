/*
 * manconv_client.c: use manconv in a pipeline
 *
 * Copyright (C) 2007, 2008, 2010 Colin Watson.
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

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "gl_array_list.h"
#include "gl_xlist.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "manconfig.h"

#include "pipeline.h"

#include "appendstr.h"
#include "glcontainers.h"
#include "sandbox.h"
#include "security.h"

#include "decompress.h"
#include "manconv.h"
#include "manconv_client.h"
#include "utf8.h"

struct manconv_codes {
	gl_list_t from;
	char *to;
};

static void manconv_stdin (void *data)
{
	struct manconv_codes *codes = data;
	decompress *decomp;

	decomp = decompress_fdopen (dup (STDIN_FILENO));
	decompress_start (decomp);
	if (manconv (decomp, codes->from, codes->to, NULL) != 0)
		/* manconv already wrote an error message to stderr.  Just
		 * exit non-zero.
		 */
		exit (FATAL);
	decompress_wait (decomp);
	decompress_free (decomp);
}

static void manconv_pre_exec (void *data)
{
	/* We must drop privileges before loading the sandbox, since our
	 * seccomp filter doesn't allow setresuid and friends.
	 */
	drop_privs (NULL);
	sandbox_load (data);
}

static void free_manconv_codes (void *data)
{
	struct manconv_codes *codes = data;

	gl_list_free (codes->from);
	free (codes->to);
	free (codes);
}

void add_manconv (pipeline *p, const char *source_encoding,
                  const char *target_encoding)
{
	struct manconv_codes *codes;
	char *name;
	pipecmd *cmd;

	if (STREQ (source_encoding, target_encoding))
		return;

	codes = xmalloc (sizeof *codes);
	/* informational only; no shell quoting concerns */
	name = xasprintf ("%s -f ", MANCONV);
	codes->from = new_string_list (GL_ARRAY_LIST, true);
	if (STREQ (source_encoding, "UTF-8")) {
		gl_list_add_last (codes->from, xstrdup (source_encoding));
		name = appendstr (name, source_encoding, nullptr);
	} else {
		gl_list_add_last (codes->from, xstrdup ("UTF-8"));
		gl_list_add_last (codes->from, xstrdup (source_encoding));
		name = appendstr (name, "UTF-8:", source_encoding, nullptr);
	}
	codes->to = xasprintf ("%s//IGNORE", target_encoding);
	/* informational only; no shell quoting concerns */
	name = appendstr (name, " -t ", codes->to, nullptr);
	if (quiet >= 2)
		name = appendstr (name, " -q", nullptr);

	/* iconv_open may not work correctly in setuid processes; in GNU
	 * libc, gconv modules may be linked against other gconv modules and
	 * rely on RPATH $ORIGIN to load those modules from the correct
	 * path, but $ORIGIN is disabled in setuid processes.  It is
	 * impossible to reset libc's idea of setuidness without creating a
	 * whole new process image.  Therefore, if the calling process is
	 * setuid, we must drop privileges and execute manconv.
	 */
	if (running_setuid ()) {
		gl_list_t from = codes->from;
		const char *from_code;
		char *sources = NULL;

		cmd = pipecmd_new_args (MANCONV, "-f", nullptr);
		GL_LIST_FOREACH (from, from_code) {
			sources = appendstr (sources, from_code, nullptr);
			if (gl_list_next_node (from, from_node))
				sources = appendstr (sources, ":", nullptr);
		}
		pipecmd_arg (cmd, sources);
		free (sources);
		pipecmd_args (cmd, "-t", codes->to, nullptr);
		if (quiet >= 2)
			pipecmd_arg (cmd, "-q");
		pipecmd_pre_exec (cmd, manconv_pre_exec, sandbox_free,
		                  sandbox);
		free_manconv_codes (codes);
	} else {
		cmd = pipecmd_new_function (name, &manconv_stdin,
		                            &free_manconv_codes, codes);
		pipecmd_pre_exec (cmd, sandbox_load, sandbox_free, sandbox);
	}
	free (name);
	pipeline_command (p, cmd);
}

/* Convert the result of in-process decompression to a target encoding.
 *
 * This converts the buffered result of decompression to a new buffer, then
 * replaces the decompress object's buffer with the converted one for use by
 * later stages of processing.
 *
 * Returns zero on success or non-zero on failure.
 */
int manconv_inprocess (decompress *d, const char *source_encoding,
                       const char *target_encoding)
{
	gl_list_t from;
	char *to;
	struct manconv_outbuf outbuf;
	int ret = 0;

	if (STREQ (source_encoding, target_encoding))
		return 0;

	from = new_string_list (GL_ARRAY_LIST, true);
	if (STREQ (source_encoding, "UTF-8"))
		gl_list_add_last (from, xstrdup (source_encoding));
	else {
		if (STREQ (target_encoding, "UTF-8")) {
			/* If the target encoding is UTF-8, then instead of
			 * starting with trial conversion from UTF-8 to
			 * UTF-8, we can start by simply performing UTF-8
			 * validation, avoiding a copy.  (The source
			 * encoding cannot be UTF-8 in this case, since we
			 * already checked that the source and target
			 * encodings are different.)
			 */
			if (utf8_validate_len (decompress_inprocess_buf (d),
			                       decompress_inprocess_len (d)))
				goto out;
		} else
			gl_list_add_last (from, xstrdup ("UTF-8"));
		gl_list_add_last (from, xstrdup (source_encoding));
	}
	to = xasprintf ("%s//IGNORE", target_encoding);

	outbuf.len = 0;
	/* UTF-8 uses at most four bytes per Unicode code point.  We assume
	 * that this conversion will be no worse than 1:4.
	 */
	outbuf.max = decompress_inprocess_len (d) * 4;
	outbuf.buf = xmalloc (outbuf.max);

	if (manconv (d, from, to, &outbuf) == 0)
		decompress_inprocess_replace (d, outbuf.buf, outbuf.len);
	else {
		/* manconv already wrote an error message to stderr.  Just
		 * return non-zero.
		 */
		free (outbuf.buf);
		ret = -1;
	}

	free (to);
out:
	gl_list_free (from);
	return ret;
}
