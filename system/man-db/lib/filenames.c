/*
 * filenames.c: compose and dissect man page file names
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002 Colin Watson.
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

#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "dirname.h"
#include "error.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "gettext.h"
#define _(String) gettext (String)

#include "manconfig.h"

#include "appendstr.h"
#include "compression.h"
#include "debug.h"
#include "filenames.h"

static void gripe_bogus_manpage (const char *manpage)
{
	error (0, 0, _ ("warning: %s: ignoring bogus filename"), manpage);
}

char *make_filename (const char *path, const char *name, struct mandata *in,
                     const char *type)
{
	static char *file;

	if (!name)
		name = in->name; /* comes from dblookup(), so non-NULL */

	file = xasprintf ("%s/%s%s/%s.%s", path, type, in->sec, name, in->ext);

	if (in->comp && *in->comp != '-') /* Is there an extension? */
		file = appendstr (file, ".", in->comp, nullptr);

	debug ("Checking physical location: %s\n", file);
	if (!CAN_ACCESS (file, R_OK)) {
		free (file);
		return NULL;
	}

	return file;
}

/* Fill in a mandata structure with information about a file name.
 * file is the name to examine. info points to the structure to be filled
 * in.
 *
 * Returns either a pointer to the buffer which the fields in info point
 * into, to be freed by the caller, or NULL on error. The buffer will
 * contain either three or four null-terminated strings: the directory name,
 * the base of the file name in that directory, the section extension, and
 * optionally the compression extension.
 *
 * Only the fields name, ext, sec, and comp are filled in by this function.
 */
struct mandata *filename_info (const char *file, bool warn_if_bogus)
{
	struct mandata *info;
	char *basename, *dirname;
	struct compression *comp;

	info = XZALLOC (struct mandata);

	basename = base_name (file);

	/* Bogus files either have (i) no period, ie no extension, (ii)
	   a compression extension, but no sectional extension, (iii)
	   a mismatch between the section they are under and the
	   sectional part of their extension. */

	comp = comp_info (basename, true);
	if (comp) {
		info->comp = xstrdup (comp->ext);
		*(basename + strlen (comp->stem)) = '\0';
		free (comp->stem);
	} else
		info->comp = NULL;

	{
		char *ext = strrchr (basename, '.');
		if (!ext) {
			/* no section extension */
			if (warn_if_bogus)
				gripe_bogus_manpage (file);
			free (basename);
			free_mandata_struct (info);
			return NULL;
		}
		*ext++ = '\0'; /* set section ext */
		info->ext = xstrdup (ext);
		if (!*info->ext) {
			/* zero-length section extension */
			if (warn_if_bogus)
				gripe_bogus_manpage (file);
			free (basename);
			free_mandata_struct (info);
			return NULL;
		}
	}

	/* Set section name. */
	dirname = dir_name (file);
	info->sec = xstrdup (strrchr (dirname, '/') + 4);
	free (dirname);

	if (strlen (info->sec) >= 1 && strlen (info->ext) >= 1 &&
	    info->sec[0] != info->ext[0]) {
		/* mismatch in section */
		if (warn_if_bogus)
			gripe_bogus_manpage (file);
		free (basename);
		free_mandata_struct (info);
		return NULL;
	}

	info->name = xstrdup (basename);

	return info;
}

/* Free a mandata structure and its elements. */
void free_mandata_struct (struct mandata *pinfo)
{
	if (pinfo) {
		free (pinfo->name);
		free (pinfo->ext);
		free (pinfo->sec);
		free (pinfo->pointer);
		free (pinfo->comp);
		free (pinfo->filter);
		free (pinfo->whatis);
	}
	free (pinfo);
}
