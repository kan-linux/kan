/* Copyright 2023-2026 Free Software Foundation, Inc.

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

/*
#include <stdlib.h>
#include <stdio.h>
 */

/* Avoid namespace conflicts. */
#define context perl_context

#define PERLIO_NOT_STDIO 0

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "document_types.h"
/* non_perl_free */
#include "xs_utils.h"
#include "convert_to_texinfo.h"
#include "get_perl_info.h"
#include "build_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

MODULE = Texinfo::Convert::Texinfo	PACKAGE = Texinfo::Convert::Texinfo

# there is always a check on prototypes in XSLoader.  So it is simpler if
# they are enabled, and they can/may need to be overriden in a declaration
PROTOTYPES: ENABLE

SV *
plain_texinfo_convert_tree (SV *tree_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        /* caller checks that there is a descriptor */
        document = get_sv_tree_document (tree_in, "plain_texinfo_convert_tree");
        if (document)
          {
            char *result = convert_to_texinfo (document->tree);
            RETVAL = newSVpv_utf8 (result, 0);
            non_perl_free (result);
          }
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

