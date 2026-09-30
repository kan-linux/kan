/*
 * db_lookup.c: low level database interface routines for man.
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002, 2003, 2006, 2007, 2008, 2009, 2012
 *               Colin Watson.
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

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "attribute.h"
#include "error.h"
#include "fnmatch.h"
#include "gl_array_list.h"
#include "gl_xlist.h"
#include "regex.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "gettext.h"
#define _(String) gettext (String)

#include "manconfig.h"

#include "debug.h"
#include "fatal.h"
#include "filenames.h"
#include "glcontainers.h"
#include "wordfnmatch.h"
#include "xregcomp.h"

#include "db_storage.h"
#include "mydbm.h"

/* If using ndbm or BTREE, copy the static storage before doing anything
 * interesting with it. If using gdbm, firstkey and nextkey need to copy the
 * storage because our ordered wrappers keep an effectively static copy.
 */
datum copy_datum (datum dat)
{
	if (MYDBM_DPTR (dat)) {
		MYDBM_SET_DPTR (dat,
		                memcpy (xmalloc (MYDBM_DSIZE (dat) + 1),
		                        MYDBM_DPTR (dat), MYDBM_DSIZE (dat)));
		MYDBM_DPTR (dat)[MYDBM_DSIZE (dat)] = '\0';
	}
	return dat;
}

/* gdbm does locking itself. */
#if defined(NDBM) || defined(BTREE)
void gripe_lock (const char *filename)
{
	error (0, errno, _ ("can't lock index cache %s"), filename);
}
#endif /* NDBM || BTREE */

/* issue fatal message, then exit */
_Noreturn void gripe_corrupt_data (MYDBM_FILE dbf)
{
	fatal (0, _ ("index cache %s corrupt"), dbf->name);
}

/* deal with situation where we cannot replace a key */
_Noreturn void gripe_replace_key (MYDBM_FILE dbf, const char *data)
{
	error (0, 0, _ ("cannot replace key %s"), data);
	gripe_corrupt_data (dbf);
}

static char *copy_if_set (const char *str)
{
	if (STREQ (str, "-"))
		return NULL;
	else
		return xstrdup (str);
}

const char *ATTRIBUTE_CONST dash_if_unset (const char *str)
{
	if (str)
		return str;
	else
		return "-";
}

/* Just print out what would be stored in the db */
void dbprintf (const struct mandata *info)
{
	debug ("name:      %s\n"
	       "sec. ext:  %s\n"
	       "section:   %s\n"
	       "comp. ext: %s\n"
	       "id:        %c\n"
	       "mtime:     %ld.%09ld\n"
	       "pointer:   %s\n"
	       "filter:    %s\n"
	       "whatis:    %s\n\n",
	       dash_if_unset (info->name), info->ext, info->sec, info->comp,
	       info->id, (long) info->mtime.tv_sec, (long) info->mtime.tv_nsec,
	       info->pointer, info->filter, info->whatis);
}

/* Form a multi-style key from page and extension info. The page should
 * *not* be name_to_key()'d - that should only happen to the parent.
 */
datum make_multi_key (const char *page, const char *ext)
{
	datum key;
	char *value;

	value = xasprintf ("%s\t%s", page, ext);
	assert (value);
	memset (&key, 0, sizeof key);
	MYDBM_SET (key, value);
	return key;
}

/* Get the key that should be used for a given name. The caller is
 * responsible for freeing the return value.
 */
char *name_to_key (const char *name)
{
	char *low, *p;

	p = low = xmalloc (strlen (name) + 1);
	while (*name)
		*p++ = CTYPE (tolower, *name++);
	*p = *name;
	return low;
}

/* return char ptr array to the data's fields */
static char **split_data (MYDBM_FILE dbf, char *content, char *start[])
{
	int count;

	/* initialise pointers to first N-1 fields */
	for (count = 0; count < FIELDS - 1; count++) {
		start[count] = strsep (&content, "\t");
		if (!start[count]) {
			error (0, 0,
			       ngettext ("only %d field in content",
			                 "only %d fields in content", count),
			       count);
			gripe_corrupt_data (dbf);
		}
	}

	/* initialise pointer to Nth field (whatis) */
	start[FIELDS - 1] = content;
	if (!start[FIELDS - 1]) {
		error (0, 0,
		       ngettext ("only %d field in content",
		                 "only %d fields in content", FIELDS - 1),
		       FIELDS - 1);
		gripe_corrupt_data (dbf);
	}

	return start;
}

/* Parse the db-returned data and put it into a mandata format */
struct mandata *split_content (MYDBM_FILE dbf, char *cont_ptr)
{
	struct mandata *info;
	char *start[FIELDS];
	char **data;

	data = split_data (dbf, cont_ptr, start);

