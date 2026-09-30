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

#include <stdlib.h>
#include <stdio.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "command_ids.h"
#include "option_types.h"
#include "options_data.h"
#include "converter_types.h"
/* non_perl_* */
#include "xs_utils.h"
#include "builtin_commands.h"
#include "utils.h"
/* wipe_error_message_list */
#include "errors.h"
#include "customization_options.h"
#include "convert_to_text.h"
#include "get_perl_info.h"
/* retrieve_converter find_perl_converter_class_converter_format
   new_converter converter_set_document */
#include "converter.h"
/* pass_errors newSVpv_utf8 */
#include "build_perl_info.h"
#include "get_converter_perl_info.h"


CONVERTER *
get_or_create_sv_converter (SV *converter_in, const char *input_class)
{
  size_t converter_descriptor = 0;
  CONVERTER *converter = 0;

  dTHX;

  converter = get_sv_converter (converter_in, 0);
  if (!converter)
    {
      const char *class_name = 0;
      enum converter_format converter_format = COF_none;

      if (input_class)
        class_name = input_class;
      else
        {
          HV *stash;
          stash = SvSTASH (SvRV (converter_in));
          class_name = HvNAME (stash);
        }

      if (class_name)
        {
          /* determine the converter format, if handled in C */
          converter_format
             = find_perl_converter_class_converter_format (class_name);
        }

      converter_descriptor = new_converter (converter_format);
      converter = retrieve_converter (converter_descriptor);
    }
  return converter;
}

CONVERTER *
converter_set_document_from_sv (SV *converter_in, SV *document_in)
{
  CONVERTER *converter;
  DOCUMENT *document = 0;

  dTHX;

  converter = get_sv_converter (converter_in, "converter_set_document");
  if (document_in && SvOK (document_in))
    document = get_sv_document_document (document_in, 0);

  converter_set_document (converter, document);

  return converter;
}

DOCUMENT *
get_converter_sv_document (SV *converter_sv, const char *warn_string)
{
  CONVERTER *converter;
  DOCUMENT *document = 0;
  HV *converter_hv;
  SV **document_sv;

  dTHX;

  converter = get_sv_converter (converter_sv, 0);
  if (converter && converter->document)
    return converter->document;

  converter_hv = (HV *) SvRV (converter_sv);

  document_sv = hv_fetch (converter_hv, "document", strlen ("document"), 0);

  if (document_sv && SvOK (*document_sv))
    {
      document = get_sv_document_document (*document_sv, warn_string);
    }

  return document;
}

/* add to converter hash the INIT_INFO_SV key values that are
   not customization variables, listed in NO_VALID_CUSTOMIZATION */
void
set_non_customization_sv (HV *converter_hv, SV *init_info_sv,
                          STRING_LIST *non_valid_customization)
{
  dTHX;

  if (non_valid_customization->number > 0)
    {
      HV *init_info_hv = (HV *) SvRV (init_info_sv);
      size_t i;
      for (i = 0; i < non_valid_customization->number; i++)
        {
          const char *key
               = non_valid_customization->list[i];
          /* not a customization variable, set in converter */
          SV **value = hv_fetch (init_info_hv, key, strlen (key), 0);
          if (*value)
            {
              SV *stored_sv;
              if (SvOK (*value))
                stored_sv = newSVsv (*value);
              else
                stored_sv = newSV (0);
              hv_store (converter_hv, key, strlen (key), stored_sv, 0);
            }
        }
    }
}

void
get_expanded_formats (HV *hv, EXPANDED_FORMAT **expanded_formats)
{
  SV **expanded_formats_sv;

  dTHX;

  expanded_formats_sv = hv_fetch (hv, "expanded_formats",
                                  strlen ("expanded_formats"), 0);
  if (expanded_formats_sv && SvOK (*expanded_formats_sv))
    {
      I32 i;
      I32 formats_nr;

      if (!*expanded_formats)
        *expanded_formats = new_expanded_formats ();

      HV *expanded_formats_hv = (HV *)SvRV (*expanded_formats_sv);

      formats_nr = hv_iterinit (expanded_formats_hv);

      for (i = 0; i < formats_nr; i++)
        {
          char *format;
          I32 retlen;
          SV *value_sv = hv_iternextsv (expanded_formats_hv, &format, &retlen);
          if (SvTRUE (value_sv))
            {
              add_expanded_format (*expanded_formats, format);
            }
        }
    }
}

/* map hash reference of Convert::Text options to TEXT_OPTIONS */
/* _raw_state is not fetched, as it is not documented as an option,
   and there is no way to set it through text options either, it can only
   be set as a state during conversion */
