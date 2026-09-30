/*
 * compression.c: code to find decompressor / compression extension
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001-2022 Colin Watson.
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
 *
 * Sat Aug 20 15:01:02 BST 1994  Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "error.h"
#include "xstrndup.h"
#include "xvasprintf.h"

#include "manconfig.h"

#include "appendstr.h"
#include "compression.h"

/*--------------------------------------------------------------------------*/
/* This is where we define the decompressors used to decompress any nroff   */
/* source that we find. All cat pages are compressed with either gzip (if   */
/* available) or compress. This is not the place to define _the_ cat page   */
/* decompressor - see ./manconfig.h for that.                               */
/*                                                                          */
/* To add a decompressor all you need to know is its name (preferably its   */
/* location), and the unique extension that it gives to files compressed    */
/* with it. Here is an example. You have a compressor named foobar and      */
/* compressed files have an extension of .fb . It is located in /usr/bin    */
/* and requires a -d option to be used as a decompressor. Add the following */
/* line to the structure below.                                             */
/*                                                                          */
/* {"/usr/bin/foobar -d", "fb", NULL},                                      */
/*--------------------------------------------------------------------------*/

struct compression comp_list[] = {

/* If we have gzip, incorporate the following */
#ifdef HAVE_GZIP
        {PROG_GUNZIP,     "gz",   NULL},
        {PROG_GUNZIP,     "z",    NULL},
#endif  /* HAVE_GZIP */

/* If we have compress, incorporate the following */
#ifdef HAVE_COMPRESS
        {PROG_UNCOMPRESS, "Z",    NULL},
/* Else if we have gzip, incorporate the following */
#elif defined(HAVE_GZIP)
        {PROG_GUNZIP, "Z", NULL},
#endif  /* HAVE_COMPRESS || HAVE_GZIP */

/* If we have bzip2, incorporate the following */
#ifdef HAVE_BZIP2
        {PROG_BUNZIP2,    "bz2",  NULL},
#endif  /* HAVE_BZIP2 */

/* If we have xz, incorporate the following */
#ifdef HAVE_XZ
        {PROG_UNXZ,       "xz",   NULL},
        {PROG_UNXZ,       "lzma", NULL},
/* Else if we have lzma, incorporate the following */
#elif defined(HAVE_LZMA)
        {PROG_UNLZMA, "lzma", NULL},
#endif  /* HAVE_XZ || HAVE_LZMA */

/* If we have lzip, incorporate the following */
#ifdef HAVE_LZIP
        {PROG_UNLZIP,     "lz",   NULL},
#endif  /* HAVE_LZIP */

/* If we have zstd, incorporate the following */
#ifdef HAVE_ZSTD
        {PROG_UNZSTD,     "zst",  NULL},
        {PROG_UNZSTD,     "zstd", NULL},
#endif  /* HAVE_ZSTD */

        /*------------------------------------------------------*/
        /* Add your decompressor(s) and extension(s) below here */
        /*------------------------------------------------------*/

        /*----------------*/
        /* and above here */
        /*----------------*/

        /* ... and the last structure is */
        {NULL,            NULL,   NULL}
};

/* Take filename as arg, return structure containing decompressor
   and extension, or NULL if no comp extension found.
   If want_stem, set comp->stem to the filename without extension, which
   the caller should free.

   eg.
        filename = /usr/man/man1/foo.1.gz

        comp->prog = "/usr/bin/gzip -dc";
        comp->ext = "gz";
        comp->stem = "/usr/man/man1/foo.1";
 */
struct compression *comp_info (const char *filename, bool want_stem)
{
	const char *ext;
	static struct compression hpux_comp = {PROG_GUNZIP " -S \"\"", "",
	                                       NULL};

	ext = strrchr (filename, '.');

	if (ext) {
		struct compression *comp;
		for (comp = comp_list; comp->ext; comp++) {
			if (strcmp (comp->ext, ext + 1) == 0) {
				if (want_stem)
					comp->stem = xstrndup (filename,
					                       ext - filename);
				else
					comp->stem = NULL;
				return comp;
			}
		}
	}

	if (*PROG_GUNZIP) {
		ext = strstr (filename, ".Z/");
		if (ext) {
			if (want_stem)
				hpux_comp.stem =
				        xstrndup (filename, ext - filename);
			else
				hpux_comp.stem = NULL;
			return &hpux_comp;
		}
	}

	return NULL;
}

/* take filename w/o comp ext. as arg, return comp->stem as a relative
   compressed file or NULL if none found */
struct compression *comp_file (const char *filename)
{
	size_t len;
	char *compfile;
	struct compression *comp;

	compfile = xasprintf ("%s.", filename);
	assert (compfile);
	len = strlen (compfile);

	for (comp = comp_list; comp->ext; comp++) {
		struct stat buf;

		compfile = appendstr (compfile, comp->ext, nullptr);

		if (stat (compfile, &buf) == 0) {
			comp->stem = compfile;
			return comp;
		}

		*(compfile + len) = '\0';
	}
	free (compfile);
	return NULL;
}
