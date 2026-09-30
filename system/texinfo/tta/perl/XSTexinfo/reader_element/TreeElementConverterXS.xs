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

#include <stdio.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "builtin_commands.h"
#include "tree.h"
#include "extra.h"
#include "targets.h"
/* get_cmd_global_uniq_command lookup_index_entry */
#include "utils.h"
#include "translations.h"
/* wipe_error_message_list */
#include "errors.h"
/* index_content_element */
#include "manipulate_indices.h"
/* comment_or_end_line argument_comment_end_line */
#include "convert_utils.h"
#include "xs_utils.h"
#include "build_perl_info.h"
#include "get_perl_tree_elements.h"
#include "get_perl_info.h"
/* get_sv_converter */
#include "get_converter_perl_info.h"
#include "build_perl_tree_elements.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

MODULE = Texinfo::Example::TreeElementConverterXS		PACKAGE = Texinfo::Example::TreeElementConverterXS

PROTOTYPES: ENABLE

# USE_SV set means that the ELEMENT_HASH argument should be used as
# the Perl element associated to the C data.  That way there is no
# need to build a Perl element from C afterwards.  This is relevant
# when the TreeElement interface is not used.
# If the Perl elements are never built, when the TreeElement+Reader
# interfaces are both used, the Perl element fields that are not
# setup by register_element_handle_in_sv are never accessed so
# there is no need to set USE_SV.
SV *
new_tree_element (SV *converter_in, SV *element_hash, int use_sv=0)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_converter_sv_document (converter_in, 0);

        if (document)
          {
            CONVERTER *converter = get_sv_converter (converter_in, 0);
            ELEMENT *e = new_element_from_sv (document, element_hash,
                                              converter);
            if (use_sv)
              {
                HV *hv_stash = gv_stashpv ("Texinfo::TreeElement", GV_ADD);
             /* this first refcount increase keeps the mortal argument alive */
                e->sv = sv_bless (newSVsv (element_hash), hv_stash);
                register_sv_element_handle_in_sv (e, e->sv, document);
                RETVAL = (newSVsv (e->sv));
              }
            else
              {
                register_element_handle_in_sv (e, document);
                RETVAL = newSVsv ((SV *)e->sv);
              }
            add_to_element_list (&document->additional_elements, e);
          }
        else
          {
            HV *hv_stash = gv_stashpv ("Texinfo::TreeElement", GV_ADD);
            RETVAL = sv_bless (newSVsv (element_hash), hv_stash);
          }
    OUTPUT:
         RETVAL

void
register_document_relations_lists_elements (SV *converter_in, SV *document_in);

