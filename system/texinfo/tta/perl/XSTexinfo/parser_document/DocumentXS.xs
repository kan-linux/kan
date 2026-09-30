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

/* ALTIMP perl/Texinfo/Document.pm */

#include <stddef.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "options_data.h"
#include "tree_types.h"
#include "document_types.h"
/* non_perl_* */
#include "xs_utils.h"
/* for messages_and_encodings_setup */
#include "utils.h"
#include "customization_options.h"
/* for clear_error_message_list */
#include "errors.h"
#include "document.h"
/* configure_output_strings_translations */
#include "translations.h"
#include "get_perl_info.h"
#include "build_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */


MODULE = Texinfo::DocumentXS		PACKAGE = Texinfo::DocumentXS

PROTOTYPES: ENABLE

# Called from Texinfo::XSLoader.pm.
# File paths are byte strings and can be in any encoding.
int
init (SV *texinfo_uninstalled_sv, SV *datadir_sv, SV *t2a_builddir_sv, SV *t2a_srcdir_sv)
      PREINIT:
        const char *t2a_builddir = 0;
        const char *t2a_srcdir = 0;
        const char *datadir = 0;
        int texinfo_uninstalled = 0;
      CODE:
        if (SvOK (texinfo_uninstalled_sv))
          texinfo_uninstalled = SvIV (texinfo_uninstalled_sv);
        if (texinfo_uninstalled)
          {
            if (SvOK (t2a_builddir_sv))
              t2a_builddir = SvPVbyte_nolen (t2a_builddir_sv);
            if (SvOK (t2a_srcdir_sv))
              t2a_srcdir = SvPVbyte_nolen (t2a_srcdir_sv);
          }
        if (SvOK (datadir_sv))
          datadir = SvPVbyte_nolen (datadir_sv);

        /* needed by the parser */
        messages_and_encodings_setup (datadir);

        setup_texinfo_main (texinfo_uninstalled, datadir,
                            t2a_builddir, t2a_srcdir);
        RETVAL = 1;
    OUTPUT:
        RETVAL

# More related to translations than to the Texinfo Document, but we do not
# want to add another XS file for only one function.
# There is no calling code that sets use_external_translate_string.
void
configure_output_strings_translations (localesdir, strings_textdomain="texinfo_document", int use_external_translate_string=0)
       char *localesdir = (char *)SvPVbyte_nolen($arg);
       char *strings_textdomain;
      CODE:
       configure_output_strings_translations (localesdir,
                                              strings_textdomain,
                                              use_external_translate_string);

# This XS interface is rarely used, as, in general, a document is available
# and document_tree can be used instead.  It may be useful for a tree from
# parse_texi_piece to force the C data to be removed, with no_store set to
# 1 to ensure that the resulting tree modified by pure Perl functions is not
# taken unmodified from C again.
SV *
build_tree (SV *tree_in, ...)
      PROTOTYPE: $;$
      PREINIT:
        int no_store = 0;
        DOCUMENT *document = 0;
        SV *result_sv = 0;
      CODE:
        if (items > 1 && SvOK(ST(1)))
          no_store = SvIV (ST(1));

        document = get_sv_tree_document (tree_in, "build_tree");
        if (document)
          {
            SV *document_sv = build_document (document, no_store);
            if (!no_store)
              {
                if (document->tree)
                  result_sv = newSVsv ((SV *) document->tree->sv);
              }
            else
              { /* no more document->tree, get from Perl data */
                HV *document_hv = (HV *) SvRV (document_sv);
                SV **tree_sv = hv_fetch (document_hv, "tree",
                                         strlen("tree"), 0);
                if (tree_sv && SvOK (*tree_sv))
                  result_sv = newSVsv (*tree_sv);
              }
          }

        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

# remove_references_sv
void
destroy_document (SV *document_in, ...)
      PROTOTYPE: $;$
      PREINIT:
        DOCUMENT *document = 0;
      CODE:
        /* it is ok not to found a document if there is no
           document descriptor */
        document = get_sv_document_document (document_in, 0);
        if (document)
          {
            int check_counts = (document->options->TEST.o.integer > 1);
            ERROR_MESSAGE_LIST *error_messages = 0;
            /* Not useful, as it is done by converters already
            release_output_units_lists_built (&document->output_units_lists);
              */
            /* register messages before being destroyed */
            if (document->error_messages.number)
              {
                pass_errors_to_hv (&document->error_messages,
                                   document_in, 0);
                clear_error_message_list (&document->error_messages);
              }

            if (check_counts)
              error_messages = set_check_element_interpreter_refcount ();
            destroy_document (document);
            if (check_counts)
              {
                /* register error messages obtained during destruction */
                pass_errors_to_hv (error_messages, document_in, 0);
                clear_error_message_list (error_messages);
                unset_check_element_interpreter_refcount ();
              }
          }

SV *
document_errors (SV *document_in)
    PREINIT:
        DOCUMENT *document;
        const ERROR_MESSAGE_LIST *error_messages = 0;
     CODE:
        /* If the errors are obtained after document destruction, then
           the document will not be found, the messages should have already
           been registered to Perl in destroy_document.
         */
        document = get_sv_document_document (document_in, 0);
        if (document)
          error_messages = &document->error_messages;
        RETVAL = pass_errors_to_hv (error_messages, document_in, 0);
        if (document)
          clear_error_message_list (&document->error_messages);
  OUTPUT:
      RETVAL

