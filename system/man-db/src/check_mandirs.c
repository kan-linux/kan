/*
 * check_mandirs.c: used to auto-update the database caches
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002, 2003, 2004, 2007, 2008, 2009, 2010, 2011
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
 * Mon May  2 17:36:33 BST 1994  Wilf. (G.Wilford@ee.surrey.ac.uk)
 *
 * CJW: Many changes to whatis parsing. Added database purging.
 * See ChangeLog for details.
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
#include <time.h>
#include <unistd.h>

#include "attribute.h"
#include "dirname.h"
#include "error.h"
#include "gl_array_list.h"
#include "gl_hash_map.h"
#include "gl_xlist.h"
#include "gl_xmap.h"
#include "stat-time.h"
#include "timespec.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "gettext.h"
#define _(String) gettext (String)

#include "manconfig.h"

#include "appendstr.h"
#include "compression.h"
#include "debug.h"
#include "fatal.h"
#include "filenames.h"
#include "glcontainers.h"
#include "orderfiles.h"
#include "security.h"
#include "util.h"

#include "db_storage.h"
#include "mydbm.h"

#include "check_mandirs.h"
#include "descriptions.h"
#include "globbing.h"
#include "lexgrog.h"
#include "manp.h"
#include "ult_src.h"

bool opt_test; /* don't update db */
int pages;
bool force_rescan = false;

static gl_map_t whatis_map = NULL;

struct whatis {
	char *whatis;
	char *filters;
};

static void whatis_free (const void *value)
{
	struct whatis *whatis = (struct whatis *) value;

	free (whatis->whatis);
	free (whatis->filters);
	free (whatis);
}

static void gripe_multi_extensions (const char *path, const char *sec,
                                    const char *name, const char *ext)
{
	if (quiet < 2)
		error (0, 0,
		       _ ("warning: %s/man%s/%s.%s*: competing extensions"),
		       path, sec, name, ext);
}

/* Test whether an errno value is EAGAIN or (on systems where it differs)
 * EWOULDBLOCK.  This is a separate function mainly in order to be able to
 * control GCC diagnostics in one place.
 */
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wlogical-op"
static inline bool is_eagain (int err)
{
	return err == EAGAIN || err == EWOULDBLOCK;
}
#pragma GCC diagnostic pop

static void gripe_rwopen_failed (MYDBM_FILE dbf)
{
	if (errno == EACCES || errno == EROFS)
		debug ("database %s is read-only\n", dbf->name);
	else if (is_eagain (errno))
		debug ("database %s is locked by another process\n",
		       dbf->name);
	else {
#ifdef MAN_DB_UPDATES
		if (!quiet)
#endif /* MAN_DB_UPDATES */
			error (0, errno, _ ("can't update index cache %s"),
			       dbf->name);
	}
}

static bool ensure_db_open (MYDBM_FILE dbf)
{
	if (dbf->file)
		return true;
	if (!MYDBM_RWOPEN (dbf))
		return false;
	return true;
}

/* Take absolute filename and path (for ult_src) and do sanity checks on
 * file. Also check that file is non-zero in length and is not already in
 * the db. If not, find its ult_src() and see if we have the whatis cached,
 * otherwise cache it in case we trace another manpage back to it. Next,
 * store it in the db along with any references found in the whatis.
 */
