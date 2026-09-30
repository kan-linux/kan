/*
 * db_store.c: dbstore(), database storage routine.
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002 Colin Watson.
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
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "attribute.h"
#include "error.h"
#include "gl_array_list.h"
#include "gl_xlist.h"
#include "timespec.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "manconfig.h"

#include "debug.h"
#include "filenames.h"
#include "glcontainers.h"

#include "db_storage.h"
#include "mydbm.h"

/* compare_ids(a,b) is negative if id 'a' is preferred to id 'b', i.e. if
 * 'a' is a more canonical database entry than 'b'; positive if 'b' is
 * preferred to 'a'; and zero if they are equivalent. This usually goes in
 * comparison order, but there's a special exception when FAVOUR_STRAYCATS
 * is set.
 *
 * If promote_links is true, consider SO_MAN equivalent to ULT_MAN. This is
 * appropriate when sorting candidate pages for display.
 */
int ATTRIBUTE_CONST compare_ids (char a, char b, bool promote_links)
{
#ifdef FAVOUR_STRAYCATS
	if (a == WHATIS_MAN && b == STRAY_CAT)
		return 1;
	else if (a == STRAY_CAT && b == WHATIS_MAN)
		return -1;
#endif

	if (promote_links) {
		if ((a == ULT_MAN && b == SO_MAN) ||
		    (a == SO_MAN && b == ULT_MAN))
			return 0;
	}

	if (a < b)
		return -1;
	else if (a > b)
		return 1;
	else
		return 0;
}

enum replace_action {
	REPLACE_YES = 0,
	REPLACE_NO,
	REPLACE_FAIL
};

/* The do_we_replace logic. Decide, for some existing key, whether it should
 * be replaced with some new contents. Check that names and section
 * extensions match before calling this.
 */
static int replace_if_necessary (MYDBM_FILE dbf, struct mandata *newdata,
                                 struct mandata *olddata, datum newkey,
                                 datum newcont)
{
	enum replace_action action;

	/* It's OK to replace ULT_MAN with SO_MAN if the mtime is newer. It
	 * isn't OK to replace a real page (either ULT_MAN or SO_MAN) with a
	 * whatis reference; if the real page really went away then
	 * purge_missing will catch that in time, but a real page that still
	 * exists should always take precedence.
	 *
	 * Tie-break whatis references by lexicographical sort of
	 * the pointed-to page names, which isn't great but at least
	 * gives us something reproducible.
	 *
	 * TODO: name fields should be collated with the requested name
	 */
	if (compare_ids (newdata->id, olddata->id, false) < 0) {
		debug ("replace_if_necessary: stronger ID; replacing\n");
		action = REPLACE_YES;
	} else if (compare_ids (newdata->id, olddata->id, true) <= 0 &&
	           timespec_cmp (newdata->mtime, olddata->mtime) > 0) {
		debug ("replace_if_necessary: newer mtime; replacing\n");
		action = REPLACE_YES;
	} else if (compare_ids (newdata->id, olddata->id, true) <= 0 &&
	           timespec_cmp (newdata->mtime, olddata->mtime) < 0) {
		debug ("replace_if_necessary: older mtime; not replacing\n");
		action = REPLACE_NO;
	} else if (compare_ids (newdata->id, olddata->id, false) > 0) {
		debug ("replace_if_necessary: weaker ID; not replacing\n");
		action = REPLACE_NO;
	} else if (newdata->pointer && olddata->pointer &&
	           strcmp (newdata->pointer, olddata->pointer) < 0) {
		debug ("replace_if_necessary: pointer '%s' < '%s'; "
		       "replacing\n",
		       newdata->pointer, olddata->pointer);
		action = REPLACE_YES;
	} else if (newdata->pointer && olddata->pointer &&
	           strcmp (newdata->pointer, olddata->pointer) > 0) {
		debug ("replace_if_necessary: pointer '%s' > '%s'; "
		       "not replacing\n",
		       newdata->pointer, olddata->pointer);
		action = REPLACE_NO;
	} else if (!STREQ (dash_if_unset (newdata->comp), olddata->comp)) {
		debug ("replace_if_necessary: differing compression "
		       "extensions (%s != %s); failing\n",
		       dash_if_unset (newdata->comp), olddata->comp);
		action = REPLACE_FAIL;
	} else {
		debug ("replace_if_necessary: match; not replacing\n");
		action = REPLACE_NO;
	}

	switch (action) {
		case REPLACE_YES:
			if (MYDBM_REPLACE (dbf, newkey, newcont))
				gripe_replace_key (dbf, MYDBM_DPTR (newkey));
			return 0;
		case REPLACE_NO:
			/* Insert if missing, but ignore failures. */
			MYDBM_INSERT (dbf, newkey, newcont);
			return 0;
		default:
			return 1;
	}
}

