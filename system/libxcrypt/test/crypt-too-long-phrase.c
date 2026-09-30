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
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>

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
  char phrase[CRYPT_MAX_PASSPHRASE_SIZE * 2];
  int status = 0;
  struct crypt_data crypt_ctx;

  memset (phrase, 'a', sizeof phrase);
  phrase[sizeof phrase - 1] = '\0';

  for (size_t i = 0; i < ARRAY_SIZE (settings); i++)
    {
      struct crypt_data *cd = &crypt_ctx;
      void **data = (void **) &cd;
      int size = sizeof crypt_ctx;

      memset (cd, 0, sizeof crypt_ctx);
      errno = 0;
      retval = crypt (phrase, settings[i]);

      if ((retval && retval[0] != '*') || errno != ERANGE)
        {
          printf ("crypt(3) returned unexpectedly.\n"
                  "setting: %s\ngot: %s\nERRNO: %d, %s\n",
                  settings[i], retval, errno, strerror (errno));
          status = 1;
        }

      errno = 0;
      retval = crypt_r (phrase, settings[i], cd);

      if ((retval && retval[0] != '*') || errno != ERANGE)
        {
          printf ("crypt_r(3) returned unexpectedly.\n"
                  "setting: %s\ngot: %s\nERRNO: %d, %s\n",
                  settings[i], retval, errno, strerror (errno));
          status = 1;
        }

      errno = 0;
      retval = crypt_rn (phrase, settings[i], cd, size);

      if (retval || errno != ERANGE)
        {
          printf ("crypt_rn(3) returned unexpectedly.\n"
                  "setting: %s\ngot: %s\nERRNO: %d, %s\n",
                  settings[i], retval, errno, strerror (errno));
          status = 1;
        }

      errno = 0;
      retval = crypt_ra (phrase, settings[i], data, &size);

      if (retval || errno != ERANGE)
        {
          printf ("crypt_ra(3) (pre-alloc) returned unexpectedly.\n"
                  "setting: %s\ngot: %s\nERRNO: %d, %s\n",
                  settings[i], retval, errno, strerror (errno));
          status = 1;
        }

      *data = NULL;
      size = 0;
      errno = 0;
      retval = crypt_ra (phrase, settings[i], data, &size);

      if (retval || errno != ERANGE)
        {
          printf ("crypt_ra(3) (new alloc) returned unexpectedly.\n"
                  "setting: %s\ngot: %s\nERRNO: %d, %s\n",
                  settings[i], retval, errno, strerror (errno));
          status = 1;
        }
      free (*data);
    }
  return status;
}