# NOTE not used not tested
SV *
get_tree_element_by_identifier (SV *converter_in, identifier)
        const char *identifier = (char *)SvPVutf8_nolen($arg);
      PREINIT:
        DOCUMENT *document;
        SV *result_sv = 0;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          {
            ELEMENT *element
              = find_identifier_target (&document->identifiers_target,
                                        identifier);
            if (element)
              {
                register_element_handle_in_sv (element, document);
                result_sv = newSVsv ((SV *)element->sv);
              }
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
get_global_unique_tree_element (SV *converter_in, cmdname)
        const char *cmdname = (char *)SvPV_nolen($arg);
      PREINIT:
        DOCUMENT *document;
        SV *result_sv = 0;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          {
            enum command_id cmd = lookup_builtin_command (cmdname);
            if (cmd)
              {
                ELEMENT *element = (ELEMENT *)get_cmd_global_uniq_command (
                              &document->global_commands, cmd);
                if (element)
                  {
                    register_element_handle_in_sv (element, document);
                    result_sv = newSVsv ((SV *)element->sv);
                  }
              }
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
global_commands_information_command_list (SV *document_sv, char *cmdname)
      PREINIT:
        SV *result_sv = 0;
        DOCUMENT *document;
        enum command_id cmd;
      CODE:
        document = get_sv_document_document (document_sv,
                             "global_commands_information_command_list");
        cmd = lookup_builtin_command (cmdname);
        if (document && cmd)
          {
             const ELEMENT_LIST *command_list
               = get_cmd_global_multi_command (&document->global_commands, cmd);
             if (command_list && command_list->number)
               {
                 size_t i;
                 AV *av = newAV ();
                 result_sv = newRV_noinc ((SV *) av);
                 for (i = 0; i < command_list->number; i++)
                   {
                     ELEMENT *element = command_list->list[i];
                     register_element_handle_in_sv (element, document);

                     av_push (av, newSVsv ((SV *) element->sv));
                   }
               }
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

void
get_tree_element_index_entry (SV *, SV *element_sv)
      PREINIT:
        DOCUMENT *document;
        SV *index_entry_sv = 0;
        SV *index_info_sv = 0;
     PPCODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            const INDEX_ENTRY_LOCATION *index_entry_info
                        = lookup_extra_index_entry (element,
                                                    AI_key_index_entry);

            if (index_entry_info)
              {
                INDEX_ENTRY_AND_INDEX *idx_info
                       = lookup_index_entry (index_entry_info,
                                             &document->indices_info);
                if (idx_info->index_entry)
                  {
                    const INDEX_ENTRY *index_entry = idx_info->index_entry;
                    HV *entry_hv = build_index_entry (index_entry);
                    HV *index_info_hv
                     = build_single_index_info (idx_info->index);
                    index_entry_sv = newRV_noinc ((SV *)entry_hv);
                    index_info_sv = newRV_noinc ((SV *)index_info_hv);

                    register_element_handle_in_sv (index_entry->entry_element,
                                                   document);
                    if (index_entry->entry_associated_element)
                      register_element_handle_in_sv (
                                index_entry->entry_associated_element,
                                                     document);
                  }
                free (idx_info);
              }
          }

        if (!index_entry_sv)
          {
            index_entry_sv = newSV (0);
            index_info_sv = newSV (0);
          }

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(index_entry_sv));
        PUSHs(sv_2mortal(index_info_sv));

void
comment_or_end_line (SV *, SV *element_sv)
      PREINIT:
        DOCUMENT *document;
        SV *comment_sv = 0;
        SV *end_line_sv = 0;
     PPCODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);

            COMMENT_OR_END_LINE *end_line_info = comment_or_end_line (element);

            if (end_line_info->comment)
              comment_sv = newSVsv ((SV *)end_line_info->comment->sv);
            else
              end_line_sv = newSVpv_utf8 (end_line_info->end_line, 0);
            non_perl_free (end_line_info);
          }

        if (!comment_sv)
          comment_sv = newSV (0);
        if (!end_line_sv)
          end_line_sv = newSV (0);

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(comment_sv));
        PUSHs(sv_2mortal(end_line_sv));

void
argument_comment_end_line (SV *, SV *element_sv)
      PREINIT:
        DOCUMENT *document;
        SV *comment_sv = 0;
        SV *end_line_sv = 0;
        SV *argument_sv = 0;
     PPCODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);

            ARGUMENT_COMMENT_END_LINE *arg_end_l_info
              = argument_comment_end_line (element);

            if (arg_end_l_info->comment_end_line.comment)
              comment_sv = newSVsv ((SV *)
                 arg_end_l_info->comment_end_line.comment->sv);
            else
              end_line_sv = newSVpv_utf8 (
                 arg_end_l_info->comment_end_line.end_line, 0);

            if (arg_end_l_info->argument)
              {
                register_element_handle_in_sv (
                    (ELEMENT *)arg_end_l_info->argument, document);
                argument_sv = newSVsv ((SV *)arg_end_l_info->argument->sv);
              }

            non_perl_free (arg_end_l_info);
          }

        if (!argument_sv)
          argument_sv = newSV (0);
        if (!comment_sv)
          comment_sv = newSV (0);
        if (!end_line_sv)
          end_line_sv = newSV (0);

        EXTEND(SP, 3);
        PUSHs(sv_2mortal(argument_sv));
        PUSHs(sv_2mortal(comment_sv));
        PUSHs(sv_2mortal(end_line_sv));