void test_manfile (MYDBM_FILE dbf, const char *file, const char *path)
{
	char *manpage_base;
	const struct ult_value *ult;
	struct lexgrog lg;
	struct mandata *info, *exists;
	struct compression *comp;
	struct stat buf;
	size_t len;
	const struct whatis *whatis;

	debug ("\ntest_manfile: considering %s\n", file);

	memset (&lg, 0, sizeof (struct lexgrog));

	info = filename_info (file, quiet < 2);
	if (!info)
		return;
	manpage_base = info->name; /* steal memory */
	info->name = NULL;

	comp = comp_info (file, true);
	if (comp) {
		len = strlen (comp->stem);
		free (comp->stem);
	} else
		len = strlen (file);

	/* to get mtime info */
	(void) lstat (file, &buf);
	info->mtime = get_stat_mtime (&buf);

	/* check that our file actually contains some data */
	if (buf.st_size == 0) {
		/* man-db pre 2.3 place holder ? */
		free_mandata_struct (info);
		return;
	}

	/* Check for multiple pages whose details match except for having
	 * different compression extensions.
	 */
	exists = dblookup_exact (dbf, manpage_base, info->ext, true);
	if (exists && !STREQ (exists->comp, info->comp ? info->comp : "-")) {
		char *abs_filename;

		/* If the cached file still exists, then we have a collision:
		 * two pages that only differ by compression extension.
		 */
		abs_filename = make_filename (path, NULL, exists, "man");
		if (!abs_filename) {
			if (!opt_test)
				dbdelete (dbf, manpage_base, exists);
		} else {
			gripe_multi_extensions (path, exists->sec,
			                        manpage_base, exists->ext);
			free (abs_filename);
			free_mandata_struct (exists);
			free_mandata_struct (info);
			return;
		}
	}
	free_mandata_struct (exists);

	/* Trace the file to its ultimate source, otherwise we'll be
	 * looking for whatis info in files containing only '.so
	 * manx/foo.x', which will give us an unobtainable whatis
	 * for the entry. */
	ult = ult_src (file, path, &buf, SO_LINK | SOFT_LINK | HARD_LINK);

	if (!ult) {
		if (quiet < 2)
			error (0, 0,
			       _ ("warning: %s: bad symlink or ROFF `.so' "
			          "request"),
			       file);
		free_mandata_struct (info);
		return;
	}

	pages++; /* pages seen so far */

	if (strncmp (ult->path, file, len) == 0)
		info->id = ULT_MAN; /* ultimate source file */
	else
		info->id = SO_MAN; /* .so, sym or hard linked file */

	/* Ok, here goes: Use a hash tree to store the ult_srcs with
	 * their whatis. Anytime after, check the hash tree, if it's there,
	 * use it. This saves us a find_name() which is a real hog.
	 *
	 * Use the full path in ult->path as the hash key so we don't have
	 * to clear the hash between calls.
	 */

	if (!whatis_map)
		whatis_map = new_string_map (GL_HASH_MAP, whatis_free);

	whatis = gl_map_get (whatis_map, ult->path);
	if (whatis) {
		lg.whatis = whatis->whatis ? xstrdup (whatis->whatis) : NULL;
		lg.filters =
		        whatis->filters ? xstrdup (whatis->filters) : NULL;
	} else {
		/* Cache miss; go and get the whatis info in its raw state. */
		char *file_base = base_name (file);
		struct whatis *new_whatis;

		if (!STRNEQ (ult->path, file, len))
			debug ("test_manfile: link not in cache:\n"
			       " source = %s\n"
			       " target = %s\n",
			       file, ult->path);

		lg.type = MANPAGE;
		drop_effective_privs ();
		find_name (ult->path, file_base, &lg, NULL);
		free (file_base);
		regain_effective_privs ();

		new_whatis = XMALLOC (struct whatis);
		new_whatis->whatis = lg.whatis ? xstrdup (lg.whatis) : NULL;
		new_whatis->filters = lg.filters ? xstrdup (lg.filters) : NULL;
		gl_map_put (whatis_map, xstrdup (ult->path), new_whatis);
	}

	debug ("\"%s\"\n", lg.whatis);

	/* split up the raw whatis data and store references */
	info->pointer = NULL; /* direct page, so far */
	info->filter = lg.filters;
	if (lg.whatis) {
		gl_list_t descs = parse_descriptions (manpage_base, lg.whatis);
		if (!opt_test)
			store_descriptions (dbf, descs, info, path,
			                    manpage_base, ult->trace);
		gl_list_free (descs);
	} else if (quiet < 2) {
		(void) stat (ult->path, &buf);
		if (buf.st_size == 0)
			error (0, 0, _ ("warning: %s: ignoring empty file"),
			       ult->path);
		else
			error (0, 0,
			       _ ("warning: %s: whatis parse for %s(%s) "
			          "failed"),
			       ult->path, manpage_base, info->ext);
	}

	free_mandata_struct (info);
	free (lg.whatis);
}

