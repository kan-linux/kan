/*
 * decompress.c: decompression abstraction layer
 *
 * Copyright (C) 2007, 2008 Colin Watson.
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

#include <assert.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#ifdef HAVE_LIBZ
#  include "zlib.h"
#endif /* HAVE_LIBZ */

#include "pipeline.h"

#include "attribute.h"
#include "minmax.h"
#include "xalloc.h"
#include "xstrndup.h"
#include "xvasprintf.h"

#include "manconfig.h"

#include "compression.h"
#include "sandbox.h"

#include "decompress.h"

enum decompress_tag {
	DECOMPRESS_PIPELINE,
	DECOMPRESS_INPROCESS
};

struct decompress_inprocess {
	char *buf;
	size_t len;
	size_t offset;
	char *line_cache;
};

struct decompress {
	enum decompress_tag tag;
	union {
		pipeline *p;
		struct decompress_inprocess inprocess;
	} u;
};

/* Create a new pipeline-based decompressor.  Takes ownership of p. */
static decompress *decompress_new_pipeline (pipeline *p)
{
	decompress *d = XMALLOC (decompress);

	d->tag = DECOMPRESS_PIPELINE;
	d->u.p = p;

	return d;
}

#ifdef HAVE_LIBZ

/* Create a new in-process decompressor.  Takes ownership of buf. */
static decompress *decompress_new_inprocess (char *buf, size_t len)
{
	decompress *d = XMALLOC (decompress);

	d->tag = DECOMPRESS_INPROCESS;
	d->u.inprocess.buf = buf;
	d->u.inprocess.len = len;
	d->u.inprocess.offset = 0;
	d->u.inprocess.line_cache = NULL;

	return d;
}

static void decompress_zlib (void *data MAYBE_UNUSED)
{
	gzFile zlibfile;
	int fd;

	fd = dup (STDIN_FILENO);
	if (fd < 0)
		return;

	zlibfile = gzdopen (fd, "r");
	if (!zlibfile) {
		close (fd);
		return;
	}

	for (;;) {
		char buffer[4096];
		int r = gzread (zlibfile, buffer, 4096);
		if (r <= 0)
			break;
		if (fwrite (buffer, 1, (size_t) r, stdout) < (size_t) r)
			break;
	}

	gzclose (zlibfile);
	return;
}

/* The largest number of uncompressed bytes we're prepared to read into
 * memory.  (We actually allow at most one fewer byte than this, for easy
 * EOF detection.)
 *
 * At the time of writing, 11 out of 27959 (0.04%) installed manual pages on
 * the author's system were larger than this.
 *
 * We could lift this restriction if we streamed in-process decompression
 * instead, but that's a bit complicated: we'd also need to stream encoding
 * conversion, and there's relatively little point until lexgrog can rely on
 * preprocessor header lines rather than having to scan the whole file for
 * preprocessor indications.  For the time being, one-shot buffering is
 * cheap enough and much simpler.
 */
#  define MAX_INPROCESS 1048576

static decompress *decompress_try_zlib (const char *filename)
{
	gzFile zlibfile;
	/* We only ever call this from the parent process (and don't
	 * currently use threads), and this lets us skip per-file memory
	 * allocation.
	 */
	static char buffer[MAX_INPROCESS];
	int len = 0;

	zlibfile = gzopen (filename, "r");
	if (!zlibfile)
		return NULL;

	while (len < MAX_INPROCESS) {
		/* Read one more byte than we're prepared to return, in
		 * order to detect EOF at the right position.  The "len >=
		 * MAX_INPROCESS" check below catches the boundary case.
		 */
		int r = gzread (zlibfile, buffer + len, MAX_INPROCESS - len);
		if (r < 0) {
			gzclose (zlibfile);
			return NULL;
		} else if (r == 0)
			break;
		else
			len += r;
	}

	gzclose (zlibfile);
	if (len >= MAX_INPROCESS)
		return NULL;
	/* Copy input data so that we don't have potential data corruption
	 * if more than one in-process decompressor is active at once.  (An
	 * alternative might be to use a lock to prevent that situation.)
	 */
	return decompress_new_inprocess (xmemdup (buffer, (size_t) len),
	                                 (size_t) len);
}

