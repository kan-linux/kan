/* xs_utils.h - declarations for xs_utils.c */
#ifndef XS_UTILS_H
#define XS_UTILS_H

/* Copyright 2010-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

#include <config.h>

#include <stdarg.h>
#include <stddef.h>

#include "use_interpreter_types.h"

/* in set_perl_interpreter.c */
void set_use_perl_interpreter (enum interpreter_use value);
int has_perl_interpreter (void);

void non_perl_free (void *ptr);
void *non_perl_malloc (size_t size);
void *non_perl_realloc (void *ptr, size_t size);
char *non_perl_strdup (const char *s);
char *non_perl_strndup (const char *s, size_t n);
int non_perl_xvasprintf (char **ptr, const char *template, va_list ap);

#endif