static void add_dir_entries (MYDBM_FILE dbf, const char *path, char *infile)
{
	char *manpage;
	int len;
	struct dirent *newdir;
	DIR *dir;
	gl_list_t names;
	const char *name;

	manpage = xasprintf ("%s/%s/", path, infile);
	assert (manpage);
	len = strlen (manpage);

	/*
	 * All filename entries in this dir should either be valid manpages
	 * or . files (such as current, parent dir).
	 */

	dir = opendir (infile);
	if (!dir) {
		error (0, errno, _ ("can't search directory %s"), manpage);
		free (manpage);
		return;
	}

	names = new_string_list (GL_ARRAY_LIST, false);

	/* strlen(newdir->d_name) could be replaced by newdir->d_reclen */

	while ((newdir = readdir (dir)) != NULL) {
		if (*newdir->d_name == '.' &&
		    strlen (newdir->d_name) < (size_t) 3)
			continue;
		gl_list_add_last (names, xstrdup (newdir->d_name));
	}
	closedir (dir);

	order_files (infile, &names);

	GL_LIST_FOREACH (names, name) {
		manpage = appendstr (manpage, name, nullptr);
		test_manfile (dbf, manpage, path);
		*(manpage + len) = '\0';
	}

	gl_list_free (names);
	free (manpage);
}

#ifdef MAN_OWNER
extern uid_t uid; /* current effective user id */
extern gid_t gid; /* current effective group id */

/* Fix a path's ownership if possible and necessary. */
void chown_if_possible (const char *path)
{
	struct stat st;
	struct passwd *man_owner = get_man_owner ();

	if (lstat (path, &st) != 0)
		return;

	if ((uid == 0 ||
	     (uid == man_owner->pw_uid && st.st_uid == man_owner->pw_uid &&
	      gid == man_owner->pw_gid)) &&
	    (st.st_uid != man_owner->pw_uid ||
	     st.st_gid != man_owner->pw_gid)) {
		debug ("fixing ownership of %s\n", path);
		if (lchown (path, man_owner->pw_uid, man_owner->pw_gid) < 0)
			fatal (0, _ ("can't chown %s"), path);
	}
}
#else  /* !MAN_OWNER */
void chown_if_possible (const char *path MAYBE_UNUSED) {}
#endif /* MAN_OWNER */

/* create the catman hierarchy if it doesn't exist */
static void mkcatdirs (const char *mandir, const char *catdir)
{
	if (catdir) {
		char *manname, *catname;

		int oldmask = umask (022);
		/* first the base catdir */
		if (is_directory (catdir) != 1) {
			regain_effective_privs ();
			if (mkdir (catdir, 0755) < 0) {
				if (!quiet)
					error (0, 0,
					       _ ("warning: cannot create "
					          "catdir %s"),
					       catdir);
				debug ("warning: cannot create catdir %s\n",
				       catdir);
			} else
				debug ("created base catdir %s\n", catdir);
			chown_if_possible (catdir);
			drop_effective_privs ();
		}
		/* then the hierarchy */
		catname = xasprintf ("%s/cat1", catdir);
		manname = xasprintf ("%s/man1", mandir);
		if (is_directory (catdir) == 1) {
			int j;
			regain_effective_privs ();
			debug ("creating catdir hierarchy %s	", catdir);
			for (j = 1; j <= 9; j++) {
				catname[strlen (catname) - 1] = '0' + j;
				manname[strlen (manname) - 1] = '0' + j;
				if ((is_directory (manname) == 1) &&
				    (is_directory (catname) != 1)) {
					if (mkdir (catname, 0755) < 0) {
						if (!quiet)
							error (0, 0,
							       _ ("warning: "
							          "cannot "
							          "create "
							          "catdir %s"),
							       catname);
						debug ("warning: cannot "
						       "create catdir %s\n",
						       catname);
					} else
						debug (" cat%d", j);
					chown_if_possible (catname);
				}
			}
			debug ("\n");
			drop_effective_privs ();
		}
		free (catname);
		free (manname);
		umask (oldmask);
	}
}

/* We used to install cat directories with the setgid bit set, but this
 * wasn't very useful and introduces the ability to escalate privileges to
 * that group:
 *   https://www.halfdog.net/Security/2015/SetgidDirectoryPrivilegeEscalation/
 */
