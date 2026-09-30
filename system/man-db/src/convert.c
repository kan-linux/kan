/*
 * convert.c: simple encoding conversions
 *
 * Copyright (C) 2007-2022 Colin Watson.
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

#include <errno.h>
#include <stdbool.h>
#include <string.h>

#ifdef HAVE_ICONV
#  include <iconv.h>
#endif /* HAVE_ICONV */

#include "attribute.h"
#include "xalloc.h"
#include "xvasprintf.h"

#include "manconfig.h"

#include "cleanup.h"
#include "encodings.h"

#include "convert.h"

#ifdef HAVE_ICONV
static bool conv_to_locale_initialized = false;
static iconv_t conv_to_locale = (iconv_t) -1;

static void close_conv_to_locale (void *ignored MAYBE_UNUSED)
{
	iconv_close (conv_to_locale);
}

char *ATTRIBUTE_MALLOC convert_to_locale (char *string)
{
	if (!conv_to_locale_initialized) {
		char *locale_charset =
		        xasprintf ("%s//IGNORE", get_locale_charset ());
		conv_to_locale = iconv_open (locale_charset, "UTF-8");
		free (locale_charset);
		if (conv_to_locale != (iconv_t) -1)
			push_cleanup (close_conv_to_locale, NULL, 0);
		conv_to_locale_initialized = true;
	}

	if (conv_to_locale != (iconv_t) -1) {
		size_t string_conv_alloc = strlen (string) + 1;
		char *string_conv = xmalloc (string_conv_alloc);
		for (;;) {
			char *inptr = string, *outptr = string_conv;
			size_t inleft = strlen (string);
			size_t outleft = string_conv_alloc - 1;
			if (iconv (conv_to_locale,
			           (ICONV_CONST char **) &inptr, &inleft,
			           &outptr, &outleft) == (size_t) -1 &&
			    errno == E2BIG) {
				string_conv_alloc <<= 1;
				string_conv = xrealloc (string_conv,
				                        string_conv_alloc);
			} else {
				/* Either we succeeded, or we've done our
				 * best; go ahead and print what we've got.
				 */
				string_conv[string_conv_alloc - 1 - outleft] =
				        '\0';
				break;
			}
		}
		return string_conv;
	} else
		return xstrdup (string);
}
#else  /* !HAVE_ICONV */
char *ATTRIBUTE_MALLOC convert_to_locale (char *string)
{
	return xstrdup (string);
}
#endif /* HAVE_ICONV */
