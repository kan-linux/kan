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

#include <string.h>
#include <stdio.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "html_conversion_data.h"
#include "tree_types.h"
#include "converter_types.h"
/* bug */
#include "base_utils.h"
/* non_perl_free */
#include "xs_utils.h"
/* for builtin_command_name */
#include "builtin_commands.h"
/* for HMSF_* */
#include "utils.h"
/* next two could be interesting for debugging */
/*
#include "debug.h"
#include "convert_to_texinfo.h"
 */
#include "command_stack.h"
/* also for perl_only_* wrappers */
#include "build_perl_info.h"
/* for NAMED_STRING_ELEMENT_LIST */
#include "translations.h"
/* for no_arg_formatted_cmd direction_string_type_names
   direction_string_context_names html_conversion_context_type_names
 */
#include "html_converter_types.h"
/* for htmlxref_split_type_names
   html_nr_string_directions */
#include "html_prepare_converter.h"
/* to debug refcounts */
#include "api_to_perl.h"
#include "build_html_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

static HV *
build_htmlxref (HTMLXREF_MANUAL_LIST *htmlxref_list)
{
  HV *htmlxref_hv;
  size_t i;

  dTHX;

  htmlxref_hv = newHV ();

  for (i = 0; i < htmlxref_list->number; i++)
    {
      HTMLXREF_MANUAL *htmlxref_manual = &htmlxref_list->list[i];
      const char *manual_name = htmlxref_manual->manual;
      SV *manual_name_sv = newSVpv_utf8 (manual_name, 0);
      HV *htmlxref_manual_hv = newHV ();
      SV *htmlxref_manual_sv = newRV_noinc ((SV *) htmlxref_manual_hv);
      enum htmlxref_split_type j;

      hv_store_ent (htmlxref_hv, manual_name_sv, htmlxref_manual_sv, 0);

      for (j = 0; j < htmlxref_split_type_chapter+1; j++)
        {
          if (htmlxref_manual->urlprefix[j])
            {
              const char *split_type_name = htmlxref_split_type_names[j];
              const char *href = htmlxref_manual->urlprefix[j];

              hv_store (htmlxref_manual_hv, split_type_name,
                        strlen (split_type_name),
                        newSVpv_utf8 (href, 0), 0);
            }
        }
    }

  return htmlxref_hv;
}

void
html_pass_htmlxref (HTMLXREF_MANUAL_LIST *htmlxref_list, SV *converter_sv)
{
  HV *converter_hv;
  HV *htmlxref_hv;

  dTHX;

  converter_hv = (HV *) SvRV (converter_sv);

  htmlxref_hv = build_htmlxref (htmlxref_list);

  hv_store (converter_hv, "htmlxref", strlen ("htmlxref"),
            newRV_noinc ((SV *) htmlxref_hv), 0);
}

