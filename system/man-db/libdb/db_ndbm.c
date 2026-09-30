/*
 * db_ndbm.c: low level ndbm interface routines for man.
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Mon Aug  8 20:35:30 BST 1994  Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#ifdef NDBM

#  include <fcntl.h>
#  include <stdbool.h>
#  include <stdio.h>
#  include <stdlib.h>
#  include <unistd.h>

#  include <sys/file.h> /* for flock() */
#  include <sys/stat.h>
#  include <sys/types.h> /* for open() */

#  include "attribute.h"
#  include "stat-time.h"
#  include "timespec.h"
#  include "xalloc.h"
#  include "xvasprintf.h"

#  include "manconfig.h"

#  include "db_storage.h"
#  include "db_xdbm.h"
#  include "mydbm.h"

/* release the lock and close the database */
static void raw_close (man_ndbm_wrapper wrap)
{
	if (wrap->file) {
		flock (dbm_dirfno (wrap->file), LOCK_UN);
		dbm_close (wrap->file);
	}
}

void man_ndbm_free (man_ndbm_wrapper wrap)
{
	man_xdbm_free (wrap, raw_close);
}

man_ndbm_wrapper man_ndbm_new (const char *name)
{
	man_ndbm_wrapper wrap;

	wrap = xmalloc (sizeof *wrap);
	wrap->name = xstrdup (name);
	wrap->file = NULL;
	wrap->mtime = NULL;

	return wrap;
}

/* open a ndbm type database, with file locking. */
bool man_ndbm_open (man_ndbm_wrapper wrap, int flags, int mode)
{
	int lock_op;
	int lock_failed;

	if (flags & ~O_RDONLY) {
		/* flags includes O_RDWR or O_WRONLY, need an exclusive lock */
		lock_op = LOCK_EX | LOCK_NB;
	} else {
		lock_op = LOCK_SH | LOCK_NB;
	}

	if (flags & O_TRUNC) {
		/* opening the db is destructive, need to lock first */
		char *dir_fname;
		int dir_fd;

		wrap->file = NULL;
		lock_failed = 1;
		dir_fname = xasprintf ("%s.dir", wrap->name);
		dir_fd = open (dir_fname, flags & ~O_TRUNC, mode);
		free (dir_fname);
		if (dir_fd != -1) {
			if (!(lock_failed = flock (dir_fd, lock_op)))
				wrap->file =
				        dbm_open (wrap->name, flags, mode);
			close (dir_fd);
		}
	} else {
		wrap->file = dbm_open (wrap->name, flags, mode);
		if (wrap->file)
			lock_failed = flock (dbm_dirfno (wrap->file), lock_op);
	}

	if (!wrap->file)
		return false;

	if (lock_failed) {
		gripe_lock (wrap->name);
		dbm_close (wrap->file);
		return false;
	}

	return true;
}

static datum unsorted_firstkey (man_ndbm_wrapper wrap)
{
	return copy_datum (dbm_firstkey (wrap->file));
}

static datum unsorted_nextkey (man_ndbm_wrapper wrap, datum key MAYBE_UNUSED)
{
	return copy_datum (dbm_nextkey (wrap->file));
}

datum man_ndbm_firstkey (man_ndbm_wrapper wrap)
{
	return man_xdbm_firstkey (wrap, unsorted_firstkey, unsorted_nextkey);
}

datum man_ndbm_nextkey (man_ndbm_wrapper wrap, datum key)
{
	return man_xdbm_nextkey (wrap, key);
}

struct timespec man_ndbm_get_time (man_ndbm_wrapper wrap)
{
	struct stat st;

	if (!wrap->mtime) {
		wrap->mtime = XMALLOC (struct timespec);
		if (fstat (dbm_dirfno (wrap->file), &st) < 0) {
			wrap->mtime->tv_sec = -1;
			wrap->mtime->tv_nsec = -1;
		} else
			*wrap->mtime = get_stat_mtime (&st);
	}

	return *wrap->mtime;
}

#endif /* NDBM */
