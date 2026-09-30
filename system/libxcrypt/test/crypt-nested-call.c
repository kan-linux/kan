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
#include <stdlib.h>
#include <stdio.h>

#define PASSW "alexander"

static const char *settings[] =
{
#if INCLUDE_descrypt
  "Mp",
#endif
#if INCLUDE_bigcrypt
  "Mp............",
#endif
#if INCLUDE_bsdicrypt
  "_J9..MJHn",
#endif
#if INCLUDE_md5crypt
  "$1$MJHnaAke",
#endif
#if INCLUDE_nt
  "$3$",
#endif
#if INCLUDE_sunmd5
  "$md5$BPm.fm03$",
#endif
#if INCLUDE_sm3crypt
  "$sm3$MJHnaAkegEVYHsFK",
#endif
#if INCLUDE_sha1crypt
  "$sha1$248488$ggu.H673kaZ5$",
#endif
#if INCLUDE_sha256crypt
  "$5$MJHnaAkegEVYHsFK",
#endif
#if INCLUDE_sha512crypt
  "$6$MJHnaAkegEVYHsFK",
#endif
#if INCLUDE_bcrypt_a
  "$2a$05$UBVLHeMpJ/QQCv3XqJx8zO",
#endif
#if INCLUDE_bcrypt
  "$2b$05$UBVLHeMpJ/QQCv3XqJx8zO",
#endif
#if INCLUDE_bcrypt_y
  "$2y$05$UBVLHeMpJ/QQCv3XqJx8zO",
#endif
#if INCLUDE_bcrypt_x
  "$2x$05$UBVLHeMpJ/QQCv3XqJx8zO",
#endif
#if INCLUDE_yescrypt
  "$y$j9T$MJHnaAkegEVYHsFKkmfzJ1",
#endif
#if INCLUDE_scrypt
  "$7$CU..../....MJHnaAkegEVYHsFKkmfzJ1",
#endif
#if INCLUDE_gost_yescrypt
  "$gy$j9T$MJHnaAkegEVYHsFKkmfzJ1",
#endif
#if INCLUDE_sm3_yescrypt
  "$sm3y$j9T$MJHnaAkegEVYHsFKkmfzJ1",
#endif
};

int
main (void)
{
  char *retval = NULL;
  int status = 0;
  struct crypt_data cd;
  struct crypt_data *p = &cd;
  int cd_size = (int) sizeof (cd);

  for (size_t i = 0; i < ARRAY_SIZE (settings); i++)
    {
      retval = crypt (PASSW, settings[i]);
      retval = crypt (PASSW, retval);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt(3) with output as setting "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      // coverity[var_deref_model]
      retval = crypt (retval, settings[i]);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt(3) with output as key "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_r (PASSW, settings[i], p);
      retval = crypt_r (PASSW, retval, p);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_r(3) with output as setting "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_r (retval, settings[i], p);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_r(3) with output as key "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_rn (PASSW, settings[i], p, cd_size);
      retval = crypt_rn (PASSW, retval, p, cd_size);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_rn(3) with output as setting "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_rn (retval, settings[i], p, cd_size);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_rn(3) with output as key "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_ra (PASSW, settings[i], (void **) &p, &cd_size);
      retval = crypt_ra (PASSW, retval, (void **) &p, &cd_size);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_ra(3) with output as setting "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }

      retval = crypt_ra (retval, settings[i], (void **) &p, &cd_size);

      if (!retval || *retval == '*')
        {
          printf ("Subsequent call to crypt_ra(3) with output as key "
                  "failed for prefix \"%s\".\n",
                  settings[i]);
          status = 1;
        }
    }

  explicit_bzero (&cd, sizeof cd);
  return status;
}
