/*
 * decompress.h: interface to decompression abstraction layer
 *
 * Copyright (C) 2007 Colin Watson.
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

#ifndef MAN_DECOMPRESS_H
#define MAN_DECOMPRESS_H

#include <stdbool.h>

#include "pipeline.h"

#include "sandbox.h"

struct decompress;
typedef struct decompress decompress;

/* Flags, combined using bitwise-or. */
enum {
	/* Allow the resulting decompressor to be constructed by reading and
	 * buffering the decompressed file contents in-process, rather than
	 * by starting a subprocess and streaming the output.  This is
	 * suitable if and only if the file contents are only going to be
	 * handled in-process rather than being passed as input to some
	 * other program, but if that is the case then this is a significant
	 * optimization.
	 */
	DECOMPRESS_ALLOW_INPROCESS = 1
};

extern man_sandbox *sandbox;

/* Open a decompressor reading from FILENAME.  The caller must start the
 * resulting decompressor.  If the DECOMPRESS_ALLOW_INPROCESS flag is given,
 * then the resulting decompressor may be in-process (in which case
 * decompress_get_pipeline will fail).
 */
decompress *decompress_open (const char *filename, int flags);

/* Open a decompressor reading from file descriptor FD.  The caller must
 * start the resulting decompressor.  This always uses pipeline-based
 * decompression, since if it attempted to decompress data in process it
 * would be unable to recover if it found that the data was too large.
 */
decompress *decompress_fdopen (int fd);

/* Return true if and only if this is a pipeline-based decompressor. */
bool decompress_is_pipeline (const decompress *d);

/* Get the pipeline corresponding to a decompressor.  Raises an assertion
 * failure if this is not a pipeline-based decompressor.
 */
pipeline *decompress_get_pipeline (decompress *d);

/* Return the start of the buffer stored in an in-process decompressor.
 * Raises an assertion failure if this is not an in-process decompressor.
 */
const char *decompress_inprocess_buf (decompress *d);

/* Return the total number of uncompressed bytes stored in an in-process
 * decompressor.  Raises an assertion failure if this is not an in-process
 * decompressor.
 */
size_t decompress_inprocess_len (decompress *d);

/* Replace an in-process decompressor's entire buffered file contents.
 *
 * In-process decompression works by buffering the whole file in memory,
 * which works because we constrain it to only ever dealing with small
 * files, and allows us to emulate streaming without having to resort to
 * subprocesses, threads, or coroutines.  However, there are some cases
 * (notably encoding conversion) where it's useful to be able to do some
 * kind of processing on the file contents in a way that similarly looks
 * like streaming to its consumers.  To allow for this, we allow consumers
 * of decompressed data to replace the buffered file contents and reset the
 * read offset so that their consumers in turn get the same useful read/peek
 * API.
 *
 * This is of course a hack, and wouldn't be a wise thing to include in a
 * general-purpose library API, but this is only used within man-db.
 */
void decompress_inprocess_replace (decompress *d, char *buf, size_t len);

/* Start the processes in a pipeline-based decompressor.  Does nothing for
 * in-process decompressors.
 */
void decompress_start (decompress *d);

/* Read len bytes of data from the decompressor, returning the data block.
 * len is updated with the number of bytes read.
 */
const char *decompress_read (decompress *d, size_t *len);

/* Look ahead in the decompressor's output for len bytes of data, returning
 * the data block.  len is updated with the number of bytes read.  The
 * starting position of the next read or peek is not affected by this call.
 */
const char *decompress_peek (decompress *d, size_t *len);

/* Skip over and discard len bytes of data from the peek cache. Asserts that
 * enough data is available to skip, so you may want to check using
 * pipeline_peek_size first.
 */
void decompress_peek_skip (decompress *d, size_t len);

/* Read a line of data from the decompressor, returning it. */
const char *decompress_readline (decompress *d);

/* Look ahead in the decompressor's output for a line of data, returning it.
 * The starting position of the next read or peek is not affected by this
 * call.
 */
const char *decompress_peekline (decompress *d);

/* Wait for a decompressor to complete and return its combined exit status.
 * For in-process decompressors, simply returns 0.
 */
int decompress_wait (decompress *d);

/* Destroy a decompressor.  Safely does nothing on NULL.  For pipeline-based
 * decompressors, may wait for the pipeline to complete if it has not already
 * done so.
 */
void decompress_free (decompress *d);

#endif /* MAN_DECOMPRESS_H */