#define FETCH(key) key##_sv = hv_fetch (hv_in, #key, strlen (#key), 0);
TEXT_OPTIONS *
copy_sv_options_for_convert_text (SV *sv_in)
{
  HV *hv_in;
  SV **_code_state_sv;
  SV **ASCII_GLYPH_sv;
  SV **NUMBER_SECTIONS_sv;
  SV **TEST_sv;
  SV **INCLUDE_DIRECTORIES_sv;
  SV **converter_sv;
  SV **enabled_encoding_sv;
  SV **sort_string_sv;
  SV **set_case_sv;
  SV **documentlanguage_sv;
  SV **DEBUG_sv;
  SV **DOC_ENCODING_FOR_INPUT_FILE_NAME_sv;
  SV **INPUT_FILE_NAME_ENCODING_sv;
  SV **LOCALE_ENCODING_sv;
  SV **COMMAND_LINE_ENCODING_sv;
  SV **translated_commands_sv;
  TEXT_OPTIONS *text_options = new_text_options ();
  const char *documentlanguage = 0;

  dTHX;

  hv_in = (HV *)SvRV (sv_in);

  FETCH(ASCII_GLYPH)
  if (ASCII_GLYPH_sv)
    text_options->ASCII_GLYPH = SvIV (*ASCII_GLYPH_sv);

  FETCH(NUMBER_SECTIONS)
  if (NUMBER_SECTIONS_sv)
    text_options->NUMBER_SECTIONS = SvIV (*NUMBER_SECTIONS_sv);

  FETCH(TEST)
  if (TEST_sv)
    text_options->TEST = SvIV (*TEST_sv);

  FETCH(sort_string)
  if (sort_string_sv)
    text_options->sort_string = SvIV (*sort_string_sv);

  FETCH(enabled_encoding)
  if (enabled_encoding_sv)
    text_options->encoding
      = non_perl_strdup (SvPVutf8_nolen (*enabled_encoding_sv));

  FETCH(set_case)
  if (set_case_sv)
    text_options->set_case = SvIV (*set_case_sv);

  FETCH(_code_state)
  if (_code_state_sv)
    text_options->code_state = SvIV (*_code_state_sv);

  FETCH(INCLUDE_DIRECTORIES)
  if (INCLUDE_DIRECTORIES_sv)
    add_svav_to_string_list (*INCLUDE_DIRECTORIES_sv,
                             &text_options->include_directories, svt_dir);

  get_expanded_formats (hv_in, &text_options->expanded_formats);

  FETCH(documentlanguage)
  if (documentlanguage_sv)
    documentlanguage
      = SvPVutf8_nolen (*documentlanguage_sv);

  /* call text_set_language to switch translations cache based on the
     documentlanguage coming from the converter, as in Perl.
     Only if there is actually a documentlanguage such that if there
     is no explicit language the documentlanguage in tree information
     is used.  It should not be possible to get back to an undefined
     documentlanguage, so it is not a problem not to be able to
     reset to an unspecified language after setting to another language.
   */
  if (documentlanguage)
    text_set_language (text_options, documentlanguage);

  FETCH(DEBUG)
  if (DEBUG_sv && SvOK (*DEBUG_sv))
    text_options->DEBUG = SvIV (*DEBUG_sv);

  FETCH(DOC_ENCODING_FOR_INPUT_FILE_NAME)
  if (DOC_ENCODING_FOR_INPUT_FILE_NAME_sv
      && SvOK (*DOC_ENCODING_FOR_INPUT_FILE_NAME_sv))
    text_options->DOC_ENCODING_FOR_INPUT_FILE_NAME
      = SvIV (*DOC_ENCODING_FOR_INPUT_FILE_NAME_sv);

  FETCH(INPUT_FILE_NAME_ENCODING)
  if (INPUT_FILE_NAME_ENCODING_sv
      && SvOK (*INPUT_FILE_NAME_ENCODING_sv))
    text_options->INPUT_FILE_NAME_ENCODING
      = non_perl_strdup (SvPVutf8_nolen (*INPUT_FILE_NAME_ENCODING_sv));

  FETCH(LOCALE_ENCODING)
  if (LOCALE_ENCODING_sv
      && SvOK (*LOCALE_ENCODING_sv))
    text_options->LOCALE_ENCODING
      = non_perl_strdup (SvPVutf8_nolen (*LOCALE_ENCODING_sv));

  FETCH(COMMAND_LINE_ENCODING)
  if (COMMAND_LINE_ENCODING_sv
      && SvOK (*COMMAND_LINE_ENCODING_sv))
    text_options->COMMAND_LINE_ENCODING
      = non_perl_strdup (SvPVutf8_nolen (*COMMAND_LINE_ENCODING_sv));

  FETCH(translated_commands)
  if (translated_commands_sv)
    set_translated_commands (*translated_commands_sv,
                             &text_options->translated_commands);

  FETCH(converter)
  if (converter_sv)
    {
      CONVERTER *converter = get_sv_converter (*converter_sv, 0);
      if (converter)
        text_options->converter = converter;
    }

  return text_options;
}
#undef FETCH

/* get text conversion options from Perl, call convert_to_text and
   return error messages.
   Gets and builds Perl data.
 */
SV *
convert_element_options_sv_to_text (DOCUMENT *document, const ELEMENT *element,
                                    SV *options_in)
{
  SV *retval = 0;

  dTHX;

  if (element)
    {
      char *result;
      TEXT_OPTIONS *text_options;

      if (SvOK (options_in))
        text_options = copy_sv_options_for_convert_text (options_in);
      else
        text_options = new_text_options ();

      text_options->document = document;

      result = convert_to_text (element, text_options);

      /* in case we were called from a converter to Text, pass the
         error messages.  If not called from a Perl converter they
         probably will be ignored, but the errors should only come
         from errors with @verbatiminclude in case there is not already
         a converter to get the errors, which should only happen with
         a converter to Text */
      if (text_options->error_messages.number > 0
          && SvOK (options_in))
        {
          const char* key = "error_warning_messages";
          AV *errors_av = newAV ();
          pass_errors (&text_options->error_messages, errors_av);
          HV *options_hv = (HV *) SvRV (options_in);
          hv_store (options_hv, key, strlen (key),
                    newRV_noinc ((SV *) errors_av), 0);
          wipe_error_message_list (&text_options->error_messages);
        }

      destroy_text_options (text_options);
      retval = newSVpv_utf8 (result, 0);
      non_perl_free (result);
    }
  else
    retval = newSV (0);

  return retval;
}