#  define OPEN_FLAGS_UNUSED
#else /* !HAVE_LIBZ */
#  define OPEN_FLAGS_UNUSED MAYBE_UNUSED
#endif /* HAVE_LIBZ */

decompress *decompress_open (const char *filename, int flags OPEN_FLAGS_UNUSED)
{
	pipecmd *cmd;
	pipeline *p;
	struct stat st;
#ifdef HAVE_LIBZ
	size_t filename_len;
#endif /* HAVE_LIBZ */
	char *ext;
	struct compression *comp;

	if (stat (filename, &st) < 0 || S_ISDIR (st.st_mode))
		return NULL;

#ifdef HAVE_LIBZ
	filename_len = strlen (filename);
	if (filename_len > 3 && STREQ (filename + filename_len - 3, ".gz")) {
		if (flags & DECOMPRESS_ALLOW_INPROCESS) {
			decompress *d = decompress_try_zlib (filename);
			if (d)
				return d;
		}

		cmd = pipecmd_new_function ("zcat", &decompress_zlib, NULL,
		                            NULL);
		pipecmd_pre_exec (cmd, sandbox_load, sandbox_free, sandbox);
		p = pipeline_new_commands (cmd, nullptr);
		goto got_pipeline;
	}
#endif /* HAVE_LIBZ */

	ext = strrchr (filename, '.');
	if (ext) {
		++ext;

		for (comp = comp_list; comp->ext; ++comp) {
			if (!STREQ (comp->ext, ext))
				continue;

			cmd = pipecmd_new_argstr (comp->prog);
			pipecmd_pre_exec (cmd, sandbox_load, sandbox_free,
			                  sandbox);
			p = pipeline_new_commands (cmd, nullptr);
			goto got_pipeline;
		}
	}

#ifdef HAVE_GZIP
	/* HP-UX */
	ext = strstr (filename, ".Z/");
	if (ext) {
		cmd = pipecmd_new_argstr (PROG_GUNZIP);
		pipecmd_pre_exec (cmd, sandbox_load, sandbox_free, sandbox);
		p = pipeline_new_commands (cmd, nullptr);
		goto got_pipeline;
	}
#endif

	p = pipeline_new ();

got_pipeline:
	pipeline_want_infile (p, filename);
	pipeline_want_out (p, -1);
	return decompress_new_pipeline (p);
}

decompress *decompress_fdopen (int fd)
{
	pipeline *p;
#ifdef HAVE_LIBZ
	pipecmd *cmd;
#endif /* HAVE_LIBZ */

#ifdef HAVE_LIBZ
	cmd = pipecmd_new_function ("zcat", &decompress_zlib, NULL, NULL);
	pipecmd_pre_exec (cmd, sandbox_load, sandbox_free, sandbox);
	p = pipeline_new_commands (cmd, nullptr);
#else  /* HAVE_LIBZ */
	p = pipeline_new ();
#endif /* HAVE_LIBZ */

	pipeline_want_in (p, fd);
	pipeline_want_out (p, -1);
	return decompress_new_pipeline (p);
}

bool ATTRIBUTE_PURE decompress_is_pipeline (const decompress *d)
{
	return d->tag == DECOMPRESS_PIPELINE;
}

pipeline *ATTRIBUTE_PURE decompress_get_pipeline (decompress *d)
{
	assert (d->tag == DECOMPRESS_PIPELINE);
	return d->u.p;
}

const char *ATTRIBUTE_PURE decompress_inprocess_buf (decompress *d)
{
	assert (d->tag == DECOMPRESS_INPROCESS);
	return d->u.inprocess.buf;
}

size_t ATTRIBUTE_PURE decompress_inprocess_len (decompress *d)
{
	assert (d->tag == DECOMPRESS_INPROCESS);
	return d->u.inprocess.len;
}

