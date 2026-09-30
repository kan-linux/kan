/*
 * filenames.h: Interface to composing and dissecting man page file names
 *
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
 */

#ifndef MAN_FILENAMES_H
#define MAN_FILENAMES_H

#include <stdbool.h>

#include "timespec.h"

struct mandata {
	/* Name of page, if not equal to the key. */
	char *name;
	/* Filename extension without compression extension. */
	char *ext;
	/* Section name/number. */
	char *sec;
	/* ID (i.e. type) of this entry. */
	char id;
	/* ID-related file pointer. */
	char *pointer;
	/* Compression extension. */
	char *comp;
	/* Filters needed for the page. */
	char *filter;
	/* Whatis description for the page. */
	char *whatis;
	/* Modification time for file. */
	struct timespec mtime;
};

extern char *make_filename (const char *path, const char *name,
                            struct mandata *in, const char *type);
extern struct mandata *filename_info (const char *file, bool warn_if_bogus);
extern void free_mandata_struct (struct mandata *pinfo);

#endif /* MAN_FILENAMES_H */