SV *
tree_element_item_itemize_prepended (SV *element_sv)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            const ELEMENT *prepended
              = item_itemize_prepended (element);
            register_element_handle_in_sv ((ELEMENT *)prepended, document);
            RETVAL = newSVsv ((SV *)prepended->sv);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_index_content_element (SV *element_sv, int prefer_reference_element=0)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            ELEMENT *idx_content = index_content_element (element,
                                           prefer_reference_element);
            register_element_handle_in_sv (idx_content, document);
            RETVAL = newSVsv ((SV *)idx_content->sv);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_table_item_content_tree (SV *, SV *element_sv, SV *build_tree_sv=0)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            ELEMENT *converted_e;
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            TREE_ADDED_ELEMENTS *tree = table_item_content_tree (0, element);
            if (tree)
              {
                if (build_tree_sv && SvOK (build_tree_sv)
                    && SvIV (build_tree_sv))
                  build_texinfo_tree (tree->tree, 1);
                converted_e = tree->tree;
                if (tree->status == tree_added_status_elements_added)
                  {
                    size_t i;
                    for (i = 0; i < tree->added.number; i++)
                      {
                        ELEMENT *added_e = tree->added.list[i];
                        register_element_handle_in_sv (added_e, document);
                        add_to_element_list (&document->additional_elements,
                                             added_e);
                      }
                  }
                free (tree->added.list);
                free (tree);
              }
            else
              {
                converted_e = element->e.c->contents.list[0];
                register_element_handle_in_sv (converted_e, document);
              }
            RETVAL = newSVsv ((SV *)converted_e->sv);
         }
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

void
tree_element_find_element_authors (SV *element_sv, SV *quotation_authors_sv)
      PREINIT:
        DOCUMENT *document;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            size_t i;
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            AV *quotation_authors_av = (AV *) SvRV (quotation_authors_sv);
            CONST_ELEMENT_LIST *quotation_authors = new_const_element_list ();

            find_element_authors (element, quotation_authors);

            for (i = 0; i < quotation_authors->number; i++)
              {
                const ELEMENT *author = quotation_authors->list[i];

                register_element_handle_in_sv ((ELEMENT *)author, document);

                av_push (quotation_authors_av, newSVsv ((SV *)author->sv));
              }
            destroy_const_element_list (quotation_authors);
          }

