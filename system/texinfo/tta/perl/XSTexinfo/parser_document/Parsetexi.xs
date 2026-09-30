/* Copyright 2014-2026 Free Software Foundation, Inc.

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

/* for abort */
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
/* For Perl on MS-Windows, it is possible for the header XSUB.h to redefine
   'free' (to something like "PerlMem_free").  'free' was already defined
   by gnulib, in config.h (due to the 'free-posix' module which was
   brought in as a dependency of other gnulib modules).  We need the Perl
   redefinition, not the gnulib version.  The #undef line here prevents
   a warning about the symbol being redefined. */
/* Gnulib is not included anymore, keep as documentation
#if defined _WIN32 && !defined __CYGWIN__
 #undef free
#endif
 */
#include "XSUB.h"

#undef context

#include "api.h"
#include "conf.h"
/* register_conf */
#include "parser_conf.h"
/* build_minimal_document build_document */
#include "build_perl_info.h"
/* clear_error_message_list */
#include "errors.h"
/* apply_sv_parser_conf */
#include "get_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

MODULE = Texinfo::Parser	PACKAGE = Texinfo::Parser

PROTOTYPES: ENABLE

# Except for file paths, strings should be UTF-8 encoded.
# In the declarations below, a comment shows that input string
# is a file path, other input strings should be UTF-8 encoded.
#
# There is no need for the parser to know the file paths
# encodings, they are never decoded/encoded but used as is
# and passed as byte strings.

void
reset_parser (int debug_output)

# argument is parser_sv
# Do nothing in XS, in Perl remove cycles in memory.
void
release (SV *)
    CODE:


void
register_parser_conf (SV *parser_sv)
    PREINIT:
        HV *parser_hv;
        const char *key = "parser_conf_descriptor";
        PARSER_CONF *parser_conf;
    CODE:
        parser_hv = (HV *)SvRV (parser_sv);
        parser_conf = register_conf ();
        /* NOTE unlikely IV overflow if PERL_QUAD_MAX < SIZE_MAX */
        hv_store (parser_hv, key, strlen (key),
                  newSViv ((IV) parser_conf->descriptor), 0);

# the file is already a byte string, taken as is from the command line.
# The encoding was detected as COMMAND_LINE_ENCODING.
SV *
parse_texi_file (SV *parser_sv, input_file_path)
        const char *input_file_path = (const char *)SvPVbyte_nolen ($arg);
      CODE:
        if (!SvOK(parser_sv))
          RETVAL = newSV (0);
        else
          {
            int status;
            DOCUMENT *document;

            apply_sv_parser_conf (parser_sv);
            document = parse_file (input_file_path, &status);
            RETVAL = build_minimal_document (document);
          }
      OUTPUT:
        RETVAL

# Used in tests under tta/t.
SV *
parse_texi_piece (SV *parser_sv, SV *string_sv, ...)
    PREINIT:
        int line_nr = 1;
      CODE:
        if (!SvOK(string_sv) || !SvOK(parser_sv))
          RETVAL = newSV (0);
        else
          {
            const char *string = (char *)SvPVutf8_nolen (string_sv);
            DOCUMENT *document;

            if (items > 2 && SvOK(ST(2)))
              line_nr = SvIV (ST(2));
            apply_sv_parser_conf (parser_sv);
            document = parse_piece (string, line_nr);
            RETVAL = build_minimal_document (document);
          }
      OUTPUT:
        RETVAL

# Two optional arguments, line number and NO_STORE.  If NO_STORE is set,
# the C data is removed.
# TODO add elements_handler_only option?
SV *
parse_texi_line (SV *parser_sv, SV *string_sv, ...)
    PREINIT:
        DOCUMENT *document = 0;
        int no_store = 0;
        int line_nr = 1;
      CODE:
        if (!SvOK(string_sv) || !SvOK(parser_sv))
          RETVAL = newSV (0);
        else
          {
            const char *string = (char *)SvPVutf8_nolen (string_sv);
            SV *document_sv;
            if (items > 2 && SvOK(ST(2)))
              line_nr = SvIV (ST(2));
            if (items > 3 && SvOK(ST(3)))
              no_store = SvIV (ST(3));
            apply_sv_parser_conf (parser_sv);
            document = parse_string (string, line_nr);

       /* get hold of errors before calling build_document, as they will be
          destroyed if no_store is set.

          add the errors to the Parser as there is no document returned
          to get the errors from.
        */
            pass_errors_to_hv (&document->parser_error_messages, parser_sv, 0);
            clear_error_message_list (&document->parser_error_messages);

            /*
            if (no_store)
              fprintf (stderr, "BEGIN build Perl tree\n");
             */
            if (!no_store)
              document_sv = build_minimal_document (document);
            else
              document_sv = build_document (document, 1);
            /*
            if (no_store)
              fprintf (stderr, "REMOVED C doc Perl tree '%s'\n", string);
             */
            RETVAL = document_tree (document_sv, 0);
          }
      OUTPUT:
        RETVAL