SV *
build_no_arg_commands_formatting (const CONVERTER *converter)
{
  HV *no_arg_commands_formatting_hv;
  size_t i;

  dTHX;

  no_arg_commands_formatting_hv = newHV ();

  for (i = 0; i < no_arg_formatted_cmd.number; i++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[i];
      enum conversion_context cctx;
      const char *command_name = builtin_command_name (cmd);
      const HTML_NO_ARG_COMMAND_FORMATTING *no_arg_formatting
        = &converter->html_no_arg_command_conversion[cmd];

      HV *context_hv = newHV ();
      hv_store (no_arg_commands_formatting_hv, command_name,
                strlen (command_name), newRV_noinc ((SV *) context_hv), 0);

      if (no_arg_formatting->translated_to_convert)
        {
          hv_store (context_hv, "translated_to_convert",
                    strlen ("translated_to_convert"),
              newSVpv_utf8 (no_arg_formatting->translated_to_convert, 0), 0);
        }

      for (cctx = 0; cctx < NO_ARG_COMMAND_CONTEXT_NR; cctx++)
        {
          const HTML_NO_ARG_COMMAND_CONVERSION *no_arg_format
            = &no_arg_formatting->context_formatting[cctx];
          const char *context_name = html_conversion_context_type_names[cctx];

          HV *spec_hv = newHV ();

          hv_store (context_hv, context_name, strlen (context_name),
                    newRV_noinc ((SV *) spec_hv), 0);

#define STORE(key, sv) hv_store (spec_hv, key, strlen (key), sv, 0)
#define STORE_FIELD(field) \
          if (no_arg_format->field) \
            STORE(#field, newSVpv_utf8 (no_arg_format->field, 0));

          STORE_FIELD(element)

          if (no_arg_format->unset)
            STORE("unset", newSViv (1));

          STORE_FIELD(text)
          STORE_FIELD(translated_converted)
#undef STORE_FIELD
#undef STORE
        }
    }
  return newRV_noinc ((SV *) no_arg_commands_formatting_hv);
}

SV *
build_directions_strings (const CONVERTER *converter)
{
  HV *directions_strings_hv;
  enum direction_string_type DS_type;
  int nr_string_directions;
  int nr_dir_str_contexts = TDS_context_string +1;

  dTHX;

  nr_string_directions = html_nr_string_directions (converter);

  directions_strings_hv = newHV ();

  for (DS_type = 0; DS_type < TDS_TYPE_MAX_NR; DS_type++)
    {
      int i;
      const char *type_name = direction_string_type_names[DS_type];

      HV *direction_hv = newHV ();

      hv_store (directions_strings_hv, type_name,
                strlen (type_name), newRV_noinc ((SV *) direction_hv), 0);

      /* those will be determined from translatable strings */
      if (DS_type < TDS_TRANSLATED_MAX_NR)
        continue;

      for (i = 0; i < nr_string_directions; i++)
        {
          int j;
          const char *direction_name;
          HV *context_hv = newHV ();

          if (i < FIRSTINFILE_MIN_IDX)
            direction_name = html_button_direction_names[i];
          else
            direction_name
  /* The corresponding direction without FirstInFile are used instead
     of FirstInFile*, so the directions_strings are not set,
     hence the - FIRSTINFILE_MIN_IDX */
              = converter->main_units_direction_names[
                        i - FIRSTINFILE_MIN_IDX + NON_SPECIAL_DIRECTIONS_NR];

          hv_store (direction_hv, direction_name, strlen (direction_name),
                    newRV_noinc ((SV *) context_hv), 0);

          for (j = 0; j < nr_dir_str_contexts; j++)
            {
              const char *context_name
                = direction_string_context_names[j];
              if (converter->directions_strings[DS_type][i][j])
                {
                  hv_store (context_hv, context_name, strlen (context_name),
                           newSVpv_utf8 (
                          converter->directions_strings[DS_type][i][j], 0), 0);
                }
            }
        }
    }

  return newRV_noinc ((SV *) directions_strings_hv);
}


#define STORE(key, sv) hv_store (converter_hv, key, strlen (key), sv, 0)
void
html_pass_converter_initialization_state (const CONVERTER *converter,
                                          HV *converter_hv)
{
  SV *no_arg_commands_formatting_sv;
  SV *directions_strings_sv;
  HV *shared_conversion_state_hv;

  dTHX;

  no_arg_commands_formatting_sv = build_no_arg_commands_formatting (converter);
  STORE("no_arg_commands_formatting", no_arg_commands_formatting_sv);

  directions_strings_sv = build_directions_strings (converter);
  STORE("directions_strings", directions_strings_sv);

  shared_conversion_state_hv = newHV ();
  STORE("shared_conversion_state",
        newRV_noinc ((SV *)shared_conversion_state_hv));
}

void
html_pass_conversion_initialization (CONVERTER *converter,
                                     SV *converter_sv)
{
  HV *converter_hv;
  HV *converter_info_hv;
  HV *translation_cache_hv;
  SV **converter_info_sv;

  dTHX;

  converter_hv = (HV *) SvRV (converter_sv);

  if (converter->document && converter->document->hv)
    STORE("document", newRV_inc ((SV *) converter->document->hv));

  pass_converter_text_options (converter, converter_sv);

  /* always set "converter_info" for calls to get_info in Perl.
     Reuse, such that there are no stale references to trees
     left.
   */
  converter_info_sv = hv_fetch (converter_hv, "converter_info",
                                strlen ("converter_info"), 0);
  if (converter_info_sv)
    {
      converter_info_hv = (HV *) SvRV (*converter_info_sv);
      hv_clear (converter_info_hv);

      if (converter_info_hv != converter->pl_info_hv)
        fprintf (stderr, "REMARK: Perl and C stored converter_info differ\n");
    }
  else
    {
      converter_info_hv = newHV ();

      STORE("converter_info", newRV_noinc ((SV *)converter_info_hv));
      /* store in C to be sure that the caching is in the same Perl object
        even if the Perl data changes */
      converter->pl_info_hv = converter_info_hv;
      SvREFCNT_inc (converter_info_hv);
    }

  /* always (re)set.  For user-defined translations */
  translation_cache_hv = newHV ();
  STORE("translation_cache", newRV_noinc ((SV *)translation_cache_hv));

  /* Conversion to LaTeX is in Perl */
  if (converter->conf->CONVERT_TO_LATEX_IN_MATH.o.integer > 0)
    converter->external_references_number++;

  if (converter->conf->CONVERT_TO_LATEX_IN_MATH.o.integer > 0)
    {
      HV *options_latex_math_hv
       = latex_build_options_for_convert_to_latex_math (converter);
      hv_store (converter_hv, "options_latex_math",
                strlen ("options_latex_math"),
                newRV_noinc ((SV *)options_latex_math_hv), 0);
    }

  if (converter->external_references_number > 0)
    {
      html_pass_converter_initialization_state (converter, converter_hv);
    }
}

void
html_pass_converter_setup_state (const CONVERTER *converter,
                                 SV *converter_sv)
{
  HV *converter_hv;

  dTHX;

  converter_hv = (HV *) SvRV (converter_sv);

  if (converter->use_unicode_text)
    STORE("use_unicode_text", newSViv (1));
#undef STORE
}

/* Currently unused */
SV *
build_html_files_source_info (const FILE_SOURCE_INFO_LIST *files_source_info)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  if (files_source_info)
    {
#define STORE(key, sv) hv_store (file_source_info_hv, key, strlen (key), sv, 0)
      for (i = 0; i < files_source_info->number; i++)
        {
          const FILE_SOURCE_INFO * file_source_info = &files_source_info->list[i];
          HV *file_source_info_hv;
          SV *file_source_info_sv;
          const char *filename = file_source_info->filename;
          SV *filename_sv = newSVpv_utf8 (filename, 0);

          file_source_info_hv = newHV ();
          file_source_info_sv = newRV_noinc ((SV *) file_source_info_hv);

          hv_store_ent (hv, filename_sv, file_source_info_sv, 0);

          STORE("file_info_type", newSVpv_utf8 (file_source_info->type, 0));
          if (file_source_info->name)
            STORE("file_info_name", newSVpv_utf8 (file_source_info->name, 0));
          /* not actually used in downstream code, but present also in perl */
          if (file_source_info->path)
            STORE("file_info_path", newSVpv_utf8 (file_source_info->path, 0));
          else
            STORE("file_info_path", newSV(0));

          if (file_source_info->element)
            {
              SV *element_sv
                = newSVsv ((SV *) file_source_info->element->sv);
              STORE("file_info_element", element_sv);
            }
        }
#undef STORE
    }
  return newRV_noinc ((SV *) hv);
}