SV *
document_parser_errors (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
        AV *av;
     CODE:
        /* if XS is used, a document should be found.  It could
           also have been possible to abort if a document is not
           found.
         */
        document = get_sv_document_document (document_in,
                                             "document_parser_errors");
        av = newAV ();
        if (document && document->parser_error_messages.number)
          {
            pass_errors (&document->parser_error_messages, av);
            clear_error_message_list (&document->parser_error_messages);
          }
        RETVAL = newRV_noinc ((SV *) av);
  OUTPUT:
      RETVAL


void
register_document_options (SV *document_in, SV *sv_options_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "set_document_options");
        if (document)
          {
            OPTIONS *options = new_options ();
            OPTION **sorted_options = new_sorted_options (options);

            get_sv_options (sv_options_in, options, sorted_options, 0, 0);

            register_document_options (document, options, sorted_options);
          }

SV *
document_get_conf (SV *document_in, option_name)
      const char *option_name = (char *)SvPVbyte_nolen($arg);
 PREINIT:
      DOCUMENT *document = 0;
    CODE:
      document = get_sv_document_document (document_in,
                                           "document_get_conf");
      if (document && document->sorted_options)
        {
          const OPTION *option
            = find_option_string (document->sorted_options, option_name);
          if (option)
            RETVAL = build_sv_option (option, 0);
          else
            RETVAL = newSV (0);
        }
      else
        RETVAL = newSV (0);
  OUTPUT:
      RETVAL

void
set_document_global_info (SV *document_in, char *key, SV *value_sv)
      PREINIT:
        DOCUMENT *document = 0;
      CODE:
        document = get_sv_document_document (document_in,
                                             "set_document_global_info");
        if (document)
          {
            document->modified_information |= F_DOCM_global_info;

            if (!strcmp (key, "input_file_name"))
              {
                char *value = (char *)SvPVbyte_nolen(value_sv);
                if (document->global_info.input_file_name)
                  {
                    fprintf (stderr,
                        "BUG: %zu: reset input_file_name '%s' -> '%s'\n",
                        document->descriptor,
                        document->global_info.input_file_name, value);
                    non_perl_free (document->global_info.input_file_name);
                  }
                document->global_info.input_file_name
                  = non_perl_strdup (value);
              }
            else
              {
                add_other_global_info_string (
                          &document->global_info.other_info,
                          key, (char *)SvPVutf8_nolen(value_sv));
              }
          }

SV *
document_tree (SV *document_in, int handler_only=0)

SV *
document_global_information (SV *document_in)

SV *
document_indices_information (SV *document_in)

SV *
document_global_commands_information (SV *document_in)

SV *
document_labels_information (SV *document_in)

SV *
document_nodes_list (SV *document_in)

SV *
document_sections_list (SV *document_in)

SV *
document_sectioning_root (SV *document_in)

SV *
document_headings_list (SV *document_in)

SV *
document_floats_information (SV *document_in)
     CODE:
        document_sections_list (document_in);
        RETVAL = document_floats_information (document_in);
    OUTPUT:
        RETVAL

SV *
document_internal_references_information (SV *document_in)

SV *
document_labels_list (SV *document_in)

# optional argument is converter
void
setup_indices_sort_strings (SV *document_in, ...)
    PROTOTYPE: $$
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "setup_indices_sort_strings");
        if (document)
          document_indices_sort_strings (document, &document->error_messages,
                                         document->options);

# optional argument is converter
SV *
indices_sort_strings (SV *document_in, ...)
    PROTOTYPE: $$
    PREINIT:
        DOCUMENT *document = 0;
        const INDICES_SORT_STRINGS *indices_sort_strings = 0;
        SV *result_sv = 0;
        const char *key = "index_entries_sort_strings";
     CODE:
        document = get_sv_document_document (document_in,
                                             "indices_sort_strings");
        if (document)
          indices_sort_strings
           = document_indices_sort_strings (document,
                                            &document->error_messages,
                                            document->options);

        if (indices_sort_strings)
          {
            HV *document_hv = (HV *) SvRV (document_in);
            /* build Perl data only if needed and cache the built Perl
               data in the same hash as done in overriden Perl code */
            if (document->modified_information & F_DOCM_indices_sort_strings)
              {
                SV *indices_information_sv
                 = document_indices_information (document_in);
                if (indices_information_sv)
                  {
                    HV *indices_information_hv
                        = (HV *) SvRV (indices_information_sv);
                    HV *indices_sort_strings_hv
                     = build_indices_sort_strings (indices_sort_strings,
                                                   indices_information_hv);
                    hv_store (document_hv, key, strlen (key),
                              newRV_noinc ((SV *) indices_sort_strings_hv), 0);
                    result_sv = newRV_inc ((SV *) indices_sort_strings_hv);
                    document->modified_information
                                &= ~F_DOCM_indices_sort_strings;
                  }
                /* warn if not found? */
              }
            else
              { /* retrieve previously stored result */
                SV **sv_stored = hv_fetch (document_hv, key, strlen (key), 0);
                if (sv_stored && SvOK (*sv_stored))
                  result_sv = newSVsv (*sv_stored);
                /* error out if not found?  Or rebuild? */
              }
          }

        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_document_indices_information (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                       "print_document_indices_information");
        if (document)
          {
            char *indices_information_str
              = print_document_indices_information (document);
            if (indices_information_str)
              {
                RETVAL = newSVpv_utf8 (indices_information_str, 0);
                free (indices_information_str);
              }
            else
              RETVAL = newSV (0);
          }
        else
          RETVAL = newSV (0);

    OUTPUT:
        RETVAL

SV *
print_document_indices_sort_strings (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                       "print_document_indices_sort_strings");
        if (document)
          {
            char *indices_sort_strings_str
              = print_document_indices_sort_strings (document);
            if (indices_sort_strings_str)
              {
                RETVAL = newSVpv_utf8 (indices_sort_strings_str, 0);
                free (indices_sort_strings_str);
              }
            else
              RETVAL = newSV (0);
          }
        else
          RETVAL = newSV (0);

    OUTPUT:
        RETVAL



