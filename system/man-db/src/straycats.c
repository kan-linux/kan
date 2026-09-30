/*
 * straycats.c: find and process stray cat files
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002, 2003, 2004, 2006, 2007, 2008, 2010, 2011
 *               Colin Watson.
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
 * Tue May  3 21:24:51 BST 1994 Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <dirent.h>
#include <errno.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "canonicalize.h"
#include "dirname.h"
#include "error.h"
#include "gl_array_list.h"
#include "gl_xlist.h"
#include "xalloc.h"

#include "gettext.h"
#define _(String) gettext (String)

#include "manconfig.h"

#include "appendstr.h"
#include "compression.h"
#include "debug.h"
#include "decompress.h"
#include "encodings.h"
#include "filenames.h"
#include "glcontainers.h"
#include "orderfiles.h"
#include "pipeline.h"
#include "sandbox.h"
#include "security.h"
#include "util.h"

#include "db_storage.h"
#include "mydbm.h"

#include "descriptions.h"
#include "lexgrog.h"
#include "manconv_client.h"
#include "manp.h"
#include "straycats.h"
#include "ult_src.h"

static char *catdir, *mandir;

static int check_for_stray (MYDBM_FILE dbf)
{
	DIR *cdir;
	struct dirent *catlist;
	gl_list_t names;
	const char *name;
	size_t lenman, lencat;
	int strays = 0;

	cdir = opendir (catdir);
	if (!cdir) {
		error (0, errno, _ ("can't search directory %s"), catdir);
		return 0;
	}

	names = new_string_list (GL_ARRAY_LIST, false);

	while ((catlist = readdir (cdir)) != NULL) {
		if (*catlist->d_name == '.' &&
		    strlen (catlist->d_name) < (size_t) 3)
			continue;
		gl_list_add_last (names, xstrdup (catlist->d_name));
	}
	closedir (cdir);

	order_files (catdir, &names);

	mandir = appendstr (mandir, "/", nullptr);
	catdir = appendstr (catdir, "/", nullptr);
	lenman = strlen (mandir);
	lencat = strlen (catdir);

	GL_LIST_FOREACH (names, name) {
		struct mandata *info;
		char *ext, *section = NULL;
		short found;
		struct stat buf;
		struct compression *comp;

		info = XZALLOC (struct mandata);

		*(mandir + lenman) = *(catdir + lencat) = '\0';
		mandir = appendstr (mandir, name, nullptr);
		catdir = appendstr (catdir, name, nullptr);

		ext = strrchr (mandir, '.');
		if (!ext) {
			if (quiet < 2)
				error (0, 0,
				       _ ("warning: %s: "
				          "ignoring bogus filename"),
				       catdir);
			goto next;
		} else if (comp_info (ext, false)) {
			*ext = '\0';
			info->comp = xstrdup (ext + 1);
		}

		ext = strrchr (mandir, '.');
		*(mandir + lenman - 1) = '\0';
		section = xstrdup (strrchr (mandir, '/') + 4);
		*(mandir + lenman - 1) = '/';

		/* check for bogosity */

		if (!ext ||
		    strncmp (ext + 1, section, strlen (section)) != 0) {
			if (quiet < 2)
				error (0, 0,
				       _ ("warning: %s: "
				          "ignoring bogus filename"),
				       catdir);
			goto next;
		}

		/*
		 * now that we've stripped off the cat compression
		 * extension (if it has one), we can try some of ours.
		 */

		debug ("Testing for existence: %s\n", mandir);

		if (stat (mandir, &buf) == 0)
			found = 1;
		else if ((comp = comp_file (mandir))) {
			found = 1;
			free (comp->stem);
		} else
			found = 0;

		if (!found) {
			decompress *decomp;
			struct mandata *exists;
			lexgrog lg;
			char *lang, *page_encoding;
			char *mandir_base;
			pipecmd *col_cmd;
			char *col_locale;
			char *fullpath;

			/* we have a straycat. Need to filter it and get
			   its whatis (if necessary)  */

			lg.whatis = 0;
			*(ext++) = '\0';
			info->ext = xstrdup (ext);

			/* see if we already have it, before going any
			   further */
			mandir_base = base_name (mandir);
			exists = dblookup_exact (dbf, mandir_base, info->ext,
			                         true);
			if (exists &&
			    compare_ids (STRAY_CAT, exists->id, false) >= 0)
				goto next_exists;
			debug ("%s(%s) is not in the db.\n", mandir_base,
			       info->ext);

			/* fill in the missing parts of the structure */
			info->sec = xstrdup (section);
			info->id = STRAY_CAT;
			info->filter = xstrdup ("-");
			info->mtime.tv_sec = 0;
			info->mtime.tv_nsec = 0;

			drop_effective_privs ();
			decomp = decompress_open (catdir, 0);
			regain_effective_privs ();
			if (!decomp) {
				error (0, errno, _ ("can't open %s"), catdir);
				goto next_exists;
			}

			lang = lang_dir (mandir);
			page_encoding = get_page_encoding (lang);
			if (page_encoding)
				add_manconv (decompress_get_pipeline (decomp),
				             page_encoding, "UTF-8");
			free (page_encoding);
			free (lang);

			col_cmd = pipecmd_new_argstr (
			        get_def_user ("col", PROG_COL));
			pipecmd_arg (col_cmd, "-bx");
			col_locale = find_charset_locale ("UTF-8");
			if (col_locale) {
				pipecmd_setenv (col_cmd, "LC_CTYPE",
				                col_locale);
				free (col_locale);
			}
			pipecmd_pre_exec (col_cmd, sandbox_load, sandbox_free,
			                  sandbox);
			pipeline_command (decompress_get_pipeline (decomp),
			                  col_cmd);

			fullpath = canonicalize_file_name (catdir);
			if (!fullpath)
				gripe_canonicalize_failed (catdir);
			else {
				char *catdir_base;

				free (fullpath);
				drop_effective_privs ();
				decompress_start (decomp);
				regain_effective_privs ();

				strays++;

				lg.type = CATPAGE;
				catdir_base = base_name (catdir);
				if (find_name_decompressed (
				            decomp, catdir_base, &lg)) {
					gl_list_t descs, trace;
					strays++;
					descs = parse_descriptions (
					        mandir_base, lg.whatis);
					trace = new_string_list (GL_ARRAY_LIST,
					                         true);
					gl_list_add_last (trace,
					                  xstrdup (catdir));
					store_descriptions (dbf, descs, info,
					                    NULL, mandir_base,
					                    trace);
					gl_list_free (trace);
					gl_list_free (descs);
				} else if (quiet < 2)
					error (0, 0,
					       _ ("warning: %s: whatis parse "
					          "for %s(%s) failed"),
					       catdir, mandir_base, info->sec);
				free (catdir_base);
			}

			free (lg.whatis);
			decompress_free (decomp);
next_exists:
			free_mandata_struct (exists);
			free (mandir_base);
		}