static void fix_permissions (const char *dir)
{
	struct stat st;

	if (stat (dir, &st) == 0) {
		if ((st.st_mode & S_ISGID) != 0) {
			int status;

			debug ("removing setgid bit from %s\n", dir);
			status = chmod (dir, st.st_mode & ~S_ISGID);
			if (status)
				error (0, errno, _ ("can't chmod %s"), dir);
		}

		chown_if_possible (dir);
	}
}

static void fix_permissions_tree (const char *catdir)
{
	if (is_directory (catdir) == 1) {
		char *catname;
		int i;

		fix_permissions (catdir);
		catname = xasprintf ("%s/cat1", catdir);
		assert (catname);
		for (i = 1; i <= 9; ++i) {
			catname[strlen (catname) - 1] = '0' + i;
			fix_permissions (catname);
		}
		free (catname);
	}
}

/*
 * accepts the raw man dir tree eg. "/usr/man" and the time stored in the db
 * any dirs of the tree that have been modified (ie added to) will then be
 * scanned for new files, which are then added to the db.
 */
static int testmandirs (MYDBM_FILE dbf, const char *path, const char *catpath,
                        struct timespec last, bool create)
{
	DIR *dir;
	struct dirent *mandir;
	int amount = 0;
	bool created = false;

	debug ("Testing %s for new files\n", path);

	if (catpath)
		fix_permissions_tree (catpath);

	dir = opendir (path);
	if (!dir) {
		error (0, errno, _ ("can't search directory %s"), path);
		return 0;
	}

	if (chdir (path) != 0) {
		error (0, errno, _ ("can't change to directory %s"), path);
		closedir (dir);
		return 0;
	}

	while ((mandir = readdir (dir))) {
		struct stat stbuf;
		struct timespec mtime;

		if (strncmp (mandir->d_name, "man", 3) != 0)
			continue;

		debug ("Examining %s\n", mandir->d_name);

		if (stat (mandir->d_name, &stbuf) != 0) /* stat failed */
			continue;
		if (!S_ISDIR (stbuf.st_mode)) /* not a directory */
			continue;
		mtime = get_stat_mtime (&stbuf);
		if (last.tv_sec && timespec_cmp (mtime, last) <= 0) {
			/* scanned already */
			debug ("%s modified %ld.%09ld, "
			       "db modified %ld.%09ld\n",
			       mandir->d_name, (long) mtime.tv_sec,
			       (long) mtime.tv_nsec, (long) last.tv_sec,
			       (long) last.tv_nsec);
			continue;
		}

		debug ("\tsubdirectory %s has been 'modified'\n",
		       mandir->d_name);

		if (create && !created) {
			/* We seem to have something to do, so create the
			 * database now.
			 */
			mkcatdirs (path, catpath);

			/* Open the db in CTRW mode to store the $ver$ ID */

			if (!MYDBM_CTRWOPEN (dbf)) {
				if (errno == EACCES || errno == EROFS) {
					debug ("database %s is read-only\n",
					       dbf->name);
					closedir (dir);
					return 0;
				} else {
					error (0, errno,
					       _ ("can't create index cache "
					          "%s"),
					       dbf->name);
					closedir (dir);
					return -1;
				}
			}

			dbver_wr (dbf);

			created = true;
		} else if (!ensure_db_open (dbf)) {
			gripe_rwopen_failed (dbf);
			closedir (dir);
			return 0;
		}

		if (!quiet) {
			int tty = isatty (STDERR_FILENO);

			if (tty)
				fprintf (stderr, "\r");
			fprintf (stderr,
			         _ ("Updating index cache for path "
			            "`%s/%s'. Wait..."),
			         path, mandir->d_name);
			if (!tty)
				fprintf (stderr, "\n");
		}
		add_dir_entries (dbf, path, mandir->d_name);
		amount++;
	}
	closedir (dir);

	return amount;
}

/* routine to prepare/create the db prior to calling testmandirs() */
int create_db (MYDBM_FILE dbf, const char *manpath, const char *catpath)
{
	struct timespec time_zero;
	int amount;

	debug ("create_db(%s): %s\n", manpath, dbf->name);

	time_zero.tv_sec = 0;
	time_zero.tv_nsec = 0;
	amount = testmandirs (dbf, manpath, catpath, time_zero, true);

	if (amount > 0 && !quiet)
		fputs (_ ("done.\n"), stderr);

	return amount;
}

