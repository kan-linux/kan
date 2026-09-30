/* system.h: system-dependent declarations; include this first.

   Copyright 1997-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#ifndef TEXINFO_SYSTEM_H
#define TEXINFO_SYSTEM_H

#define _GNU_SOURCE

#include <config.h>

#include <stdlib.h>

/* Use POSIX headers.  If they are not available, we use the substitute
   provided by gnulib.  */
#include <unistd.h>

#include <fcntl.h>

/* For gettext (NLS).  */
#include "gettext.h"

#define _(String) gettext (String)
#define N_(String) (String)

/* MS-DOS and similar non-Posix systems have some peculiarities:
    - they distinguish between binary and text files;
    - they use both `/' and `\\' as directory separator in file names;
    - they can have a drive letter X: prepended to a file name;
    - they have a separate root directory on each drive;
    - their filesystems are case-insensitive;
    - directories in environment variables (like INFOPATH) are separated
        by `;' rather than `:';
    - text files can have their lines ended either with \n or with \r\n pairs;
   These are all parameterized here except the last, which is
   handled by the source code as appropriate (mostly, in info/).  */
#ifndef O_BINARY
# ifdef _O_BINARY
#  define O_BINARY _O_BINARY
# else
#  define O_BINARY 0
# endif
#endif /* O_BINARY */

#if O_BINARY
# ifdef HAVE_IO_H
#  include <io.h>
# endif
# ifdef __CYGWIN__
#  define PATH_SEP	":"
#  define STRIP_DOT_EXE	0
#  define NULL_DEVICE "/dev/null"
#  define PIPE_USE_FORK	1
# else  /* O_BINARY && !__CYGWIN__ */
#  define PATH_SEP	";"
#  define STRIP_DOT_EXE	1
#  define NULL_DEVICE "NUL"
#  define PIPE_USE_FORK	0
# endif /* O_BINARY && !__CYGWIN__ */
  /* Back to any O_BINARY system.  */
# define FILENAME_CMP	mbscasecmp
# define FILENAME_CMPN	mbsncasecmp
# define FOPEN_RBIN	"rb"
# define FOPEN_WBIN	"wb"
# define HAVE_DRIVE(n)	((n)[0] && (n)[1] == ':')
# define IS_SLASH(c)	((c) == '/' || (c) == '\\')
# define HAS_SLASH(s)	(strchr ((s), '/') || strchr ((s), '\\'))
# define IS_ABSOLUTE(n)	(IS_SLASH((n)[0]) || HAVE_DRIVE(n))

#else  /* not O_BINARY, i.e., Unix */
# define FOPEN_RBIN	"r"
# define FOPEN_WBIN	"w"
# define IS_SLASH(c)	((c) == '/')
# define HAS_SLASH(s)	(strchr ((s), '/'))
# define HAVE_DRIVE(n)	(0)
# define IS_ABSOLUTE(n)	((n)[0] == '/')
# define FILENAME_CMP	strcmp
# define FILENAME_CMPN	strncmp
# define PATH_SEP	":"
# define STRIP_DOT_EXE	0
# define NULL_DEVICE	"/dev/null"
# define PIPE_USE_FORK	1
#endif /* not O_BINARY */

#endif /* TEXINFO_SYSTEM_H */