void decompress_inprocess_replace (decompress *d, char *buf, size_t len)
{
	assert (d->tag == DECOMPRESS_INPROCESS);

	free (d->u.inprocess.line_cache);
	free (d->u.inprocess.buf);

	d->u.inprocess.buf = buf;
	d->u.inprocess.len = len;
	d->u.inprocess.offset = 0;
	d->u.inprocess.line_cache = NULL;
}

void decompress_start (decompress *d)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		pipeline_start (d->u.p);
}

const char *decompress_read (decompress *d, size_t *len)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		return pipeline_read (d->u.p, len);
	else {
		const char *ret;
		assert (d->tag == DECOMPRESS_INPROCESS);
		*len = MIN (*len, d->u.inprocess.len - d->u.inprocess.offset);
		ret = d->u.inprocess.buf + d->u.inprocess.offset;
		d->u.inprocess.offset += *len;
		return ret;
	}
}

const char *decompress_peek (decompress *d, size_t *len)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		return pipeline_peek (d->u.p, len);
	else {
		assert (d->tag == DECOMPRESS_INPROCESS);
		*len = MIN (*len, d->u.inprocess.len - d->u.inprocess.offset);
		return d->u.inprocess.buf + d->u.inprocess.offset;
	}
}

void decompress_peek_skip (decompress *d, size_t len)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		pipeline_peek_skip (d->u.p, len);
	else {
		assert (d->tag == DECOMPRESS_INPROCESS);
		assert (len <= d->u.inprocess.len - d->u.inprocess.offset);
		d->u.inprocess.offset += len;
	}
}

const char *decompress_readline (decompress *d)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		return pipeline_readline (d->u.p);
	else {
		const char *cur, *end;
		assert (d->tag == DECOMPRESS_INPROCESS);
		/* This isn't on the hot path (only called for a few lines
		 * at the start of the file), so we can afford to
		 * reallocate.
		 */
		if (d->u.inprocess.line_cache) {
			free (d->u.inprocess.line_cache);
			d->u.inprocess.line_cache = NULL;
		}
		cur = d->u.inprocess.buf + d->u.inprocess.offset;
		end = memchr (cur, '\n',
		              d->u.inprocess.len - d->u.inprocess.offset);
		if (end) {
			d->u.inprocess.line_cache =
			        xstrndup (cur, end - cur + 1);
			d->u.inprocess.offset += end - cur + 1;
			return d->u.inprocess.line_cache;
		} else
			return NULL;
	}
}

const char *decompress_peekline (decompress *d)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		return pipeline_peekline (d->u.p);
	else {
		const char *cur, *end;
		assert (d->tag == DECOMPRESS_INPROCESS);
		/* This isn't on the hot path (only called for a few lines
		 * at the start of the file), so we can afford to
		 * reallocate.
		 */
		if (d->u.inprocess.line_cache) {
			free (d->u.inprocess.line_cache);
			d->u.inprocess.line_cache = NULL;
		}
		cur = d->u.inprocess.buf + d->u.inprocess.offset;
		end = memchr (cur, '\n',
		              d->u.inprocess.len - d->u.inprocess.offset);
		if (end) {
			d->u.inprocess.line_cache =
			        xstrndup (cur, end - cur + 1);
			return d->u.inprocess.line_cache;
		} else
			return NULL;
	}
}

int decompress_wait (decompress *d)
{
	if (d->tag == DECOMPRESS_PIPELINE)
		return pipeline_wait (d->u.p);
	else {
		assert (d->tag == DECOMPRESS_INPROCESS);
		return 0;
	}
}

void decompress_free (decompress *d)
{
	if (!d)
		return;
	if (d->tag == DECOMPRESS_PIPELINE)
		pipeline_free (d->u.p);
	else {
		assert (d->tag == DECOMPRESS_INPROCESS);
		free (d->u.inprocess.line_cache);
		free (d->u.inprocess.buf);
	}
	free (d);
}