/* Make sure an existing database is essentially sane. */
static bool sanity_check_db (MYDBM_FILE dbf)
{
	datum key;

	if (dbver_rd (dbf))
		return false;

	key = MYDBM_FIRSTKEY (dbf);
	while (MYDBM_DPTR (key) != NULL) {
		datum content, nextkey;

		content = MYDBM_FETCH (dbf, key);
		if (!MYDBM_DPTR (content)) {
			debug ("warning: %s has a key with no content (%s); "
			       "rebuilding\n",
			       dbf->name, MYDBM_DPTR (key));
			MYDBM_FREE_DPTR (key);
			return false;
		}
#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-double-free"
#endif
		MYDBM_FREE_DPTR (content);
		nextkey = MYDBM_NEXTKEY (dbf, key);
		MYDBM_FREE_DPTR (key);
#pragma GCC diagnostic pop
		key = nextkey;
	}

	return true;
}

/* routine to update the db, ensure that it is consistent with the
   filesystem */
int update_db (MYDBM_FILE dbf, const char *manpath, const char *catpath)
{
	struct timespec mtime;
	int new;

	if (!ensure_db_open (dbf) || !sanity_check_db (dbf)) {
		debug ("failed to open %s O_RDONLY\n", dbf->name);
		return -1;
	}
	mtime = MYDBM_GET_TIME (dbf);

	debug ("update_db(): %ld.%09ld\n", (long) mtime.tv_sec,
	       (long) mtime.tv_nsec);
	new = testmandirs (dbf, manpath, catpath, mtime, false);

	if (new > 0 && !quiet)
		fputs (_ ("done.\n"), stderr);

	return new;
}

/* Purge any entries pointing to name. This currently assumes that pointers
 * are always shallow, which may not be a good assumption yet; it should be
 * close, though.
 */
void purge_pointers (MYDBM_FILE dbf, const char *name)
{
	datum key = MYDBM_FIRSTKEY (dbf);

	debug ("Purging pointers to vanished page \"%s\"\n", name);

	while (MYDBM_DPTR (key) != NULL) {
		datum content, nextkey;
		struct mandata *entry = NULL;
		char *nicekey, *tab;

#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-use-after-free"
#endif
		/* Ignore db identifier keys. */
		if (*MYDBM_DPTR (key) == '$')
			goto pointers_next;
#pragma GCC diagnostic pop

		content = MYDBM_FETCH (dbf, key);
		if (!MYDBM_DPTR (content))
			return;

		/* Get just the name. */
		nicekey = xstrdup (MYDBM_DPTR (key));
		tab = strchr (nicekey, '\t');
		if (tab)
			*tab = '\0';

#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-use-after-free"
#endif
		if (*MYDBM_DPTR (content) == '\t')
			goto pointers_contentnext;
#pragma GCC diagnostic pop

		entry = split_content (dbf, MYDBM_DPTR (content));
		if (entry->id != SO_MAN && entry->id != WHATIS_MAN)
			goto pointers_contentnext;

		if (STREQ (entry->pointer, name)) {
			if (!opt_test)
				dbdelete (dbf, nicekey, entry);
			else
				debug ("%s(%s): pointer vanished, "
				       "would delete\n",
				       nicekey, entry->ext);
		}

pointers_contentnext:
		free_mandata_struct (entry);
		free (nicekey);
		MYDBM_FREE_DPTR (content);
pointers_next:
		nextkey = MYDBM_NEXTKEY (dbf, key);
		MYDBM_FREE_DPTR (key);
		key = nextkey;
	}
}

/* Count the number of exact extension matches returned from look_for_file()
 * (which may return inexact extension matches in some cases). It may turn
 * out that this is better handled in look_for_file() itself.
 */
static int count_glob_matches (const char *ext, gl_list_t source,
                               struct timespec db_mtime)
{
	const char *walk;
	int count = 0;

