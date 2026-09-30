/*
 * ult_src.c: Find the ultimate source of a page
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002, 2003, 2004, 2006, 2007, 2008, 2009, 2010, 2011,
 *               2012 Colin Watson.
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
 * code to seek out the original (ultimate) source man file for
 * any specified man file. Soft and hard links and .so inclusions
 * are traced. Use: reduce amount of cat files to a minimum.
 *
 * Mon May  2 11:14:28 BST 1994 Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <ctype.h>
#include <dirent.h>
#include <errno.h>
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
#include "gl_hash_map.h"
#include "gl_xlist.h"
#include "gl_xmap.h"
#include "xalloc.h"
#include "xstrndup.h"
#include "xvasprintf.h"

#include "gettext.h"
#define _(String) gettext (String)

#include "manconfig.h"

#include "compression.h"
#include "debug.h"
#include "glcontainers.h"

#include "decompress.h"
#include "ult_src.h"

void gripe_canonicalize_failed (const char *path)
{
	if (quiet < 2) {
		if (errno == ENOENT)
			error (0, 0, _ ("warning: %s is a dangling symlink"),
			       path);
		else
			error (0, errno, _ ("can't resolve %s"), path);
	}
}

/* Find minimum value hard link filename for given file and inode.
 * Returns a newly allocated string.
 */
static char *ult_hardlink (const char *fullpath, ino_t inode)
{
	DIR *mdir;
	struct dirent *manlist;
	char *base, *dir, *ret;
	const char *slash;

	slash = strrchr (fullpath, '/');
	assert (slash);
	dir = xstrndup (fullpath, slash - fullpath);
	base = xstrdup (++slash);

	mdir = opendir (dir);
	if (mdir == NULL) {
		if (quiet < 2)
			error (0, errno, _ ("can't search directory %s"), dir);
		free (dir);
		free (base);
		return NULL;
	}

	while ((manlist = readdir (mdir))) {
		if (manlist->d_ino == inode &&
		    strcmp (base, manlist->d_name) > 0) {
			free (base);
			base = xstrdup (manlist->d_name);
			debug ("ult_hardlink: (%s)\n", base);
		}
	}
	closedir (mdir);

	/* If we already are the link with the smallest name value */
	/* return NULL */

	if (strcmp (base, slash) == 0) {
		free (dir);
		free (base);
		return NULL;
	}

	ret = xasprintf ("%s/%s", dir, base);
	free (dir);
	free (base);
	return ret;
}

/* Resolve all symbolic links within 'fullpath'.
 * Returns a newly allocated string.
 */
static char *ult_softlink (const char *fullpath)
{
	char *resolved_path;

	resolved_path = canonicalize_file_name (fullpath);
	if (!resolved_path) {
		/* discard the unresolved path */
		gripe_canonicalize_failed (fullpath);
		return NULL;
	}

	debug ("ult_softlink: (%s)\n", resolved_path);

	return resolved_path;
}

static char *find_include_directive (char *path)
{
	decompress *decomp;
	const char *buffer;
	char *directive;

	decomp = decompress_open (path, DECOMPRESS_ALLOW_INPROCESS);
	if (!decomp) {
		if (quiet < 2)
			error (0, errno, _ ("can't open %s"), path);
		return NULL;
	}
	decompress_start (decomp);

	/* make sure that we skip over any comments */
	do {
		buffer = decompress_readline (decomp);
	} while (buffer && STRNEQ (buffer, ".\\\"", 3));

	directive = xstrdup (buffer ? buffer : "");

	decompress_wait (decomp);
	decompress_free (decomp);

	return directive;
}

/* Test 'buffer' to see if it contains a .so include. If so and it's not an
 * absolute filename, return newly allocated string whose contents are the
 * include.
 */
static char *test_for_include (const char *buffer)
{
	if (!buffer)
		return NULL;

	/* strip out any leading whitespace (if any) */
	while (CTYPE (isspace, *buffer))
		buffer++;

	/* see if the `command' is a .so */
	if (strncmp (buffer, ".so", 3) == 0) {
		buffer += 3;

		/* strip out any whitespace between the command and
		   its argument */
		while (CTYPE (isspace, *buffer))
			buffer++;

		/* If .so's argument is an absolute filename, it could be
		 * either (i) a macro inclusion, (ii) a non local manual page
		 * or (iii) a (somewhat bogus) reference to a local manual
		 * page.
		 *
		 * If (i) or (ii), we must not follow the reference. (iii) is
		 * a problem with the manual page, thus we don't want to
		 * follow any absolute inclusions in our quest for the
		 * ultimate source file */
		if (*buffer != '/') {
			const char *end = buffer;
			while (*end && !CTYPE (isspace, *end))
				++end;
			return xstrndup (buffer, end - buffer);
		}
	}
	return NULL;
}

static char *find_include (const char *name, const char *path,
                           const char *include)
{
	char *target;
	struct compression *comp;

	/* Restore the original path from before ult_softlink() etc., in
	 * case it went outside the mantree.
	 */
	target = xasprintf ("%s/%s", path, include);
	assert (target);

	/* If the original path from above doesn't exist, try to create new
	 * path as if the "include" was relative to the current man page.
	 */
	if (!CAN_ACCESS (target, F_OK)) {
		comp = comp_file (target);
		free (target);
		if (comp) {
			target = comp->stem;
			comp->stem = NULL; /* steal memory */
		} else
			target = NULL;
	}

	if (!target) {
		char *dirname = dir_name (name);
		char *temp_file = xasprintf ("%s/%s", dirname, include);
		assert (temp_file);
		free (dirname);

		if (CAN_ACCESS (temp_file, F_OK))
			/* Just plain include. */
			target = xstrdup (temp_file);
		else {
			comp = comp_file (temp_file);
			if (comp) {
				target = comp->stem;
				comp->stem = NULL; /* steal memory */
			}
		}
		free (temp_file);
	}

	if (target) {
		char *canonicalized = canonicalize_file_name (target);
		if (canonicalized)
			return canonicalized;
		else {
			gripe_canonicalize_failed (target);
			free (target);
			return NULL;
		}
	} else {
		if (quiet < 2)
			error (0, 0, _ ("can't resolve %s"), include);
		return NULL;
	}
}

