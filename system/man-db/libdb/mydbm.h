/*
 * mydbm.h: database interface definitions and prototypes.
 *
 * Copyright (C) 1994, 1995, Graeme W. Wilford. (Wilf.)
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
 * Header file to make programming independent of db type used
 *
 * Currently satisfies:
 *
 *	*hash based*
 *		GNU dbm: 	(gdbm & ndbm)
 *		Berkeley db: 	(ndbm)
 *		`native': 	(ndbm)
 *
 *	*binary tree based*
 *		Berkeley db: 	(BTREE)
 *
 * Tue Apr 26 12:56:44 BST 1994  Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifndef MYDBM_H
#define MYDBM_H

#include <stdbool.h>

#include "timespec.h"
#include "xvasprintf.h"

#if defined(GDBM) && !defined(NDBM) && !defined(BTREE)

#  include <gdbm.h>

#  ifndef HAVE_GDBM_EXISTS
extern int gdbm_exists (GDBM_FILE db, datum key);
#  endif /* !HAVE_GDBM_EXISTS */

/* gdbm_nextkey() is not lexicographically sorted, so we need to keep the
 * filename around to use as a hash key.
 */
typedef struct {
	char *name;
	GDBM_FILE file;
	struct timespec *mtime;
} *man_gdbm_wrapper;

man_gdbm_wrapper man_gdbm_new (const char *name);
bool man_gdbm_open_wrapper (man_gdbm_wrapper wrap, int flags);
datum man_gdbm_firstkey (man_gdbm_wrapper wrap);
datum man_gdbm_nextkey (man_gdbm_wrapper wrap, datum key);
struct timespec man_gdbm_get_time (man_gdbm_wrapper wrap);
void man_gdbm_free (man_gdbm_wrapper wrap);

#  define BLK_SIZE                 0 /* to invoke normal fs block size */
#  define DB_EXT                   ".db"
#  define MYDBM_FILE               man_gdbm_wrapper
#  define MYDBM_NEW(file)          man_gdbm_new (file)
#  define MYDBM_DPTR(d)            ((d).dptr)
#  define MYDBM_SET_DPTR(d, value) ((d).dptr = (value))
#  define MYDBM_DSIZE(d)           ((d).dsize)
#  define MYDBM_CTRWOPEN(wrap)                                                \
	  man_gdbm_open_wrapper (wrap, GDBM_NEWDB | GDBM_FAST)
#  define MYDBM_RWOPEN(wrap)                                                  \
	  man_gdbm_open_wrapper (wrap, GDBM_WRITER | GDBM_FAST)
#  define MYDBM_RDOPEN(wrap) man_gdbm_open_wrapper (wrap, GDBM_READER)
#  define MYDBM_INSERT(db, key, cont)                                         \
	  gdbm_store ((db)->file, key, cont, GDBM_INSERT)
#  define MYDBM_REPLACE(db, key, cont)                                        \
	  gdbm_store ((db)->file, key, cont, GDBM_REPLACE)
#  define MYDBM_EXISTS(db, key)  gdbm_exists ((db)->file, key)
#  define MYDBM_DELETE(db, key)  gdbm_delete ((db)->file, key)
#  define MYDBM_FETCH(db, key)   gdbm_fetch ((db)->file, key)
#  define MYDBM_FREE(db)         man_gdbm_free (db)
#  define MYDBM_FIRSTKEY(db)     man_gdbm_firstkey (db)
#  define MYDBM_NEXTKEY(db, key) man_gdbm_nextkey (db, key)
#  define MYDBM_GET_TIME(db)     man_gdbm_get_time (db)

#elif defined(NDBM) && !defined(GDBM) && !defined(BTREE)

#  include <fcntl.h>
#  include <ndbm.h>

/* Berkeley db routines emulate ndbm but don't add .dir & .pag, just .db! */
#  ifdef _DB_H_ /* has Berkeley db.h been included? */
#    define BERKELEY_DB
#  endif /* _DB_H_ */

typedef struct {
	char *name;
	DBM *file;
	struct timespec *mtime;
} *man_ndbm_wrapper;

extern man_ndbm_wrapper man_ndbm_new (const char *name);
extern bool man_ndbm_open (man_ndbm_wrapper wrap, int flags, int mode);
extern datum man_ndbm_firstkey (man_ndbm_wrapper wrap);
extern datum man_ndbm_nextkey (man_ndbm_wrapper wrap, datum key);
extern struct timespec man_ndbm_get_time (man_ndbm_wrapper wrap);
extern void man_ndbm_free (man_ndbm_wrapper wrap);

#  define DB_EXT                   ""
#  define MYDBM_FILE               man_ndbm_wrapper
#  define MYDBM_NEW(file)          man_ndbm_new (file)
#  define MYDBM_DPTR(d)            ((d).dptr)
#  define MYDBM_SET_DPTR(d, value) ((d).dptr = (value))
#  define MYDBM_DSIZE(d)           ((d).dsize)
#  define MYDBM_CTRWOPEN(wrap)                                                \
	  man_ndbm_open (wrap, O_TRUNC | O_CREAT | O_RDWR, DBMODE)