	GL_LIST_FOREACH (source, walk) {
		struct mandata *info;
		struct stat statbuf;

		if (stat (walk, &statbuf) == -1) {
			debug ("count_glob_matches: excluding %s "
			       "because stat failed\n",
			       walk);
			continue;
		}
		if (db_mtime.tv_sec != (time_t) -1 &&
		    timespec_cmp (get_stat_mtime (&statbuf), db_mtime) <= 0) {
			debug ("count_glob_matches: excluding %s, "
			       "no newer than database\n",
			       walk);
			continue;
		}

		info = filename_info (walk, quiet < 2);
		if (info) {
			if (STREQ (ext, info->ext))
				++count;
			free_mandata_struct (info);
		}
	}

	return count;
}

/* Decide whether to purge a reference to a "normal" (ULT_MAN or SO_MAN)
 * page.
 */
static int purge_normal (MYDBM_FILE dbf, const char *name,
                         struct mandata *info, gl_list_t found)
{
	struct timespec t;

	/* TODO: On some systems, the cat page extension differs from the
	 * man page extension, so this may be too strict.
	 */
	t.tv_sec = -1;
	t.tv_nsec = -1;
	if (count_glob_matches (info->ext, found, t))
		return 0;

	if (!opt_test)
		dbdelete (dbf, name, info);
	else
		debug ("%s(%s): missing page, would delete\n", name,
		       info->ext);

	return 1;
}

/* Decide whether to purge a reference to a WHATIS_MAN or WHATIS_CAT page. */
static int purge_whatis (MYDBM_FILE dbf, const char *path, bool cat,
                         const char *name, struct mandata *info,
                         gl_list_t found, struct timespec db_mtime)
{
	/* TODO: On some systems, the cat page extension differs from the
	 * man page extension, so this may be too strict.
	 */
	if (count_glob_matches (info->ext, found, db_mtime)) {
		/* If the page exists and didn't beforehand, then presumably
		 * we're about to rescan, which will replace the WHATIS_MAN
		 * entry with something better. However, there have been
		 * bugs that created false WHATIS_MAN entries, so force the
		 * rescan just to be sure; since in the absence of a bug we
		 * would rescan anyway, this isn't a problem.
		 */
		if (!force_rescan)
			debug ("%s(%s): whatis replaced by real page; "
			       "forcing a rescan just in case\n",
			       name, info->ext);
		force_rescan = true;
		return 0;
	} else if (STREQ (info->pointer, "-")) {
		/* This is broken; a WHATIS_MAN should never have an empty
		 * pointer field. This might have happened due to the first
		 * name in a page being different from what the file name
		 * says; that's fixed now, so delete and force a rescan.
		 */
		if (!opt_test)
			dbdelete (dbf, name, info);
		else
			debug ("%s(%s): whatis with empty pointer, "
			       "would delete\n",
			       name, info->ext);

		if (!force_rescan)
			debug ("%s(%s): whatis had empty pointer; "
			       "forcing a rescan just in case\n",
			       name, info->ext);
		force_rescan = true;
		return 1;
	} else {
		/* Does the real page still exist? */
		gl_list_t real_found;
		bool save_debug = debug_level;
		struct timespec t;
		int count;

		debug_level = false;
		real_found = look_for_file (path, info->ext, info->pointer,
		                            cat, LFF_MATCHCASE);
		debug_level = save_debug;

		t.tv_sec = -1;
		t.tv_nsec = -1;
		count = count_glob_matches (info->ext, real_found, t);
		gl_list_free (real_found);
		if (count)
			return 0;

		if (!opt_test)
			dbdelete (dbf, name, info);
		else
			debug ("%s(%s): whatis target was deleted, "
			       "would delete\n",
			       name, info->ext);
		return 1;
	}
}

/* Check that multi keys are correctly constructed. */
static bool check_multi_key (const char *name, const char *content)
{
	const char *walk, *next;

	if (!*content)
		return false;

	for (walk = content; walk && *walk; walk = next) {
		/* The name in the multi key should only differ from the
		 * name of the key itself in its case, if at all.
		 */
		bool valid = true;
		++walk; /* skip over initial tab */
		next = strchr (walk, '\t');
		if (next) {
			if (strncasecmp (name, walk, next - walk))
				valid = false;
		} else {
			if (strcasecmp (name, walk))
				valid = false;
		}
		if (!valid) {
			debug ("%s: broken multi key \"%s\", "
			       "forcing a rescan\n",
			       name, content);
			force_rescan = true;
			return true;
		}

		/* If the name was valid, skip over the extension and
		 * continue the scan.
		 */
		walk = next;
		next = walk ? strchr (walk + 1, '\t') : NULL;
	}

	return false;
}