next:
		free (section);
		free_mandata_struct (info);
	}
	gl_list_free (names);
	return strays;
}

static int open_catdir (MYDBM_FILE dbf)
{
	DIR *cdir;
	struct dirent *catlist;
	size_t catlen, manlen;
	int strays = 0;

	cdir = opendir (catdir);
	if (!cdir) {
		error (0, errno, _ ("can't search directory %s"), catdir);
		return 0;
	}

	if (!quiet)
		printf (_ ("Checking for stray cats under %s...\n"), catdir);

	catdir = appendstr (catdir, "/", nullptr);
	mandir = appendstr (mandir, "/", nullptr);
	catlen = strlen (catdir);
	manlen = strlen (mandir);

	/* should make this case insensitive */
	while ((catlist = readdir (cdir))) {
		char *t1;

		if (strncmp (catlist->d_name, "cat", 3) != 0)
			continue;

		catdir = appendstr (catdir, catlist->d_name, nullptr);
		mandir = appendstr (mandir, catlist->d_name, nullptr);

		*(t1 = mandir + manlen) = 'm';
		*(t1 + 2) = 'n';

		strays += check_for_stray (dbf);

		*(catdir + catlen) = *(mandir + manlen) = '\0';
	}
	closedir (cdir);
	return strays;
}

int straycats (MYDBM_FILE dbf, const char *manpath)
{
	char *catpath;
	int strays;

	assert (dbf->file);

	catpath = get_catpath (manpath, SYSTEM_CAT | USER_CAT);

	/* look in the usual catpath location */
	mandir = xstrdup (manpath);
	catdir = xstrdup (manpath);
	strays = open_catdir (dbf);

	/* look in the alternate catpath location if we have one
	   and it's different from the usual catpath */

	if (catpath)
		debug ("catpath: %s, manpath: %s\n", catpath, manpath);

	if (catpath && strcmp (catpath, manpath) != 0) {
		*mandir = *catdir = '\0';
		mandir = appendstr (mandir, manpath, nullptr);
		catdir = appendstr (catdir, catpath, nullptr);
		strays += open_catdir (dbf);
	}

	free (mandir);
	free (catdir);

	free (catpath);

	return strays;
}