# Used in tests under tta/t.
SV *
parse_texi_text (SV *parser_sv, SV *string_sv, ...)
    PREINIT:
        int line_nr = 1;
      CODE:
        if (!SvOK(string_sv) || !SvOK(parser_sv))
          RETVAL = newSV (0);
        else
          {
            const char *string = (char *)SvPVutf8_nolen (string_sv);
            DOCUMENT *document;

            if (items > 2 && SvOK(ST(2)))
              line_nr = SvIV (ST(2));
            apply_sv_parser_conf (parser_sv);
            document = parse_text (string, line_nr);
            RETVAL = build_minimal_document (document);
          }
      OUTPUT:
        RETVAL

void
parser_store_values (SV *values_sv)
      CODE:
        parser_conf_reset_values ();
        if (SvOK (values_sv))
          {
            I32 i;
            HV *values_hv = (HV *)SvRV (values_sv);
            I32 hv_number = hv_iterinit (values_hv);

            for (i = 0; i < hv_number; i++)
              {
                HE *next = hv_iternext (values_hv);
                SV *flag_sv = hv_iterkeysv (next);
                const char *key = SvPVutf8_nolen (flag_sv);
                SV *value_sv = hv_iterval (values_hv, next);
                if (value_sv && SvOK (value_sv))
                  {
                    const char *value_text = SvPVutf8_nolen (value_sv);
                    parser_conf_add_value (key, value_text);
                  }
              }
          }

void
parser_store_INCLUDE_DIRECTORIES (SV *directories_sv)
      CODE:
        parser_conf_clear_INCLUDE_DIRECTORIES ();
        if (SvOK (directories_sv))
          {
            SSize_t i;
            AV *directories_av = (AV *)SvRV (directories_sv);
            SSize_t directories_nr = AvFILL (directories_av) +1;

            for (i = 0; i < directories_nr; i++)
              {
                SV **directory_sv = av_fetch (directories_av, i, 0);
                if (directory_sv && SvOK (*directory_sv))
                  {
     /*  the directories from the command line or the input file name
         are already byte strings (or ascii).  The encoding was detected
         as COMMAND_LINE_ENCODING. */
                    const char *directory = SvPVbyte_nolen (*directory_sv);
                    parser_conf_add_include_directory (directory);
                  }
              }
          }

void
parser_store_EXPANDED_FORMATS (SV *expanded_formats_sv)
      CODE:
        parser_conf_clear_expanded_formats ();
        if (SvOK (expanded_formats_sv))
          {
            SSize_t i;
            AV *expanded_formats_av = (AV *)SvRV (expanded_formats_sv);
            SSize_t expanded_formats_nr = AvFILL (expanded_formats_av) +1;

            for (i = 0; i < expanded_formats_nr; i++)
              {
                SV **format_sv = av_fetch (expanded_formats_av, i, 0);
                if (format_sv && SvOK (*format_sv))
                  {
                    const char *format = SvPVutf8_nolen (*format_sv);
                    parser_conf_add_expanded_format (format);
                  }
              }
          }

void
parser_conf_set_show_menu (int i)

void
parser_conf_set_CPP_LINE_DIRECTIVES (int i)

void
parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME (int i)

void
parser_conf_set_MAX_MACRO_CALL_NESTING (int i)

int
parser_conf_set_NO_INDEX (int i)

int
parser_conf_set_NO_USER_COMMANDS (int i)

void
parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME (int i)

void
parser_conf_set_INPUT_FILE_NAME_ENCODING (value)
        char *value = (char *)SvPVutf8_nolen ($arg);

void
parser_conf_set_LOCALE_ENCODING (value)
        char *value = (char *)SvPVutf8_nolen ($arg);

void
parser_conf_set_COMMAND_LINE_ENCODING (value)
        char *value = (char *)SvPVutf8_nolen ($arg);

void
parser_conf_set_documentlanguage (value)
        char *value = (char *)SvPVutf8_nolen ($arg);

int
parser_conf_set_DEBUG (int i)

void
parser_conf_set_accept_internalvalue (int value)

SV *
errors (SV *parser_sv)
    PREINIT:
        HV *parser_hv;
        SV **error_messages_sv;
    CODE:
        parser_hv = (HV *)SvRV (parser_sv);
        error_messages_sv = hv_fetch (parser_hv, "error_messages",
                                      strlen ("error_messages"), 0);
        if (error_messages_sv)
          {
            RETVAL = newSVsv (*error_messages_sv);

            /* clear the error_messages array */
            hv_store (parser_hv, "error_messages", strlen ("error_messages"),
                      newRV_noinc ((SV *) newAV ()), 0);
          }
        else
          {
            fprintf (stderr,
                     "BUG: no error_messages but Parser::errors is called\n");
            abort ();
            RETVAL = newSV (0);
          }

      OUTPUT:
        RETVAL