/* set document_units in converter to a handle that holds a descriptor
   to be able to retrieve the output unit list C data, without any units
   list data built */
void
set_document_units_handle (CONVERTER *converter, SV *converter_sv)
{
  dTHX;

  HV *converter_hv = (HV *) SvRV (converter_sv);
  SV *units_array_sv = setup_output_units_handler (converter->document,
                           converter->output_units_descriptors[OUDT_units]);
  hv_store (converter_hv, "document_units", strlen ("document_units"),
            units_array_sv, 0);
}

HV *
build_html_elements_in_file_count (
                 FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  if (output_unit_files)
    {
      for (i = 0; i < output_unit_files->number; i++)
        {
          FILE_NAME_PATH_COUNTER *output_unit_file
            = &output_unit_files->list[i];
          char *filename = output_unit_file->filename;
          SV *filename_sv = newSVpv_utf8 (filename, 0);

          hv_store_ent (hv, filename_sv,
                        newSViv (output_unit_file->elements_in_file_count), 0);
        }
    }

  return hv;
}

SV *
build_replaced_substrings (NAMED_STRING_ELEMENT_LIST *replaced_substrings)
{
  HV *hv;
  size_t i;

  dTHX;

  if (!replaced_substrings)
    return newSV (0);

  hv = newHV ();

  for (i = 0; i < replaced_substrings->number; i++)
    {
      NAMED_STRING_ELEMENT *named_string_elt = &replaced_substrings->list[i];
      SV *name_sv = newSVpv_utf8 (named_string_elt->name, 0);
      SV *value_sv = 0;

      if (named_string_elt->element)
        value_sv = newSVsv ((SV *) named_string_elt->element->sv);
      else if (named_string_elt->string)
        value_sv = newSVpv_utf8 (named_string_elt->string, 0);

      if (value_sv)
        hv_store_ent (hv, name_sv, value_sv, 0);
    }

  return newRV_noinc ((SV *) hv);
}