	info = XZALLOC (struct mandata);
	info->name = copy_if_set (*(data++));
	info->ext = xstrdup (*(data++));
	info->sec = xstrdup (*(data++));
	info->mtime.tv_sec = (time_t) atol (*(data++));
	info->mtime.tv_nsec = atol (*(data++));
	info->id = **(data++); /* single char id */
	info->pointer = xstrdup (*(data++));
	info->filter = xstrdup (*(data++));
	info->comp = xstrdup (*(data++));
	info->whatis = xstrdup (*(data));
	return info;
}

bool ATTRIBUTE_PURE name_ext_equals (const void *elt1, const void *elt2)
{
	const struct name_ext *ref1 = elt1, *ref2 = elt2;
	return STREQ (ref1->name, ref2->name) && STREQ (ref1->ext, ref2->ext);
}

int ATTRIBUTE_PURE name_ext_compare (const void *elt1, const void *elt2)
{
	const struct name_ext *ref1 = elt1, *ref2 = elt2;
	int name_cmp = strcmp (ref1->name, ref2->name);
	if (name_cmp)
		return name_cmp;
	return strcmp (ref1->ext, ref2->ext);
}

/* Extract all of the names/extensions associated with this key. Each case
 * variant of a name will be returned separately.
 *
 * This returns a newly-allocated list of struct name_ext, which the caller
 * is expected to free.
 */
gl_list_t list_extensions (char *data)
{
	gl_list_t list = gl_list_create_empty (GL_ARRAY_LIST, name_ext_equals,
	                                       NULL, plain_free, true);
	char *name;

	while ((name = strsep (&data, "\t")) != NULL) {
		char *ext;
		struct name_ext *name_ext;

		ext = strsep (&data, "\t");
		if (!ext)
			break;

		name_ext = XMALLOC (struct name_ext);
		/* Don't copy these; they will point into the given string. */
		name_ext->name = name;
		name_ext->ext = ext;
		gl_sortedlist_add (list, name_ext_compare, name_ext);
	}

	debug ("found %zu names/extensions\n", gl_list_size (list));
	return list;
}

/* These should be bitwise-ored together. */
#define ALL        0
#define EXACT      1
#define MATCH_CASE 2

/*
 There are three possibilities on lookup:

 1) No data exists, lookup will fail, zero-length list will be returned.
 2) One data item exists. Item is returned as first in list of structures.
 3) Many items exist. They are all returned, in a multiple structure list.
 */
static gl_list_t dblookup (MYDBM_FILE dbf, const char *page,
                           const char *section, int flags)
{
	gl_list_t infos;
	struct mandata *info = NULL;
	datum key, cont;

	infos = gl_list_create_empty (
	        GL_ARRAY_LIST, NULL, NULL,
	        (gl_listelement_dispose_fn) free_mandata_struct, true);

	memset (&key, 0, sizeof key);
	memset (&cont, 0, sizeof cont);

	MYDBM_SET (key, name_to_key (page));
	cont = MYDBM_FETCH (dbf, key);
	MYDBM_FREE_DPTR (key);

	if (MYDBM_DPTR (cont) == NULL) /* No entries at all */
		;
	else if (*MYDBM_DPTR (cont) != '\t') { /* Just one entry */
		bool matches = false;

		info = split_content (dbf, MYDBM_DPTR (cont));
		if (!info->name)
			info->name = xstrdup (page);
		if (!(flags & MATCH_CASE) || STREQ (info->name, page)) {
			if (section == NULL)
				matches = true;
			else if (flags & EXACT) {
				if (STREQ (section, info->ext))
					matches = true;
			} else {
				if (STRNEQ (section, info->ext,
				            strlen (section)))
					matches = true;
			}
		}
		if (matches)
			gl_list_add_last (infos, info);
		else
			free_mandata_struct (info);
	} else { /* Multiple entries */
		gl_list_t refs;
		struct name_ext *ref;

		/* Extract all of the case-variant-names/extensions
		 * associated with this key.
		 */

		refs = list_extensions (MYDBM_DPTR (cont) + 1);

		/* Make the multi keys and look them up */

		GL_LIST_FOREACH (refs, ref) {
			datum multi_cont;

			memset (&multi_cont, 0, sizeof multi_cont);

			/* Decide whether this part of a multi key is
			 * suitable.
			 */

			if ((flags & MATCH_CASE) && !STREQ (ref->name, page))
				continue;

			if (section != NULL) {
				if (flags & EXACT) {
					if (!STREQ (section, ref->ext))
						continue;
				} else {
					if (!STRNEQ (section, ref->ext,
					             strlen (section)))
						continue;
				}
			}

			/* So the key is suitable ... */
			key = make_multi_key (ref->name, ref->ext);
			debug ("multi key lookup (%s)\n", MYDBM_DPTR (key));
			multi_cont = MYDBM_FETCH (dbf, key);
			if (MYDBM_DPTR (multi_cont) == NULL) {
				error (0, 0, _ ("bad fetch on multi key %s"),
				       MYDBM_DPTR (key));
				gripe_corrupt_data (dbf);
			}
			MYDBM_FREE_DPTR (key);

			/* Allocate info struct and add it to the list. */
			info = split_content (dbf, MYDBM_DPTR (multi_cont));
			if (!info->name)
				info->name = xstrdup (ref->name);
			gl_list_add_last (infos, info);
		}

		gl_list_free (refs);
	}
	MYDBM_FREE_DPTR (cont);

	return infos;
}