#  define MYDBM_RWOPEN(wrap) man_ndbm_open (wrap, O_RDWR, DBMODE)
#  define MYDBM_RDOPEN(wrap) man_ndbm_open (wrap, O_RDONLY, DBMODE)
#  define MYDBM_INSERT(db, key, cont)                                         \
	  dbm_store ((db)->file, key, cont, DBM_INSERT)
#  define MYDBM_REPLACE(db, key, cont)                                        \
	  dbm_store ((db)->file, key, cont, DBM_REPLACE)
#  define MYDBM_EXISTS(db, key)  (dbm_fetch ((db)->file, key).dptr != NULL)
#  define MYDBM_DELETE(db, key)  dbm_delete ((db)->file, key)
#  define MYDBM_FETCH(db, key)   copy_datum (dbm_fetch ((db)->file, key))
#  define MYDBM_FREE(db)         man_ndbm_free (db)
#  define MYDBM_FIRSTKEY(db)     man_ndbm_firstkey (db)
#  define MYDBM_NEXTKEY(db, key) man_ndbm_nextkey (db, key)
#  define MYDBM_GET_TIME(db)     man_ndbm_get_time (db)

#elif defined(BTREE) && !defined(NDBM) && !defined(GDBM)

#  include <fcntl.h>
#  include <limits.h>
#  include <sys/types.h>
#  include BDB_H

typedef struct {
	char *name;
	DB *file;
	struct timespec *mtime;
} *man_btree_wrapper;

typedef DBT datum;

extern man_btree_wrapper man_btree_new (const char *filename);
extern bool man_btree_open (man_btree_wrapper wrap, int flags, int mode);
extern void man_btree_free (man_btree_wrapper wrap);
extern int man_btree_exists (man_btree_wrapper wrap, datum key);
extern datum man_btree_fetch (man_btree_wrapper wrap, datum key);
extern int man_btree_insert (man_btree_wrapper wrap, datum key, datum cont);
extern datum man_btree_firstkey (man_btree_wrapper wrap);
extern datum man_btree_nextkey (man_btree_wrapper wrap);
extern int man_btree_replace (man_btree_wrapper wrap, datum key,
                              datum content);
extern int man_btree_nextkeydata (man_btree_wrapper wrap, datum *key,
                                  datum *cont);
extern struct timespec man_btree_get_time (man_btree_wrapper wrap);

#  define DB_EXT                   ".bt"
#  define MYDBM_FILE               man_btree_wrapper
#  define MYDBM_NEW(file)          man_btree_new (file)
#  define MYDBM_DPTR(d)            ((char *) (d).data)
#  define MYDBM_SET_DPTR(d, value) ((d).data = (char *) (value))
#  define MYDBM_DSIZE(d)           ((d).size)
#  define MYDBM_CTRWOPEN(wrap)                                                \
	  man_btree_open (wrap, O_TRUNC | O_CREAT | O_RDWR, DBMODE)
#  define MYDBM_RWOPEN(wrap)           man_btree_open (wrap, O_RDWR, DBMODE)
#  define MYDBM_RDOPEN(wrap)           man_btree_open (wrap, O_RDONLY, DBMODE)
#  define MYDBM_INSERT(db, key, cont)  man_btree_insert (db, key, cont)
#  define MYDBM_REPLACE(db, key, cont) man_btree_replace (db, key, cont)
#  define MYDBM_EXISTS(db, key)        man_btree_exists (db, key)
#  define MYDBM_DELETE(db, key)                                               \
	  (((db)->file->del) ((db)->file, &key, 0) ? -1 : 0)
#  define MYDBM_FETCH(db, key)   man_btree_fetch (db, key)
#  define MYDBM_FREE(db)         man_btree_free (db)
#  define MYDBM_FIRSTKEY(db)     man_btree_firstkey (db)
#  define MYDBM_NEXTKEY(db, key) man_btree_nextkey (db)
#  define MYDBM_GET_TIME(db)     man_btree_get_time (db)

#else /* not GDBM or NDBM or BTREE */
#  error Define either GDBM, NDBM or BTREE before including mydbm.h
#endif /* not GDBM or NDBM or BTREE */

#define MYDBM_RESET_DSIZE(d) (MYDBM_DSIZE (d) = strlen (MYDBM_DPTR (d)) + 1)
#define MYDBM_SET(d, value)                                                   \
	do {                                                                  \
		MYDBM_SET_DPTR (d, value);                                    \
		MYDBM_RESET_DSIZE (d);                                        \
	} while (0)
#define MYDBM_FREE_DPTR(d)                                                    \
	do {                                                                  \
		free (MYDBM_DPTR (d));                                        \
		MYDBM_SET_DPTR (d, NULL);                                     \
	} while (0)

/* db_lookup.c */
extern datum copy_datum (datum dat);

/* db_ver.c */
extern void dbver_wr (MYDBM_FILE dbfile);
extern int dbver_rd (MYDBM_FILE dbfile);

#define MAN_DB         "/index" DB_EXT
#define mkdbname(path) xasprintf ("%s%s", path, MAN_DB)

#endif /* MYDBM_H */