struct ult_key {
	char *name;
	int flags;
};

static struct ult_key *ult_key_new (const char *name, int flags)
{
	struct ult_key *ukey = XMALLOC (struct ult_key);
	ukey->name = xstrdup (name);
	ukey->flags = flags;
	return ukey;
}

static bool ATTRIBUTE_PURE ult_key_equals (const void *key1, const void *key2)
{
	const struct ult_key *ukey1 = (const struct ult_key *) key1;
	const struct ult_key *ukey2 = (const struct ult_key *) key2;
	return ukey1->flags == ukey2->flags &&
	       STREQ (ukey1->name, ukey2->name);
}

static size_t ATTRIBUTE_PURE ult_key_hash (const void *key)
{
	struct ult_key *ukey = (struct ult_key *) key;
	return string_hash (ukey->name) ^ (size_t) ukey->flags;
}

static void ult_key_free (const void *key)
{
	struct ult_key *ukey = (struct ult_key *) key;
	free (ukey->name);
	free (ukey);
}

static struct ult_value *ult_value_new (void)
{
	struct ult_value *uvalue = XMALLOC (struct ult_value);
	uvalue->path = NULL;
	uvalue->trace = new_string_list (GL_ARRAY_LIST, true);
	return uvalue;
}

static void ult_value_free (const void *value)
{
	struct ult_value *uvalue = (struct ult_value *) value;
	if (uvalue) {
		free (uvalue->path);
		gl_list_free (uvalue->trace);
		free (uvalue);
	}
}

static gl_map_t ult_cache = NULL;

/*
 * Find the ultimate source file by following any ".so filename" directives
 * in the first line of the man pages.  Also (optionally) trace symlinks and
 * hard links(!).
 *
 * name is full pathname, path is the MANPATH directory (/usr/man)
 * flags is a combination of SO_LINK | SOFT_LINK | HARD_LINK
 */
const struct ult_value *ult_src (const char *name, const char *path,
                                 struct stat *buf, int flags)
{
	char *base = xstrdup (name);
	struct ult_key *key;
	const struct ult_value *existing;
	struct ult_value *value;
	struct stat new_buf;

	if (!ult_cache)
		ult_cache = gl_map_create_empty (GL_HASH_MAP, ult_key_equals,
		                                 ult_key_hash, ult_key_free,
		                                 ult_value_free);
	key = ult_key_new (name, flags);
	if (gl_map_search (ult_cache, key, (const void **) &existing)) {
		ult_key_free (key);
		return existing;
	}
	value = ult_value_new ();

	debug ("ult_src: File %s in mantree %s\n", name, path);

	gl_list_add_last (value->trace, xstrdup (name));

	/* as ult_softlink() & ult_hardlink() do all of their respective
	 * resolving in one call, only need to sort them out once
	 */

	/* If we don't have a buf, allocate and assign one */
	if (!buf && ((flags & SOFT_LINK) || (flags & HARD_LINK))) {
		buf = &new_buf;
		if (lstat (base, buf) == -1) {
			if (quiet < 2)
				error (0, errno, _ ("can't resolve %s"), base);
			goto err;
		}
	}

	/* Permit semi local (inter-tree) soft links */
	if (flags & SOFT_LINK) {
		assert (buf); /* initialised above */
		if (S_ISLNK (buf->st_mode)) {
			/* Is a symlink, resolve it. */
			char *softlink = ult_softlink (base);
			if (softlink) {
				free (base);
				base = softlink;
			} else
				goto err;
		}
	}

	/* Only deal with local (inter-dir) HARD links */
	if (flags & HARD_LINK) {
		assert (buf); /* initialised above */
		if (buf->st_nlink > 1) {
			/* Has HARD links, find least value */
			char *hardlink = ult_hardlink (base, buf->st_ino);
			if (hardlink) {
				free (base);
				base = hardlink;
			}
		}
	}

	if (flags & SO_LINK) {
		int i;
		for (i = 0; i < 10; ++i) {
			char *directive, *include;

			directive = find_include_directive (base);
			if (!directive)
				goto err;

			include = test_for_include (directive);
			free (directive);
			if (!include)
				break;

			free (base);
			base = find_include (name, path, include);
			free (include);
			if (!base)
				goto err;

			debug ("ult_src: points to %s\n", base);

			gl_list_add_last (value->trace, xstrdup (base));
		}
		if (i == 10) {
			if (quiet < 2)
				error (0, 0, _ ("%s is self referencing"),
				       name);
			goto err;
		}
	}

	/* We have the ultimate source */
	value->path = xstrdup (base);
	gl_list_add_last (value->trace, xstrdup (base));
	gl_map_put (ult_cache, key, value);
	free (base);
	return value;

err:
	/* The cache is short-lived and only within a single process, so
	 * negative caching is fine.
	 */
	ult_value_free (value);
	gl_map_put (ult_cache, key, NULL);
	free (base);
	return NULL;
}
