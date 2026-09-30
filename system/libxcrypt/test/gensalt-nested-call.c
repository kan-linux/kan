/*
 * Copyright (c) 2025 Björn Esser <besser82 at fedoraproject.org>
 * All rights reserved.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted.
 *
 * THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "crypt-port.h"

#if INCLUDE_bcrypt        || INCLUDE_bcrypt_a     || INCLUDE_bcrypt_y    || \
    INCLUDE_bigcrypt      || INCLUDE_bsdicrypt    || INCLUDE_descrypt    || \
    INCLUDE_gost_yescrypt || INCLUDE_md5crypt     || INCLUDE_nt          || \
    INCLUDE_scrypt        || INCLUDE_sha1crypt    || INCLUDE_sha256crypt || \
    INCLUDE_sha512crypt   || INCLUDE_sm3_yescrypt || INCLUDE_sm3crypt    || \
    INCLUDE_sunmd5        || INCLUDE_yescrypt

#include <stdio.h>

static const char *prefixes[] =
{
#if INCLUDE_descrypt
  "Mp",
#endif
#if INCLUDE_bigcrypt
  "Mp............",
#endif
#if INCLUDE_bsdicrypt
  "_",
#endif
#if INCLUDE_md5crypt
  "$1$",
#endif
#if INCLUDE_nt
  "$3$",
#endif
#if INCLUDE_sunmd5
  "$md5$",
#endif
#if INCLUDE_sm3crypt
  "$sm3$",
#endif
#if INCLUDE_sha1crypt
  "$sha1$",
#endif
#if INCLUDE_sha256crypt
  "$5$",
#endif
#if INCLUDE_sha512crypt
  "$6$",
#endif
#if INCLUDE_bcrypt_a
  "$2a$",
#endif
#if INCLUDE_bcrypt
  "$2b$",
#endif
#if INCLUDE_bcrypt_y
  "$2y$",
#endif
#if INCLUDE_yescrypt
  "$y$",
#endif
#if INCLUDE_scrypt
  "$7$",
#endif
#if INCLUDE_gost_yescrypt
  "$gy$",
#endif
#if INCLUDE_sm3_yescrypt
  "$sm3y$",
#endif
};

int
main (void)
{
  char output[CRYPT_GENSALT_OUTPUT_SIZE];
  char *retval = NULL;
  int status = 0;

  for (size_t i = 0; i < ARRAY_SIZE (prefixes); i++)
    {
      retval = crypt_gensalt (prefixes[i], 0, NULL, 0);
      retval = !retval ? 0 : crypt_gensalt (retval, 0, NULL, 0);

      if (!retval)
        {
          printf ("Subsequent call to crypt_gensalt(3) failed for prefix \"%s\".\n",
                  prefixes[i]);
          status = 1;
        }

      retval = crypt_gensalt_rn (prefixes[i], 0, NULL, 0,
                                 output, sizeof output);
      retval = !retval ? 0 : crypt_gensalt_rn (retval, 0, NULL, 0,
                                               output, sizeof output);

      if (!retval)
        {
          printf ("Subsequent call to crypt_gensalt_rn(3) failed for prefix \"%s\".\n",
                  prefixes[i]);
          status = 1;
        }
    }

  return status;
}

#else

int
main (void)
{
  return 77; /* UNSUPPORTED */
}

#endif /* all, but bcrypt_x only */
