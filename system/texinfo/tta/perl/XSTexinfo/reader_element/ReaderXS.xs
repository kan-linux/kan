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

/* ALTIMP perl/Texinfo/ReaderNonXS.pm */

#include <stdio.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "reader_types.h"
#include "element_types.h"
#include "types_data.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "builtin_commands.h"
#include "tree.h"
#include "command_stack.h"
#include "reader_api.h"
#include "reader.h"
#include "build_perl_info.h"
#include "get_perl_info.h"
#include "get_perl_tree_elements.h"
#include "build_perl_tree_elements.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */


MODULE = Texinfo::Reader		PACKAGE = Texinfo::Reader

PROTOTYPES: ENABLE

SV *
new (SV *element_sv)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            ELEMENT *element
              = get_sv_element_element (element_sv, document);
            size_t reader_number = txi_register_new_reader (element, document);
            HV *hv_stash = gv_stashpv ("Texinfo::Reader", GV_ADD);
            RETVAL = sv_bless (newRV_noinc (newSViv (reader_number)), hv_stash);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
         RETVAL

SV *
read (SV *reader_sv)
      PREINIT:
        READER *reader;
        SV *token_sv = 0;
      CODE:
        reader = get_sv_reader_reader (reader_sv);
        if (reader)
          {
            const READER_TOKEN *token = txi_reader_read (reader);

            if (token)
              {
                HV *token_hv = newHV ();
                SV *token_element_sv;
                if (token->element->sv)
                  token_element_sv = newSVsv ((SV *)token->element->sv);
                else
             /* in that case the element is not in the token, but the
                caller can call register_token_element
                on the Perl reader to register the element and add handles
                for Perl and get the Perl element reference */
                  token_element_sv = newSV (0);

                hv_store (token_hv, "element", strlen ("element"),
                          token_element_sv, 0);
                hv_store (token_hv, "category", strlen ("category"),
                          newSViv (token->category), 0);
                token_sv = newRV_noinc ((SV *)token_hv);
              }
          }
        if (token_sv)
          RETVAL = token_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
         RETVAL

SV *
skip_children (SV *reader_sv, SV *)
      PREINIT:
        READER *reader;
        SV *token_sv = 0;
      CODE:
        reader = get_sv_reader_reader (reader_sv);
        if (reader)
          {
            const READER_TOKEN *token = txi_reader_skip_children (reader, 0);

            if (token)
              {
                HV *token_hv = newHV ();

                hv_store (token_hv, "element", strlen ("element"),
                          newSVsv ((SV *)token->element->sv), 0);
                hv_store (token_hv, "category", strlen ("category"),
                          newSViv (token->category), 0);
                token_sv = newRV_noinc ((SV *)token_hv);
              }
          }
        if (token_sv)
          RETVAL = token_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
         RETVAL

SV *
reader_collect_commands_list (SV *element_sv, SV *commands_list_sv)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            SSize_t i;
            size_t j;
            AV *elements_av = newAV ();
            ELEMENT *element
              = get_sv_element_element (element_sv, document);
            AV *av = (AV *)SvRV (commands_list_sv);
            SSize_t commands_nr = AvFILL (av) +1;
            static COMMAND_STACK commands_stack;
            CONST_ELEMENT_LIST *elements;

            for (i = 0; i < commands_nr; i++)
              {
                SV **command_sv = av_fetch (av, i, 0);
                if (command_sv)
                  {
                    const char *cmdname = SvPV_nolen (*command_sv);
                    enum command_id cmd = lookup_builtin_command (cmdname);
                    if (cmd)
                      push_command (&commands_stack, cmd);
                  }
              }
            elements = txi_reader_collect_commands_list (element,
                                                         &commands_stack);
            reset_command_stack (&commands_stack);

            for (j = 0; j < elements->number; j++)
              {
                ELEMENT *command = (ELEMENT *)elements->list[j];
                register_element_handle_in_sv (command, document);
                av_push (elements_av, newSVsv (command->sv));
              }
            destroy_const_element_list (elements);
            RETVAL = newRV_noinc ((SV *)elements_av);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
         RETVAL

SV *
register_token_element (SV *reader_sv)
      PREINIT:
        READER *reader;
      CODE:
        reader = get_sv_reader_reader (reader_sv);
        if (reader)
          {
            register_element_handle_in_sv ((ELEMENT *)reader->token.element,
                                           reader->document);
            RETVAL = newSVsv ((SV *)reader->token.element->sv);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
         RETVAL

void
register_token_element_child (SV *reader_sv, int child_index=0)
      PREINIT:
        READER *reader;
      CODE:
        reader = get_sv_reader_reader (reader_sv);
        if (reader)
          {
            const ELEMENT *element = reader->token.element;
            long flags = builtin_command_data[element->e.c->cmd].flags;
            if (flags & CF_root || flags & CF_block)
              {
                const ELEMENT *argument = contents_child_by_index (element, 0);
                if (argument->type == ET_arguments_line)
                  element = argument;
              }
            ELEMENT *e_child = contents_child_by_index (element, child_index);
            register_element_handle_in_sv (e_child,
                                           reader->document);
          }

