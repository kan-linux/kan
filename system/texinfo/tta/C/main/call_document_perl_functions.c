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
#include "XSUB.h"

#undef context

/*
#include "tree_types.h"
 */
#include "document_types.h"
/* non_perl_* has_perl_interpreter */
#include "xs_utils.h"
#include "call_document_perl_functions.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

void
call_document_remove_document_references (DOCUMENT *document,
                                          int remove_references)
{
  int count;

  dTHX;

  /* This should only happen if the input Texinfo file was not found.
     In that case, the document is setup, but the code skips to
     document destruction right after handling the errors, such that
     no Perl document is created */
  if (!document->hv)
    return;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs(sv_2mortal (newRV_inc (document->hv)));
  PUSHs(sv_2mortal (newSViv (remove_references)));
  PUTBACK;

  count = call_pv (
    "Texinfo::Document::remove_document_references",
    G_DISCARD|G_SCALAR);

  SPAGAIN;

  if (count != 0)
    croak ("remove_document_references should return 0 item\n");

  PUTBACK;

  FREETMPS;
  LEAVE;
}
