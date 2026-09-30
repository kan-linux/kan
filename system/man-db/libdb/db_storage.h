/*
 * db_storage.h: define mandata structure, some macros and prototypes
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2002, 2003, 2007, 2008 Colin Watson.
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
 * Sat Oct 29 13:09:31 GMT 1994  Wilf. (G.Wilford@ee.surrey.ac.uk)
 */

#ifndef DB_STORAGE_H
#define DB_STORAGE_H

#include <stdbool.h>

#include "gl_list.h"

/* These definitions give an inherent precedence to each particular type
   of manual page:

   ULT_MAN:	ultimate manual page, the full source nroff file.
   SO_MAN:	source nroff file containing .so request to an ULT_MAN.
   WHATIS_MAN:	virtual `whatis referenced' page pointing to an ULT_MAN.
   STRAY_CAT:	pre-formatted manual page with no source.
   WHATIS_CAT:  virtual `whatis referenced' page pointing to a STRAY_CAT. */

/* WHATIS_MAN and WHATIS_CAT are deprecated. */

#define ULT_MAN    'A'
#define SO_MAN     'B'
#define WHATIS_MAN 'C'
#define STRAY_CAT  'D'
#define WHATIS_CAT 'E'

#define FIELDS 10 /* No of fields in each database page `content' */

#include "filenames.h"

#include "mydbm.h"

struct name_ext {
	const char *name;
	const char *ext;
};

/* used by the world */
extern gl_list_t dblookup_all (MYDBM_FILE dbf, const char *page,
                               const char *section, bool match_case);
extern struct mandata *dblookup_exact (MYDBM_FILE dbf, const char *page,
                                       const char *section, bool match_case);
extern gl_list_t dblookup_pattern (MYDBM_FILE dbf, const char *page,
                                   const char *section, bool match_case,
                                   bool pattern_regex, bool try_descriptions);
extern int dbstore (MYDBM_FILE dbf, struct mandata *in, const char *base);
extern int dbdelete (MYDBM_FILE dbf, const char *name, struct mandata *in);
extern void dbprintf (const struct mandata *info);
extern struct mandata *split_content (MYDBM_FILE dbf, char *cont_ptr);
extern int compare_ids (char a, char b, bool promote_links);

/* local to db routines */
extern void gripe_lock (const char *filename);
extern void gripe_corrupt_data (MYDBM_FILE dbf);
extern datum make_multi_key (const char *page, const char *ext);

extern char *name_to_key (const char *name);
bool name_ext_equals (const void *elt1, const void *elt2);
int name_ext_compare (const void *elt1, const void *elt2);
/* Returns a list of struct name_ext. */
extern gl_list_t list_extensions (char *data);
extern void gripe_replace_key (MYDBM_FILE dbf, const char *data);
extern const char *dash_if_unset (const char *str);

#endif