void
build_pending_footnotes (AV *av, HTML_PENDING_FOOTNOTE_STACK *stack)
{
  dTHX;

  if (stack->top > 0)
    {
      size_t i;
      for (i = 0; i < stack->top; i++)
        {
          HTML_PENDING_FOOTNOTE *pending_footnote = stack->stack[i];

          AV *pending_footnote_av = newAV ();
          SV *sv = newRV_noinc ((SV *) pending_footnote_av);
          av_push (av, sv);

          av_push (pending_footnote_av,
                   newSVsv ((SV *) pending_footnote->command->sv));
          av_push (pending_footnote_av,
                   newSVpv_utf8 (pending_footnote->footid, 0));
          av_push (pending_footnote_av,
                   newSVpv_utf8 (pending_footnote->docid, 0));
          av_push (pending_footnote_av,
                   newSViv (pending_footnote->number_in_doc));
          av_push (pending_footnote_av,
           newSVpv_utf8 (pending_footnote->footnote_location_filename, 0));
          if (pending_footnote->multi_expanded_region)
            av_push (pending_footnote_av,
                     newSVpv_utf8 (pending_footnote->multi_expanded_region, 0));
          else
            av_push (pending_footnote_av, newSV (0));
        }
    }
}

void
build_simpletitle (const CONVERTER *converter, HV *converter_info_hv)
{
  dTHX;

  hv_store (converter_info_hv, "simpletitle_tree",
            strlen ("simpletitle_tree"),
            newSVsv ((SV *) converter->simpletitle_tree->sv), 0);
  hv_store (converter_info_hv, "simpletitle_command_name",
            strlen ("simpletitle_command_name"),
            newSVpv (builtin_command_name (converter->simpletitle_cmd), 0), 0);
}

void
pass_jslicenses (const JSLICENSE_CATEGORY_LIST *jslicenses,
                 HV *converter_info_hv)
{
  HV *jslicenses_hv;
  size_t i;

  dTHX;

  jslicenses_hv = newHV ();

  for (i = 0; i < jslicenses->number; i++)
    {
      size_t j;
      JSLICENSE_FILE_INFO_LIST *jslicences_files_info = &jslicenses->list[i];
      SV *category_sv = newSVpv_utf8 (jslicences_files_info->category, 0);
      HV *jslicences_files_info_hv = newHV ();
      hv_store_ent (jslicenses_hv, category_sv,
                    newRV_noinc ((SV *)jslicences_files_info_hv), 0);
      for (j = 0; j < jslicences_files_info->number; j++)
        {
          JSLICENSE_FILE_INFO *jslicense_file_info
            = &jslicences_files_info->list[j];
          SV *filename_sv = newSVpv_utf8 (jslicense_file_info->filename, 0);
          AV *jslicence_file_info_av = newAV ();
          hv_store_ent (jslicences_files_info_hv, filename_sv,
                        newRV_noinc ((SV *)jslicence_file_info_av), 0);
          av_push (jslicence_file_info_av,
                   newSVpv_utf8 (jslicense_file_info->license, 0));
          av_push (jslicence_file_info_av,
                   newSVpv_utf8 (jslicense_file_info->url, 0));
          av_push (jslicence_file_info_av,
                   newSVpv_utf8 (jslicense_file_info->source, 0));
        }
    }

  hv_store (converter_info_hv, "jslicenses", strlen ("jslicenses"),
            newRV_noinc ((SV *) jslicenses_hv), 0);
}