/* Go through the database and purge references to man pages that no longer
 * exist.
 */
int purge_missing (MYDBM_FILE dbf, const char *manpath, const char *catpath)
{
#ifdef NDBM
	char *dirfile;
#endif
	struct stat st;
	bool db_exists;
	datum key;
	int count = 0;
	struct timespec db_mtime;

#ifdef NDBM
	dirfile = xasprintf ("%s.dir", dbf->name);
	db_exists = stat (dirfile, &st) == 0;
	free (dirfile);
#else
	db_exists = stat (dbf->name, &st) == 0;
#endif
	if (!db_exists)
		/* nothing to purge */
		return 0;

	if (!quiet)
		printf (_ ("Purging old database entries in %s...\n"),
		        manpath);

	if (!ensure_db_open (dbf) || !sanity_check_db (dbf)) {
		gripe_rwopen_failed (dbf);
		return 0;
	}
	db_mtime = MYDBM_GET_TIME (dbf);

	key = MYDBM_FIRSTKEY (dbf);

	while (MYDBM_DPTR (key) != NULL) {
		datum content, nextkey;
		struct mandata *entry;
		char *nicekey, *tab;
		bool save_debug;
		gl_list_t found;

#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-use-after-free"
#endif
		/* Ignore db identifier keys. */
		if (*MYDBM_DPTR (key) == '$') {
			nextkey = MYDBM_NEXTKEY (dbf, key);
			MYDBM_FREE_DPTR (key);
			key = nextkey;
			continue;
		}
#pragma GCC diagnostic pop

		content = MYDBM_FETCH (dbf, key);
		if (!MYDBM_DPTR (content)) {
			nextkey = MYDBM_NEXTKEY (dbf, key);
			MYDBM_FREE_DPTR (key);
			key = nextkey;
			continue;
		}

		/* Get just the name. */
		nicekey = xstrdup (MYDBM_DPTR (key));
		tab = strchr (nicekey, '\t');
		if (tab)
			*tab = '\0';

#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-use-after-free"
#endif
		/* Deal with multi keys. */
		if (*MYDBM_DPTR (content) == '\t') {
			if (check_multi_key (nicekey, MYDBM_DPTR (content)))
				MYDBM_DELETE (dbf, key);
			free (nicekey);
			MYDBM_FREE_DPTR (content);
			nextkey = MYDBM_NEXTKEY (dbf, key);
			MYDBM_FREE_DPTR (key);
			key = nextkey;
			continue;
		}
#pragma GCC diagnostic pop

		entry = split_content (dbf, MYDBM_DPTR (content));

		save_debug = debug_level;
		debug_level = false; /* look_for_file() is quite noisy */
		if (entry->id <= WHATIS_MAN)
			found = look_for_file (manpath, entry->ext,
			                       entry->name ? entry->name
			                                   : nicekey,
			                       false, LFF_MATCHCASE);
		else
			found = look_for_file (catpath, entry->ext,
			                       entry->name ? entry->name
			                                   : nicekey,
			                       true, LFF_MATCHCASE);
		debug_level = save_debug;

		/* Now actually decide whether to purge, depending on the
		 * type of entry.
		 */
		if (entry->id == ULT_MAN || entry->id == SO_MAN ||
		    entry->id == STRAY_CAT)
			count += purge_normal (dbf, nicekey, entry, found);
		else if (entry->id == WHATIS_MAN)
			count += purge_whatis (dbf, manpath, false, nicekey,
			                       entry, found, db_mtime);
		else /* entry->id == WHATIS_CAT */
			count += purge_whatis (dbf, catpath, true, nicekey,
			                       entry, found, db_mtime);

		gl_list_free (found);
		free (nicekey);

		free_mandata_struct (entry);
		MYDBM_FREE_DPTR (content);
		nextkey = MYDBM_NEXTKEY (dbf, key);
		MYDBM_FREE_DPTR (key);
		key = nextkey;
	}

	return count;
}