gl_list_t dblookup_all (MYDBM_FILE dbf, const char *page, const char *section,
                        bool match_case)
{
	return dblookup (dbf, page, section,
	                 ALL | (match_case ? MATCH_CASE : 0));
}

struct mandata *dblookup_exact (MYDBM_FILE dbf, const char *page,
                                const char *section, bool match_case)
{
	gl_list_t infos = dblookup (dbf, page, section,
	                            EXACT | (match_case ? MATCH_CASE : 0));
	struct mandata *info = NULL;

	if (gl_list_size (infos)) {
		/* Return the first item and free the rest of the list. */
		info = (struct mandata *) gl_list_get_at (infos, 0);
		gl_list_set_at (infos, 0, NULL); /* steal memory */
	}
	gl_list_free (infos);
	return info;
}

gl_list_t dblookup_pattern (MYDBM_FILE dbf, const char *pattern,
                            const char *section, bool match_case,
                            bool pattern_regex, bool try_descriptions)
{
	gl_list_t infos;
	datum key, cont;
	regex_t preg;

	infos = gl_list_create_empty (
	        GL_ARRAY_LIST, NULL, NULL,
	        (gl_listelement_dispose_fn) free_mandata_struct, true);

	if (pattern_regex)
		xregcomp (&preg, pattern,
		          REG_EXTENDED | REG_NOSUB |
		                  (match_case ? 0 : REG_ICASE));

#ifndef BTREE
	datum nextkey;

	key = MYDBM_FIRSTKEY (dbf);
	while (MYDBM_DPTR (key)) {
		cont = MYDBM_FETCH (dbf, key);
#else  /* BTREE */
	int end;

	end = man_btree_nextkeydata (dbf, &key, &cont);
	while (!end) {
#endif /* !BTREE */
		struct mandata *info = NULL;
		char *tab;
		bool got_match;

		if (!MYDBM_DPTR (cont)) {
			debug ("key was %s\n", MYDBM_DPTR (key));
			fatal (0,
			       _ ("Database %s corrupted; rebuild with "
			          "mandb --create"),
			       dbf->name);
		}

		if (*MYDBM_DPTR (key) == '$')
			goto nextpage;

#pragma GCC diagnostic push
#if GNUC_PREREQ(10, 0)
#  pragma GCC diagnostic ignored "-Wanalyzer-use-after-free"
#endif
		if (*MYDBM_DPTR (cont) == '\t')
			goto nextpage;
#pragma GCC diagnostic pop

		/* a real page */

		info = split_content (dbf, MYDBM_DPTR (cont));

		/* If there's a section given, does it match either the
		 * section or extension of this page?
		 */
		if (section && (!STREQ (section, info->sec) &&
		                !STREQ (section, info->ext)))
			goto nextpage;

		tab = strrchr (MYDBM_DPTR (key), '\t');
		if (tab)
			*tab = '\0';

		if (!info->name)
			info->name = xstrdup (MYDBM_DPTR (key));

		if (pattern_regex)
			got_match =
			        (regexec (&preg, info->name, 0, NULL, 0) == 0);
		else
			got_match =
			        fnmatch (pattern, info->name,
			                 match_case ? 0 : FNM_CASEFOLD) == 0;
		if (try_descriptions && !got_match && info->whatis) {
			if (pattern_regex)
				got_match = (regexec (&preg, info->whatis, 0,
				                      NULL, 0) == 0);
			else
				got_match =
				        word_fnmatch (pattern, info->whatis);
		}
		if (!got_match)
			goto nextpage_tab;

		gl_list_add_last (infos, info);
		info = NULL; /* avoid freeing later */

nextpage_tab:
		if (tab)
			*tab = '\t';
nextpage:
#ifndef BTREE
		nextkey = MYDBM_NEXTKEY (dbf, key);
		MYDBM_FREE_DPTR (cont);
		MYDBM_FREE_DPTR (key);
		key = nextkey;
#else  /* BTREE */
		MYDBM_FREE_DPTR (cont);
		MYDBM_FREE_DPTR (key);
		end = man_btree_nextkeydata (dbf, &key, &cont);
#endif /* !BTREE */
		free_mandata_struct (info);
	}

	if (pattern_regex)
		regfree (&preg);

	return infos;
}
