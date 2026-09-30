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

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#if defined _WIN32 && !defined __CYGWIN__
/* See comment in Parsetexi.xs for why we #undef free. */
  #undef free
#endif
#include "XSUB.h"
#include "ppport.h"

#undef context

#include <stdio.h>
#include <string.h>
#include <errno.h>

#include "tree_types.h"
#include "option_types.h"
#include "converter_types.h"
#include "document_types.h"
/* non_perl_* has_perl_interpreter */
#include "xs_utils.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

/* for debugging */
int
get_refcount (void *sv)
{
  dTHX;

  return SvREFCNT ((SV *) sv);
}

void
unregister_perl_data (void *sv)
{
  dTHX;

  SvREFCNT_dec ((SV *) sv);
}

void
register_perl_data (void *sv)
{
  dTHX;

  SvREFCNT_inc ((SV *) sv);
}

char *
call_close_perl_io (void *io)
{
  dTHX;

  if (PerlIO_close ((PerlIO *) io))
    return non_perl_strdup (strerror (errno));
  return 0;
}

void
call_switch_to_global_locale (void)
{
  dTHX;

  if (!has_perl_interpreter ())
    return;

#if PERL_VERSION > 27 || (PERL_VERSION == 27 && PERL_SUBVERSION > 8)
  /* needed due to thread-safe locale handling in newer perls */
  switch_to_global_locale ();
#endif
}

void
call_sync_locale (void)
{
  dTHX;

  if (!has_perl_interpreter ())
    return;

#if PERL_VERSION > 27 || (PERL_VERSION == 27 && PERL_SUBVERSION > 8)
  /* needed due to thread-safe locale handling in newer perls */
  sync_locale ();
#endif
}

void
croak_message (char *message)
{
  croak ("%s\n", message);
}

/* could be used for debugging */
void
show_sv_hv (const void *sv, const char *msg)
{
  dTHX;

  fprintf (stderr, "show_sv_hv: %s: %p %p\n", msg, sv, SvRV ((SV *) sv));
}

void *
get_sv_hv (const void *sv)
{
  dTHX;

  if (sv)
    return (void *) SvRV ((SV *) sv);
  return 0;
}
