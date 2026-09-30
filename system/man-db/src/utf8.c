/*
 * utf8.c: UTF-8 validation
 *
 * Based on glib's gutf8.c, which is:
 * Copyright (C) 1999 Tom Tromey
 * Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see
 * <https://www.gnu.org/licenses/>.
 */

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <stdbool.h>
#include <stddef.h>

#include "attribute.h"

#include "manconfig.h"

#include "utf8.h"

#define VALIDATE_BYTE(mask, expect)                                           \
	do {                                                                  \
		if (UNLIKELY ((*(unsigned char *) p & (mask)) != (expect)))   \
			goto error;                                           \
	} while (0)

/* see IETF RFC 3629 Section 4 */

static const char *ATTRIBUTE_PURE fast_validate_len (const char *str,
                                                     size_t max_len)
{
	const char *p;
	const char *end = str + max_len;

	for (p = str; p < end && *p; p++) {
		const char *last;

		if (*(unsigned char *) p < 128)
			continue;

		last = p;
		if (*(unsigned char *) p < 0xe0) {
			/* 110xxxxx */
			if (UNLIKELY (end - p < 2))
				goto error;

			if (UNLIKELY (*(unsigned char *) p < 0xc2))
				goto error;
		} else if (*(unsigned char *) p < 0xf0) {
			/* 1110xxxx */
			if (UNLIKELY (end - p < 3))
				goto error;

			switch (*(unsigned char *) p++ & 0x0f) {
				case 0:
					/* 0xa0 ... 0xbf */
					VALIDATE_BYTE (0xe0, 0xa0);
					break;
				case 0x0d:
					/* 0x80 ... 0x9f */
					VALIDATE_BYTE (0xe0, 0x80);
					break;
				default:
					/* 10xxxxxx */
					VALIDATE_BYTE (0xc0, 0x80);
			}
		} else if (*(unsigned char *) p < 0xf5) {
			/* 11110xxx excluding out-of-range */
			if (UNLIKELY (end - p < 4))
				goto error;

			switch (*(unsigned char *) p++ & 0x07) {
				case 0:
					/* 0x90 ... 0xbf */
					VALIDATE_BYTE (0xc0, 0x80);
					if (UNLIKELY ((*(unsigned char *) p &
					               0x30) == 0))
						goto error;
					break;
				case 4:
					/* 0x80 ... 0x8f */
					VALIDATE_BYTE (0xf0, 0x80);
					break;
				default:
					/* 10xxxxxx */
					VALIDATE_BYTE (0xc0, 0x80);
			}
			p++;
			/* 10xxxxxx */
			VALIDATE_BYTE (0xc0, 0x80);
		} else
			goto error;

		p++;
		/* 10xxxxxx */
		VALIDATE_BYTE (0xc0, 0x80);

		continue;

error:
		return last;
	}

	return p;
}

/* Validates UTF-8 encoded text.  str is the text to validate; max_len is
 * the number of bytes to validate.
 *
 * Note that utf8_validate() returns false if any of the max_len bytes are
 * NUL.
 *
 * Returns true if the text was valid UTF-8.
 */
bool ATTRIBUTE_PURE utf8_validate_len (const char *str, size_t max_len)
{
	const char *p;

	p = fast_validate_len (str, max_len);

	return p == str + max_len;
}