/* The complement of split_content */
static datum make_content (struct mandata *in)
{
	datum cont;
	static const char dash[] = "-";
	char *value;

	memset (&cont, 0, sizeof cont);

	if (!in->pointer)
		in->pointer = xstrdup (dash);
	if (!in->comp)
		in->comp = xstrdup (dash);
	if (!in->filter)
		in->filter = xstrdup (dash);
	if (!in->whatis)
		in->whatis = xstrdup (dash + 1);

	value = xasprintf ("%s\t%s\t%s\t%ld\t%ld\t%c\t%s\t%s\t%s\t%s",
	                   dash_if_unset (in->name), in->ext, in->sec,
	                   (long) in->mtime.tv_sec, (long) in->mtime.tv_nsec,
	                   in->id, in->pointer, in->filter, in->comp,
	                   in->whatis);
	assert (value);
	MYDBM_SET (cont, value);

#ifdef NDBM
	/* limit of 4096 bytes of data using ndbm */
	if (MYDBM_DSIZE (cont) > 4095) {
		MYDBM_DPTR (cont)[4095] = '\0';
		MYDBM_DSIZE (cont) = 4096;
	}
#endif
	return cont;
}

/* The complement of list_extensions. */
static char *make_extensions_reference (gl_list_t refs)
{
	struct name_ext *ref;
	size_t len = 0;
	char *data, *cur;

	GL_LIST_FOREACH (refs, ref)
		len += strlen (ref->name) + strlen (ref->ext) + 2;

	cur = data = xmalloc (len + 1);
	GL_LIST_FOREACH (refs, ref) {
		*cur++ = '\t';
		cur = stpcpy (cur, ref->name);
		*cur++ = '\t';
		cur = stpcpy (cur, ref->ext);
	}

	return data;
}