# optional argument is converter_sv
SV *
utils_tree_element_expand_verbatiminclude (SV *element_sv, SV *include_directories_sv, SV *input_file_name_encoding_sv, int doc_encoding_for_input_file_name, SV *locale_encoding_sv, ...)
      PROTOTYPE: $$$$$;$$
      PREINIT:
        DOCUMENT *document;
        SV *result_sv = 0;
      CODE:
        document = get_sv_element_document (element_sv, 0);
        if (document)
          {
            const char *input_file_name_encoding = 0;
            const char *locale_encoding = 0;
            STRING_LIST *include_directories = 0;
            const ELEMENT *element
              = get_sv_element_element (element_sv, document);
            ELEMENT *result;
            SV *converter_sv = 0;
            CONVERTER *converter = 0;
            ERROR_MESSAGE_LIST *error_messages = 0;

            if (SvOK (input_file_name_encoding_sv))
              input_file_name_encoding
                = (char *)SvPVutf8_nolen (input_file_name_encoding_sv);
            if (SvOK (locale_encoding_sv))
              locale_encoding  = (char *)SvPVutf8_nolen (locale_encoding_sv);

            if (items > 7 && SvOK(ST(7)))
              converter_sv = ST(7);

            if (converter_sv)
              converter = get_sv_converter (converter_sv, 0);

            if (converter)
              error_messages = &converter->error_messages;
            else if (converter_sv)
              {
                error_messages = (ERROR_MESSAGE_LIST *)
                   non_perl_malloc (sizeof (ERROR_MESSAGE_LIST));
                memset (error_messages, 0, sizeof (ERROR_MESSAGE_LIST));
              }

            if (include_directories_sv)
              {
                include_directories = new_string_list ();
                add_svav_to_string_list (include_directories_sv,
                                         include_directories, svt_dir);
              }
            result = expand_verbatiminclude (element, include_directories,
                     error_messages, input_file_name_encoding,
                     doc_encoding_for_input_file_name, locale_encoding,
                     &document->global_info, 0);
            if (result)
              {
                result_sv = build_texinfo_tree (result, 1);
                register_element_handle_in_sv (result, document);
              }
            if (!converter && converter_sv)
              {
                pass_errors_to_hv (error_messages, converter_sv,
                                   "error_warning_messages");
                wipe_error_message_list (error_messages);
                free (error_messages);
              }

            if (include_directories)
              destroy_strings_list (include_directories);
          }

        if (result_sv)
          RETVAL = newSVsv (result_sv);
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_expand_today (SV *test_sv, SV *lang_translations_sv, SV *debug_sv, SV *converter_in, SV *build_tree_sv)
      PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          {
            int build_tree = 0;
            int debug = 0;
            int test = 0;
            LANG_TRANSLATION *lang_translations
              = get_lang_translations_sv (lang_translations_sv,
                        document->options->COMMAND_LINE_ENCODING.o.string);

            if (SvOK (build_tree_sv))
              build_tree = SvIV (build_tree_sv);
            if (SvOK (debug_sv))
              debug = SvIV (debug_sv);
            if (SvOK (test_sv))
              test = SvIV (test_sv);

            /* we do not set the converter argument even when we could, nor
               the translation function, although we could check the converter
               output format and set it if HTML, assuming that there is no
               need for a specific translation function for the output formats
               using this function
             */
            ELEMENT *e_today = expand_today (test, lang_translations,
                                             debug, 0, 0);
            if (build_tree)
              build_texinfo_tree (e_today, 1);
            register_element_handle_in_sv (e_today, document);

            RETVAL = newSVsv ((SV *) e_today->sv);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_gdt (string, SV *lang_translations_sv, SV *document_sv, ...)
        const char *string = (char *)SvPVutf8_nolen($arg);
      PROTOTYPE: $$$;$$$$
      PREINIT:
        DOCUMENT *document;
        SV *replaced_substrings_sv = 0;
        int debug = 0;
        const char *translation_context = 0;
        int build_tree = 0;
      CODE:
        if (items > 3 && SvOK(ST(3)))
          replaced_substrings_sv = ST(3);
        if (items > 4 && SvOK(ST(4)))
          build_tree = SvIV (ST(4));
        if (items > 5 && SvOK(ST(5)))
          debug = SvIV (ST(5));
        if (items > 6 && SvOK(ST(6)))
          translation_context = (char *)SvPVutf8_nolen(ST(6));

        document = get_sv_document_document (document_sv, "element_gdt");
        if (document)
          {
            NAMED_STRING_ELEMENT_LIST *replaced_substrings = 0;
            LANG_TRANSLATION *lang_translations
              = get_lang_translations_sv (lang_translations_sv,
                        document->options->COMMAND_LINE_ENCODING.o.string);
            ELEMENT *e_result;

            if (replaced_substrings_sv)
              {
                replaced_substrings
                  = get_replaced_substrings (replaced_substrings_sv);
              }
            e_result = gdt_tree (string, document, lang_translations,
                                 replaced_substrings, debug,
                                 translation_context);
            if (build_tree)
              build_texinfo_tree (e_result, 1);
            register_element_handle_in_sv (e_result, document);
            if (replaced_substrings)
              destroy_named_string_element_list (replaced_substrings);
            RETVAL = newSVsv ((SV *)e_result->sv);
          }
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_sections_list (SV *converter_in)
      PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          RETVAL = build_tree_elements_sections_list (document);
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_nodes_list (SV *converter_in)
      PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          RETVAL = build_tree_elements_nodes_list (document);
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
tree_element_headings_list (SV *converter_in)
      PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_converter_sv_document (converter_in, 0);
        if (document)
          RETVAL = build_tree_elements_headings_list (document);
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

# TODO it is likely that this should never fail
SV *
build_element_tree (SV *tree_in)
      PREINIT:
        DOCUMENT *document = 0;
        SV *result_sv = 0;
      CODE:
        document = get_sv_element_document (tree_in, 0);
        if (document)
          {
            ELEMENT *element
              = get_sv_element_element (tree_in, document);
            result_sv = build_texinfo_tree (element, 0);
            result_sv = newSVsv ((SV *) result_sv);
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