SV *
pass_sv_converter_info (const CONVERTER *converter,
                        const char *converter_info, SV *converter_sv)
{
  HV *converter_hv;
  HV *converter_info_hv;
  SV **info_sv;
  SV *new_sv = 0;

  dTHX;

  converter_hv = (HV *) SvRV (converter_sv);
  /* do not find the cache in Perl data but in C to be more robust to
     changes in Perl objects */
  converter_info_hv = converter->pl_info_hv;

  /* The information is cached in the same place as in Perl code.
     Either Perl code or XS/C code is used, so this is for consistency
     not really for interoperability */

  info_sv = hv_fetch (converter_info_hv, converter_info,
                      strlen (converter_info), 0);

  if (info_sv && SvOK (*info_sv))
    {
      return newSVsv (*info_sv);
    }

  /* the linear search is not very efficient, but done only once for
     each defined information */
  if (!strcmp (converter_info, "non_breaking_space"))
    new_sv
   = newSVpv_utf8 (converter->special_character[SC_non_breaking_space].string, 0);
  else if (!strcmp (converter_info, "paragraph_symbol"))
    new_sv
   = newSVpv_utf8 (converter->special_character[SC_paragraph_symbol].string, 0);
  else if (!strcmp (converter_info, "line_break_element"))
    new_sv
   = newSVpv_utf8 (converter->line_break_element.string, 0);
  else if (!strcmp (converter_info, "document"))
    {
      SV **document_sv = hv_fetch (converter_hv, "document",
                                   strlen ("document"), 0);
      if (document_sv && SvOK (*document_sv))
        {
          new_sv = newSVsv (*document_sv);
        }
    }
  else if (!strcmp (converter_info, "document_name"))
    {
      if (converter->document_name)
        new_sv = newSVpv_utf8 (converter->document_name, 0);
    }
  else if (!strcmp (converter_info, "destination_directory"))
    {
      if (converter->destination_directory)
        new_sv = newSVpv_utf8 (converter->destination_directory, 0);
    }
  else if (!strcmp (converter_info, "expanded_formats"))
    {
      /* add expanded_formats to converter_info */
      SV **expanded_formats_sv
        = hv_fetch (converter_hv, "expanded_formats",
                    strlen ("expanded_formats"), 0);

      if (expanded_formats_sv && SvOK (*expanded_formats_sv))
        {
          new_sv = newSVsv (*expanded_formats_sv);
        }
    }
  else if (!strcmp (converter_info, "jslicenses"))
    {
      pass_jslicenses (&converter->jslicenses, converter_info_hv);
      info_sv = hv_fetch (converter_info_hv, converter_info,
                          strlen (converter_info), 0);
      /* probably always true */
      if (info_sv && SvOK (*info_sv))
        {
          return newSVsv (*info_sv);
        }
    }
  else if (!strcmp (converter_info, "copying_comment"))
    {
      if (converter->copying_comment)
        new_sv = newSVpv_utf8 (converter->copying_comment, 0);
    }
  else if (!strcmp (converter_info, "documentdescription_string"))
    {
      if (converter->documentdescription_string)
        new_sv = newSVpv_utf8 (converter->documentdescription_string, 0);
    }
  else if (!strcmp (converter_info, "title_titlepage"))
    {
      if (converter->title_titlepage)
        new_sv = newSVpv_utf8 (converter->title_titlepage, 0);
    }
  else if (!strcmp (converter_info, "title_string"))
    {
      new_sv = newSVpv_utf8 (converter->title_string, 0);
    }
  else if (!strcmp (converter_info, "title_tree"))
    {
      if (converter->added_title_tree)
        build_texinfo_tree (converter->title_tree, 1);
      new_sv = newSVsv ((SV *) converter->title_tree->sv);
    }
  else if (!strcmp (converter_info, "simpletitle_tree")
           || !strcmp (converter_info, "simpletitle_command_name"))
    {
      if (converter->simpletitle_tree)
        {
          build_simpletitle (converter, converter_info_hv);

          info_sv = hv_fetch (converter_info_hv, converter_info,
                             strlen (converter_info), 0);
          /* probably always true */
          if (info_sv && SvOK (*info_sv))
            {
              return newSVsv (*info_sv);
            }
        }
    }
  else
    {
      char *bug_msg;
      xasprintf (&bug_msg, "%s not an available converter info",
                 converter_info);
      bug (bug_msg);
      non_perl_free (bug_msg);
    }

  if (new_sv)
    {
      hv_store (converter_info_hv, converter_info,
                strlen (converter_info), new_sv, 0);
      SV *result = newSVsv (new_sv);
      return result;
    }

  return newSV (0);
}