/*
 Any one of three situations can occur when storing some data.

 1) no simple key is found.
        store as singular reference.
 2) simple key already exists, content starts with a '\t'.
        Already multiple reference. Add our new item in multiple format
        and update the simple key content, to point to our new one also.
 3) simple key already exists, content does not start with a '\t'.
        First we have to reformat the simple key into a multi key for the
        old item, and insert. Then we have to insert the new data as a
        multi key. Lastly we must create the simple key and do a replace
        on it.

 Use precedence algorithm on inserts. If we already have a key assigned
 to the new value, check priority of page using id. If new page is higher
 (lower value), replace old with new, otherwise ignore new page.

 If we have two ULT_MAN pages competing for the same key, we must have
 more than one of foo.sec, foo.sec.comp1, foo.sec.comp2. OR we have a
 replacement page. If the mtimes differ, throw out the old struct and
 replace it with the new, if the comp exts differ, oops, this is bad,
 keep one and return appropriate error code.

 If we have two WHATIS_MAN pages or a WHATIS_MAN and a SO_MAN page
 competing for the same key, don't worry. This will happen a lot and is
 not a problem.

 return errorcode or 0 on success.
*/
int dbstore (MYDBM_FILE dbf, struct mandata *in, const char *base)
{
	datum oldkey, oldcont;
	gl_list_t refs;
	struct name_ext *ref;
	char *value;
	int ret = 0;

	memset (&oldkey, 0, sizeof oldkey);
	memset (&oldcont, 0, sizeof oldcont);

	/* create a simple key */
	MYDBM_SET (oldkey, name_to_key (base));
	if (!*base) {
		dbprintf (in);
		return 2;
	}

	if (in->name) {
		error (0, 0,
		       "in->name (%s) should not be set when calling "
		       "dbstore()!\n",
		       in->name);
		free (in->name);
		in->name = NULL;
	}

	/* get the content for the simple key */

	oldcont = MYDBM_FETCH (dbf, oldkey);

	if (MYDBM_DPTR (oldcont) == NULL) { /* situation (1) */
		if (!STREQ (base, MYDBM_DPTR (oldkey)))
			in->name = xstrdup (base);
		oldcont = make_content (in);
		if (MYDBM_REPLACE (dbf, oldkey, oldcont))
			gripe_replace_key (dbf, MYDBM_DPTR (oldkey));
		MYDBM_FREE_DPTR (oldcont);
		free (in->name);
		in->name = NULL;
	} else if (*MYDBM_DPTR (oldcont) == '\t') { /* situation (2) */
		datum newkey, newcont;

		memset (&newkey, 0, sizeof newkey);
		memset (&newcont, 0, sizeof newcont);

		newkey = make_multi_key (base, in->ext);
		newcont = make_content (in);

		/* Try to insert the new multi data */

		if (MYDBM_INSERT (dbf, newkey, newcont)) {
			datum cont;
			struct mandata *info;

			MYDBM_FREE_DPTR (oldcont);
			cont = MYDBM_FETCH (dbf, newkey);
			info = split_content (dbf, MYDBM_DPTR (cont));
			ret = replace_if_necessary (dbf, in, info, newkey,
			                            newcont);
			MYDBM_FREE_DPTR (cont);
			free_mandata_struct (info);
			MYDBM_FREE_DPTR (newkey);
			MYDBM_FREE_DPTR (newcont);
			MYDBM_FREE_DPTR (oldkey);

			return ret;
		}

		/* Now lets add some info to the simple key's cont. */

		/* This next bit needs to be done first as we'll wipe out
		   MYDBM_DPTR (oldcont) otherwise (for NDBM only!) */

		MYDBM_FREE_DPTR (newkey);
		MYDBM_FREE_DPTR (newcont);

		refs = list_extensions (MYDBM_DPTR (oldcont) + 1);
		ref = XMALLOC (struct name_ext);
		/* Not copied. */
		ref->name = base;
		ref->ext = in->ext;
		gl_sortedlist_add (refs, name_ext_compare, ref);
		value = make_extensions_reference (refs);
		gl_list_free (refs);

		MYDBM_SET (newcont, value);
		MYDBM_FREE_DPTR (oldcont);

		/* Try to replace the old simple data with the new stuff */

		if (MYDBM_REPLACE (dbf, oldkey, newcont))
			gripe_replace_key (dbf, MYDBM_DPTR (oldkey));

		MYDBM_FREE_DPTR (newcont);
	} else { /* situation (3) */
		datum newkey, newcont, lastkey, lastcont;
		struct mandata *old;
		char *old_name;

		memset (&newkey, 0, sizeof newkey);
		memset (&newcont, 0, sizeof newcont);
		memset (&lastkey, 0, sizeof lastkey);
		memset (&lastcont, 0, sizeof lastcont);

		/* Extract the old singular reference */

		old = split_content (dbf, MYDBM_DPTR (oldcont));

		/* Create multi keys for both old
		   and new items, create new content */

		if (old->name)
			old_name = xstrdup (old->name);
		else
			old_name = xstrdup (MYDBM_DPTR (oldkey));

		lastkey = make_multi_key (old_name, old->ext);

		/* Check against identical multi keys before inserting
		   into db */

		if (STREQ (old_name, base) && STREQ (old->ext, in->ext)) {
			if (!STREQ (base, MYDBM_DPTR (oldkey)))
				in->name = xstrdup (base);
			newcont = make_content (in);
			ret = replace_if_necessary (dbf, in, old, oldkey,
			                            newcont);
			MYDBM_FREE_DPTR (oldcont);
			free_mandata_struct (old);
			MYDBM_FREE_DPTR (newcont);
			MYDBM_FREE_DPTR (lastkey);
			MYDBM_FREE_DPTR (oldkey);
			free (old_name);
			free (in->name);
			in->name = NULL;

			return ret;
		}

		/* Multi keys use the proper case, and so don't need a name
		 * field.
		 */
		if (old->name) {
			free (old->name);
			old->name = NULL;
		}

		lastcont = make_content (old);

		/* We always replace here; if the multi key already exists
		 * in the database, then that indicates some kind of
		 * database corruption, but our new multi key is almost
		 * certainly better.
		 */
		if (MYDBM_REPLACE (dbf, lastkey, lastcont))
			gripe_replace_key (dbf, MYDBM_DPTR (lastkey));

		MYDBM_FREE_DPTR (lastkey);
		MYDBM_FREE_DPTR (lastcont);

		newkey = make_multi_key (base, in->ext);
		newcont = make_content (in);

		ret = replace_if_necessary (dbf, in, old, newkey, newcont);

		MYDBM_FREE_DPTR (newkey);
		MYDBM_FREE_DPTR (newcont);

		/* Now build a simple reference to the above two items */

		refs = gl_list_create_empty (GL_ARRAY_LIST, name_ext_equals,
		                             NULL, plain_free, true);
		ref = XMALLOC (struct name_ext);
		/* Not copied. */
		ref->name = old_name;
		ref->ext = old->ext;
		gl_sortedlist_add (refs, name_ext_compare, ref);
		ref = XMALLOC (struct name_ext);
		/* Not copied. */
		ref->name = base;
		ref->ext = in->ext;
		gl_sortedlist_add (refs, name_ext_compare, ref);
		value = make_extensions_reference (refs);
		gl_list_free (refs);

		MYDBM_SET (newcont, value);

		if (MYDBM_REPLACE (dbf, oldkey, newcont))
			gripe_replace_key (dbf, MYDBM_DPTR (oldkey));

		MYDBM_FREE_DPTR (oldcont);
		free_mandata_struct (old);
		MYDBM_FREE_DPTR (newcont);
		free (old_name);
	}

	MYDBM_FREE_DPTR (oldkey);
	return ret;
}
