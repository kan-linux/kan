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

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "options_data.h"
#include "document_types.h"
#include "converter_types.h"
/* non_perl_* */
#include "xs_utils.h"
/* fatal */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
#include "debug.h"
/* add_include_directory add_string ... */
#include "utils.h"
/* html_clear_direction_icons html_free_button_specification_list ... */
#include "customization_options.h"
#include "errors.h"
#include "targets.h"
#include "parser_conf.h"
#include "document.h"
/* retrieve_output_units ... */
#include "output_unit.h"
/* newSVpv_utf8 */
#include "build_perl_info.h"
#include "get_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

#define FETCH(key) key##_sv = hv_fetch (element_hv, #key, strlen (#key), 0);

/* used for debugging only */
static void
debug_print_element_hv (HV *element_hv)
{
  SV **cmdname_sv;
  SV **type_sv;
  SV **text_sv;
  TEXT msg;

  dTHX;

  text_init (&msg);
  text_append (&msg, "");

  FETCH(cmdname)
  if (cmdname_sv)
    {
      text_printf (&msg, "@%s", SvPVutf8_nolen (*cmdname_sv));
    }
  FETCH(type)
  if (type_sv)
    {
      text_printf (&msg, "(%s)", SvPVutf8_nolen (*type_sv));
    }
  FETCH(text)
  if (text_sv)
    {
      char *text = SvPVutf8_nolen (*text_sv);
      char *protected_text = debug_protect_eol (text);
      text_printf (&msg, "[T: %s]", protected_text);
      non_perl_free (protected_text);
    }
  fprintf (stderr, "ELT_sv: %s\n", msg.text);
  non_perl_free (msg.text);
}

/* used for debugging only */
void
debug_print_element_sv (SV *element_sv)
{
  dTHX;

  if (SvOK (element_sv))
    {
      HV *element_hv = (HV *) SvRV (element_sv);
      debug_print_element_hv (element_hv);
    }
  else
    {
      fprintf (stderr, "debug_print_element_sv: NUL\n");
    }
}
#undef FETCH

DOCUMENT *
get_document_or_warn (SV *sv_in, char *key, const char *warn_string)
{
  size_t document_descriptor;
  DOCUMENT *document = 0;
  SV** document_descriptor_sv;
  HV *hv_in;

  dTHX;

  hv_in = (HV *)SvRV (sv_in);
  if (!hv_in)
    {
      fprintf (stderr, "ERROR: %s: no hash\n", warn_string);
      return 0;
    }
  document_descriptor_sv = hv_fetch (hv_in, key, strlen (key), 0);
  if (document_descriptor_sv && SvOK (*document_descriptor_sv))
    {
      document_descriptor = (size_t) SvIV (*document_descriptor_sv);
      document = retrieve_document (document_descriptor);
    }
  else if (warn_string)
    {
      fprintf (stderr, "ERROR: %s: no %s\n", warn_string, key);
      return 0;
    }
  if (! document && warn_string)
    {
      fprintf (stderr, "ERROR: %s: no document %zu\n", warn_string,
                                                      document_descriptor);
    }
  return document;
}

/* for the tree root */
DOCUMENT *
get_sv_tree_document (SV *tree_in, const char *warn_string)
{
  dTHX;

  return get_document_or_warn (tree_in, "tree_document_descriptor",
                               warn_string);
}

/* for any element */
DOCUMENT *
get_sv_element_document (SV *element_in, const char *warn_string)
{
  dTHX;

  return get_document_or_warn (element_in, "element_document_descriptor",
                               warn_string);
}

DOCUMENT *
get_sv_document_document (SV *document_in, const char *warn_string)
{
  dTHX;

  return get_document_or_warn (document_in, "document_descriptor",
                               warn_string);
}

ELEMENT *
get_sv_element_element (SV *element_sv, DOCUMENT *document)
{
  HV *element_hv;
  SV **handle_sv;
  const char *key = "_handle";

  dTHX;

  if (!document)
    return 0;

  element_hv = (HV *) SvRV (element_sv);

  handle_sv = hv_fetch (element_hv, key, strlen(key), 0);
  if (handle_sv)
    {
      ELEMENT *e = 0;
      size_t element_number = (size_t) SvIV (*handle_sv);
      /* could also be a function like retrieve_document_element */
      if (element_number <= document->element_handles.number)
        {
          e = document->element_handles.list[element_number -1];
        }
      return e;
    }
  return 0;
}

/* caller should ensure that OUTPUT_UNIT_IN is defined.
   If DOCUMENT_OUT is set, find the document associated with the output units
   too.
 */
size_t
get_sv_output_units_descriptor (SV *output_units_in, const char *warn_string,
                                const DOCUMENT **document_out)
{
  size_t output_units_descriptor = 0;
  AV *av_in;
  SSize_t output_units_nr;
  SV** first_output_unit_sv;
  char *key = "output_units_descriptor";

  dTHX;

  if (document_out)
    *document_out = 0;

  if (!SvOK (output_units_in))
    {
      fprintf (stderr, "get_sv_output_units_descriptor: %s: undef in\n",
                       warn_string);
      return 0;
    }

  av_in = (AV *)SvRV (output_units_in);
  output_units_nr = AvFILL (av_in) +1;

  if (output_units_nr > 0)
    {
      first_output_unit_sv = av_fetch (av_in, 0, 0);
      if (first_output_unit_sv)
        {
          HV *hv_in = (HV *)SvRV (*first_output_unit_sv);
          SV** output_units_descriptor_sv
            = hv_fetch (hv_in, key, strlen (key), 0);
          if (output_units_descriptor_sv)
            {
              output_units_descriptor
                 = (size_t) SvIV (*output_units_descriptor_sv);

              if (!output_units_descriptor && warn_string)
                fprintf (stderr, "ERROR: %s: units descriptor %zu\n",
                                warn_string, output_units_descriptor);
            }
          else if (warn_string)
            fprintf (stderr, "ERROR: %s: no %s\n", warn_string, key);

          if (document_out)
            {
              DOCUMENT *document
               = get_document_or_warn (*first_output_unit_sv,
                                       "output_units_document_descriptor",
                                       warn_string);
              *document_out = document;
            }
        }
      else
        fprintf (stderr, "BUG: get_sv_output_units: av_fetch failed\n");
    }
  else
    {
      if (warn_string)
        fprintf (stderr, "ERROR: %s: empty units list\n", warn_string);
    }
  return output_units_descriptor;
}

/* If DOCUMENT is NULL, it is found using the descriptor associated with
   the first output unit in SV along with the output_units descriptor.
   In general, the DOCUMENT is not NULL in current codes call to
   get_sv_output_units, as previously there was no document descriptor
   availalble.  In the future, it could make sense to get the document
   from the output units SV instead. */
OUTPUT_UNIT_LIST *
get_sv_output_units (const DOCUMENT *document,
                     SV *output_units_in, char *warn_string)
{
  OUTPUT_UNIT_LIST *output_units = 0;
  const DOCUMENT *document_found = 0;
  size_t output_units_descriptor = 0;

  dTHX;

  if (document)
    {
      document_found = document;
      output_units_descriptor
        = get_sv_output_units_descriptor (output_units_in, warn_string, 0);
    }
  else
    {
      output_units_descriptor
        = get_sv_output_units_descriptor (output_units_in, warn_string,
                                          &document_found);
    }

  if (output_units_descriptor && document_found)
    {
      output_units = retrieve_output_units (document_found,
                                            output_units_descriptor);
      if (!output_units && warn_string)
        fprintf (stderr, "ERROR: %s: no units %zu\n", warn_string,
                                             output_units_descriptor);
    }
  return output_units;
}

/* retrieve C stored configuration from parser and set it */
void
apply_sv_parser_conf (SV *parser_sv)
{
  HV *hv_in;
  const char *key = "parser_conf_descriptor";
  SV **parser_conf_descriptor_sv;

  dTHX;

  hv_in = (HV *)SvRV (parser_sv);

  parser_conf_descriptor_sv = hv_fetch (hv_in, key, strlen (key), 0);
  if (parser_conf_descriptor_sv && SvOK (*parser_conf_descriptor_sv))
    {
      size_t parser_conf_descriptor
        = (size_t) SvIV (*parser_conf_descriptor_sv);

      if (parser_conf_descriptor == global_parser_conf->descriptor)
        {
          /*
          fprintf (stderr, "Reuse conf %zu\n", parser_conf_descriptor);
           */
          return;
        }
        /*
      else
        fprintf (stderr, "APPLY %zu\n", parser_conf_descriptor);
         */

      PARSER_CONF *parser_conf
         = retrieve_parser_conf (parser_conf_descriptor);

      if (!parser_conf)
        {
          fprintf (stderr, "ERROR: get_sv_parser_conf: descriptor %zu not found\n",
                           parser_conf_descriptor);
          return;
        }
      else
        {
          apply_conf (parser_conf);
        }
    }
}

void
add_svav_to_string_list (const SV *sv, STRING_LIST *string_list,
                         enum sv_string_type type)
{
  SSize_t i;
  SSize_t strings_nr;

  dTHX;

  if (!SvOK (sv))
    return;

  AV *av = (AV *)SvRV (sv);
  strings_nr = AvFILL (av) +1;
  for (i = 0; i < strings_nr; i++)
    {
      SV **string_sv = av_fetch (av, i, 0);
      if (string_sv)
        {
          const char *string;
          if (type == svt_char)
            string = SvPVutf8_nolen (*string_sv);
          else
            string = SvPVbyte_nolen (*string_sv);
          if (type == svt_dir)
            add_include_directory (string, string_list);
          else
            add_string (string, string_list);
        }
    }
}

#define FETCH(key) key##_sv = hv_fetch (hv_in, #key, strlen (#key), 0);
SOURCE_INFO *
get_source_info (SV *source_info_sv)
{
  HV *hv_in;
  SV **macro_sv;
  SV **file_name_sv;
  SV **line_nr_sv;

  dTHX;

  hv_in = (HV *)SvRV (source_info_sv);

  SOURCE_INFO *source_info
    = (SOURCE_INFO *) non_perl_malloc (sizeof (SOURCE_INFO));
  memset (source_info, 0, sizeof (SOURCE_INFO));

  FETCH(macro)

  if (macro_sv)
    {
      char *macro = (char *) SvPVutf8_nolen (*macro_sv);
      source_info->macro = non_perl_strdup (macro);
    }

  FETCH(file_name)

  if (file_name_sv && SvOK (*file_name_sv))
    {
      char *file_name = (char *) SvPVbyte_nolen (*file_name_sv);
      source_info->file_name = non_perl_strdup (file_name);
    }

  FETCH(line_nr)

  if (line_nr_sv)
    source_info->line_nr = SvIV (*line_nr_sv);

  return source_info;
}
#undef FETCH

void
get_line_message (CONVERTER *self, enum error_type type, int continuation,
                  SV *error_location_info, const char *message)
{
  int do_warn = (self->conf->DEBUG.o.integer > 0);
  SOURCE_INFO *source_info = get_source_info (error_location_info);
  if (source_info->file_name)
    {
      char *saved_string = add_string (source_info->file_name,
                                       &self->small_strings);
      non_perl_free (source_info->file_name);
      source_info->file_name = saved_string;
    }

  if (source_info->macro)
    {
      char *saved_string = add_string (source_info->macro,
                                       &self->small_strings);
      non_perl_free (source_info->macro);
      source_info->macro = saved_string;
    }

  message_list_line_formatted_message (&self->error_messages,
                                       type, continuation, source_info,
                                       message, do_warn);

  non_perl_free (source_info);
}

/* return values:
  0: success
  -1: already set (only if !force)
  -3: type error
 */
int
get_sv_option (OPTION *option, SV *value, int force,
               OPTIONS *options, const CONVERTER *converter)
{
  dTHX;

  if (force <= 0 && option->flags & OF_configured)
    return -1;

  switch (option->type)
    {
      case GOT_integer:
        if (SvOK (value))
          {
            if (looks_like_number (value))
              option->o.integer = SvIV (value);
            else
              {
        /* warn?  No such check in Perl */
        /* Consider that the option is set if the string is not empty, similar
           to Perl.
           Not exactly the same as comparison won't fail in C, while
           it will fail in Perl and trigger a warning. */
                const char *str_value = SvPVutf8_nolen (value);
                if (!strcmp (str_value, ""))
                  option->o.integer = 0;
                else
                  option->o.integer = 1;
              }
          }
        else
          option->o.integer = -1;

        break;

      case GOT_char:
        non_perl_free (option->o.string);
        if (SvOK (value))
          option->o.string = non_perl_strdup (SvPVutf8_nolen (value));
        else
          option->o.string = 0;
        break;

      case GOT_bytes:
        non_perl_free (option->o.string);
        if (SvOK (value))
          option->o.string = non_perl_strdup (SvPVbyte_nolen (value));
        else
          option->o.string = 0;
        break;

      case GOT_bytes_string_list:
        clear_strings_list (option->o.strlist);
        add_svav_to_string_list (value, option->o.strlist, svt_byte);
        break;

      case GOT_file_string_list:
        clear_strings_list (option->o.strlist);
        add_svav_to_string_list (value, option->o.strlist, svt_dir);
        break;

      case GOT_char_string_list:
        clear_strings_list (option->o.strlist);
        add_svav_to_string_list (value, option->o.strlist, svt_char);
        break;

      case GOT_buttons:
        if (option->o.buttons)
          {
            if (options)
              options->BIT_user_function_number
                -= option->o.buttons->BIT_user_function_number;
            html_free_button_specification_list (option->o.buttons);
          }

        option->o.buttons
           = html_get_button_specification_list (converter, value);
        if (option->o.buttons && options)
          /* options->BIT_user_function_number is checked relatively
             early in html_converter_customize to set
             self->external_references_number.
             Buttons could be added later through handlers, therefore,
             self->external_references_number is also increased if handlers
             are registered, such that it is not a problem if there are
             buttons added through handlers.
           */
          options->BIT_user_function_number
            += option->o.buttons->BIT_user_function_number;
        break;

      case GOT_icons:
        html_clear_direction_icons (option->o.icons);
        html_get_direction_icons_sv (option->o.icons, value);

        break;

      default:
        break;
    }

  return 0;
}

void
get_sv_options (SV *sv, OPTIONS *options, OPTION **sorted_options,
                CONVERTER *converter, int force)
{
  I32 hv_number;
  I32 i;
  HV *hv;

  dTHX;

  hv = (HV *)SvRV (sv);

  hv_number = hv_iterinit (hv);
  for (i = 0; i < hv_number; i++)
    {
      char *key;
      I32 retlen;
      SV *value = hv_iternextsv (hv, &key, &retlen);
      OPTION *option = find_option_string (sorted_options, key);

      if (option)
        get_sv_option (option, value, force, options, converter);
    }
}

INDEX_ENTRY *
find_index_entry_sv (const SV *index_entry_sv, INDEX_LIST *indices_info,
                     const char *warn_string, const INDEX **entry_idx,
                     int *entry_number)
{
  HV *index_entry_hv;
  SV **index_name_sv;
  SV **entry_number_sv;
  size_t entry_idx_in_index;
  const char *entry_index_name = 0;
  const INDEX *idx;

  dTHX;

  index_entry_hv = (HV *) SvRV (index_entry_sv);
  index_name_sv = hv_fetch (index_entry_hv, "index_name",
                            strlen ("index_name"), 0);
  entry_number_sv = hv_fetch (index_entry_hv, "entry_number",
                              strlen ("entry_number"), 0);

  if (!index_name_sv || !entry_number_sv)
    {
      char *msg;
      const char *warn_str = warn_string;
      if (!warn_str)
        warn_str = "find_index_entry_sv";
      xasprintf (&msg, "%s: no entry info\n", warn_str);
      fatal (msg);
    }
  entry_index_name = (const char *) SvPVutf8_nolen (*index_name_sv);
  *entry_number = (size_t) SvIV (*entry_number_sv);
  entry_idx_in_index = *entry_number - 1;

  idx = indices_info_index_by_name (indices_info, entry_index_name);
  *entry_idx = idx;
  if (idx)
    {
      if (entry_idx_in_index < idx->entries_number)
        return &idx->index_entries[entry_idx_in_index];
    }

  return 0;
}

/* output format specific */

/* should be consistent with enum button_function_type */
const char *html_button_function_type_string[] = {
  0,
  "::_default_panel_button_dynamic_direction_section_footer",
  "::_default_panel_button_dynamic_direction_node_footer",
  "::_default_panel_button_dynamic_direction",
  0,
};

/* set directions.  To be called after direction names have been collected */
void
html_fill_button_sv_specification_list (const CONVERTER *converter,
                                     BUTTON_SPECIFICATION_LIST *result)
{
  size_t i;
  dTHX;

  for (i = 0; i < result->number; i++)
    {
      BUTTON_SPECIFICATION *button = &result->list[i];

      if (button->type == BST_direction_info)
        {
          if (button->sv)
            {
              const char *direction_name;
              AV *button_spec_info_av = (AV *) SvRV((SV *)button->sv);
              SV **direction_sv = av_fetch (button_spec_info_av, 0, 0);

              if (!direction_sv || !SvOK (*direction_sv))
                {
                  fprintf (stderr,
                           "ERROR: missing direction in button %zu array\n",
                           i);
                  continue;
                }

              direction_name = SvPVutf8_nolen (*direction_sv);

              if (direction_name)
                button->b.button_info->direction
                 = html_get_direction_index (converter, direction_name);
            }
        }
      else if (button->type == BST_direction)
        {
          if (button->sv)
            {
              const char *direction_name = SvPVutf8_nolen ((SV *)button->sv);
              if (direction_name)
                button->b.direction = html_get_direction_index (converter,
                                                              direction_name);
            }
        }
    }
}

/* HTML specific, but needs to be there for options_get_perl.c */
/* it is expected that directions are not found as the directions list
   is not setup already.  A call of html_fill_button_sv_specification_list
   should be needed afterwards */
BUTTON_SPECIFICATION_LIST *
html_get_button_specification_list (const CONVERTER *converter,
                                    const SV *buttons_sv)
{
  BUTTON_SPECIFICATION_LIST *result;
  AV *buttons_av;
  SSize_t buttons_nr;
  size_t i;

  dTHX;

  /* a string may be passed, for instance through command line, therefore
     it is useful to test that buttons_sv is an array reference */
  if (!SvOK (buttons_sv) || !SvROK (buttons_sv)
      || SvTYPE (SvRV (buttons_sv)) != SVt_PVAV)
    return 0;

  buttons_av = (AV *)SvRV (buttons_sv);

  buttons_nr = AvFILL (buttons_av) +1;

  if (buttons_nr == 0)
    return 0;

  result = html_new_button_specification_list ((size_t) buttons_nr);

  result->av = buttons_av;
  SvREFCNT_inc ((SV *)result->av);

  for (i = 0; i < result->number; i++)
    {
      SV **button_sv = av_fetch (result->av, (SSize_t) i, 0);
      BUTTON_SPECIFICATION *button = &result->list[i];

      if (!button_sv || !SvOK (*button_sv))
        {
          fprintf (stderr, "ERROR: missing button %zu\n", i);
        }

      button->sv = *button_sv;
      SvREFCNT_inc (button->sv);

      if (SvROK (*button_sv))
        {
          if (SvTYPE (SvRV(*button_sv)) == SVt_PVCV) /* CODE */
            {
              button->type = BST_function;
              button->b.sv_reference = *button_sv;
            }
          else if (SvTYPE (SvRV(*button_sv)) == SVt_PVAV) /* ARRAY */
            {
              AV *button_spec_info_av = (AV *) SvRV(*button_sv);
              SV **direction_sv = av_fetch (button_spec_info_av, 0, 0);
              SV **button_spec_info_type
                 = av_fetch (button_spec_info_av, 1, 0);
              const char *direction_name;

              BUTTON_SPECIFICATION_INFO *button_spec
                = html_new_button_specification_info ();

              button->type = BST_direction_info;
              button->b.button_info = button_spec;

              if (!direction_sv || !SvOK (*direction_sv))
                {
                  fprintf (stderr,
                           "ERROR: missing direction in button %zu array\n",
                           i);
                  continue;
                }
              if (!button_spec_info_type || !SvOK (*button_spec_info_type))
                {
                  fprintf (stderr,
                           "ERROR: missing specification in button %zu array\n",
                           i);
                  continue;
                }

              direction_name = SvPVutf8_nolen (*direction_sv);
              button_spec->direction
                = html_get_direction_index (converter, direction_name);
               /* to debug
              if (button_spec->direction < 0)
                {
                  fprintf (stderr,
                      "REMARK: unknown button %zu array direction: %d: %s\n",
                           i, button_spec->direction, direction_name);
                }
                */

              if (SvROK (*button_spec_info_type))
                {
                  if (SvTYPE (SvRV(*button_spec_info_type)) == SVt_PVCV) /* CODE */
                    {
                      int j;
                      char *button_fun_name;
                      enum button_function_type button_fun_type = 0;
                      button_spec->type = BIT_function;
                      button_spec->bi.button_function.sv_reference
                                          = *button_spec_info_type;
  /* based on ppport.h output cv_name may not be portable below perl 5.21.5 */
#if PERL_VERSION > 21 || (PERL_VERSION == 21 && PERL_SUBVERSION > 4)
                      button_fun_name
                       = SvPV_nolen (cv_name ((CV *) SvRV (*button_spec_info_type),
                                              0, 0));
                      for (j = 1; html_button_function_type_string[j]; j++)
                        if (strstr (button_fun_name,
                                    html_button_function_type_string[j]))
                          {
                            button_fun_type = j;
                            break;
                          }
#endif
                      if (button_fun_type)
                        button_spec->bi.button_function.type = button_fun_type;
                      else
                        result->BIT_user_function_number++;
                    }
                }
              else
                {
                  int j;
                  char *text_type_string
                     = SvPVutf8_nolen (*button_spec_info_type);
                  char *text_type_p = NULL;
                  if (strlen (text_type_string) > 2
                      && !(memcmp (text_type_string, "->", 2)))
                    {
                      button_spec->type
                        = BIT_selected_direction_information_type;
                      text_type_p = text_type_string +2;
                      text_type_p += strspn (text_type_p, whitespace_chars);
                    }
                  button_spec->bi.direction_information_type = -1;
                  if (text_type_p)
                    for (j = 0; j < HTT_section +1; j++)
                      {
                        if (!strcmp (html_command_text_type_name[j],
                                   text_type_p))
                          {
                            button_spec->bi.direction_information_type = j;
                            break;
                          }
                      }
                }
            }
        }
      else
        {
          const char *direction_name = SvPVutf8_nolen (*button_sv);
          button->type = BST_direction;
          button->b.direction = html_get_direction_index (converter,
                                                          direction_name);
           /* To debug
          if (button->b.direction == -2)
            fprintf (stderr, "REMARK: unknown button %zu string direction: %s\n",
                             i, direction_name);
            */
        }
    }
  return result;
}

/* set direction icons. */
/* HTML specific, but needs to be there for options_get_perl.c */
void
html_get_direction_icons_sv (DIRECTION_ICON_LIST *direction_icons,
                             SV *icons_sv)
{
  HV *icons_hv;
  I32 hv_number;
  I32 i;

  dTHX;

  if (!SvOK (icons_sv))
    return;

  direction_icons->sv = newSVsv (icons_sv);

  icons_hv = (HV *)SvRV ((SV *) icons_sv);

  hv_number = hv_iterinit (icons_hv);

  if (direction_icons->space != (size_t) hv_number)
    {
      direction_icons->space = hv_number;
      if (direction_icons->space == 0)
        {
          non_perl_free (direction_icons->icons_list);
          direction_icons->icons_list = 0;
        }
      else
        direction_icons->icons_list = (DIRECTION_ICON *) non_perl_realloc
                  (direction_icons->icons_list,
                   direction_icons->space * sizeof (DIRECTION_ICON));
    }

  direction_icons->number = hv_number;
  for (i = 0; i < hv_number; i++)
    {
      HE *next = hv_iternext (icons_hv);
      SV *direction_sv = hv_iterkeysv (next);
      char *direction = (char *) SvPVutf8_nolen (direction_sv);
      SV *value_sv = HeVAL(next);
      if (SvOK (value_sv))
        {
          DIRECTION_ICON *icon = &direction_icons->icons_list[i];
          char *value = (char *) SvPVutf8_nolen (value_sv);
          icon->name = non_perl_strdup (value);
          icon->direction_name = non_perl_strdup (direction);
        }
    }
}

static const INDEX_ENTRY *
find_sorted_index_names_index_entry_extra_index_entry_sv (
                                  const SORTED_INDEX_NAMES *sorted_index_names,
                                  const SV *extra_index_entry_sv)
{
  AV *extra_index_entry_av;
  SV **index_name_sv;
  const char *index_name = 0;

  dTHX;

  extra_index_entry_av = (AV *) SvRV (extra_index_entry_sv);

  index_name_sv = av_fetch (extra_index_entry_av, 0, 0);
  if (index_name_sv)
    {
      index_name = SvPVutf8_nolen (*index_name_sv);
    }

  if (index_name)
    {
      SV **number_sv = av_fetch (extra_index_entry_av, 1, 0);
      if (number_sv)
        {
          int entry_number = SvIV (*number_sv);
          if (entry_number)
            {
              size_t index_nr
                = index_number_index_by_name (sorted_index_names,
                                              index_name);
              return &sorted_index_names->list[index_nr -1]
                 ->index_entries[entry_number -1];
            }
        }
    }
  return 0;
}

static const INDEX_ENTRY *
find_document_index_entry_extra_index_entry_sv (const DOCUMENT *document,
                                             const SV *extra_index_entry_sv)
{
  AV *extra_index_entry_av;
  SV **index_name_sv;
  char *index_name = 0;
  const INDEX *idx = 0;
  const INDEX_LIST *indices_info = &document->indices_info;

  dTHX;

  if (!indices_info->number)
    return 0;

  extra_index_entry_av = (AV *) SvRV (extra_index_entry_sv);

  index_name_sv = av_fetch (extra_index_entry_av, 0, 0);
  if (index_name_sv)
    {
      index_name = SvPVutf8_nolen (*index_name_sv);
      idx = indices_info_index_by_name (indices_info, index_name);
    }

  if (idx)
    {
      SV **number_sv = av_fetch (extra_index_entry_av, 1, 0);
      if (number_sv)
        {
          int entry_number = SvIV (*number_sv);
          if (entry_number)
            return &idx->index_entries[entry_number -1];
        }
    }
  return 0;
}

/* if there is a converter with sorted index names, use the
   sorted index names, otherwise use the index information from
   a document */
static const INDEX_ENTRY *
find_element_extra_index_entry_sv (const DOCUMENT *document,
                                   const CONVERTER *converter,
                                   const SV *extra_index_entry_sv)
{
  const INDEX_ENTRY *index_entry;
  if (!converter || !converter->document)
    {
      if (document)
        index_entry
          = find_document_index_entry_extra_index_entry_sv (document,
                                                 extra_index_entry_sv);
      else
        return 0;
    }
  else
   index_entry = find_sorted_index_names_index_entry_extra_index_entry_sv (
                    &converter->sorted_index_names, extra_index_entry_sv);

  return index_entry;
}

#define FETCH(key) key##_sv = hv_fetch (element_hv, #key, strlen (#key), 0);
/* find C tree root element corresponding to perl tree element element_hv */
static const ELEMENT *
find_root_command (const DOCUMENT *document, HV *element_hv,
                   size_t output_units_descriptor)
{
  SV **associated_unit_sv;
  const ELEMENT *root;
  size_t i;

  dTHX;

  if (output_units_descriptor)
    {
      FETCH(associated_unit)

      if (associated_unit_sv)
        {
          /* find the associated output unit and then find the element
             in unit contents */
          HV *associated_unit_hv = (HV *) SvRV (*associated_unit_sv);
          SV **unit_index_sv = hv_fetch (associated_unit_hv, "unit_index",
                                         strlen ("unit_index"), 0);

          if (unit_index_sv)
            {
              size_t unit_index = (size_t) SvIV (*unit_index_sv);
              const OUTPUT_UNIT_LIST *output_units
               = retrieve_output_units (document, output_units_descriptor);

              if (output_units && unit_index < output_units->number)
                {
                  OUTPUT_UNIT *output_unit = output_units->list[unit_index];
                  size_t i;
                  for (i = 0; i < output_unit->unit_contents.number; i++)
                    {
                      ELEMENT *content = output_unit->unit_contents.list[i];
                      if ((HV *) SvRV ((SV *) content->sv) == element_hv)
                        return content;
                    }
                }
            }
        }
    }

  /* if there are no output units go through the root element children */
  root = document->tree;
  for (i = 0; i < root->e.c->contents.number; i++)
    {
      ELEMENT *content = root->e.c->contents.list[i];
      if ((HV *) SvRV ((SV *)content->sv) == element_hv)
        return content;
    }
  return 0;
}

/* find the subentry matching ELEMENT_HV */
static const ELEMENT *
find_index_entry_subentry (const ELEMENT *index_element, const HV *element_hv)
{
  size_t l;
  CONST_ELEMENT_LIST subentries_list;

  dTHX;

  memset (&subentries_list, 0, sizeof (CONST_ELEMENT_LIST));

  collect_subentries (index_element, &subentries_list);

  for (l = 0; l < subentries_list.number; l++)
    {
      const ELEMENT *subentry = subentries_list.list[l];
      if (subentry && (HV *) SvRV ((SV *) subentry->sv) == element_hv)
        {
          non_perl_free (subentries_list.list);
          return subentry;
        }
    }
  non_perl_free (subentries_list.list);
  return 0;
}

/* Find the index entry parent of a subentry going through
   "parent" until finding the index element hash */
const ELEMENT *
find_subentry_index_command_sv (const DOCUMENT *document, HV *subentry_hv)
{
  SV **parent_sv;
  HV *element_hv;

  dTHX;

  element_hv = subentry_hv;

  while (1)
    {
      FETCH(parent)

      if (parent_sv)
        {
          element_hv = (HV *) SvRV (*parent_sv);
          FETCH(parent)
          if (parent_sv)
            {
              SV **cmdname_sv;

              element_hv = (HV *) SvRV (*parent_sv);

              FETCH(cmdname);

              if (cmdname_sv)
                {
                  char *cmdname = SvPVutf8_nolen (*cmdname_sv);
                  enum command_id cmd = lookup_builtin_command (cmdname);
                  if (!cmd || cmd != CM_subentry)
                    return find_element_from_sv (0, document, *parent_sv, 0);
                }
            }
          else
            return 0;
        }
      else
        return 0;
    }
  return 0;
}

/* find the INDEX_ENTRY associated element matching ELEMENT_HV.

   If the index entry was reassociated, the tree element the
   index entry is reassociated with is not index_entry->entry_element
   but index_entry->entry_associated_element.  The original
   tree element that was associated is index_entry->entry_element.
   Depending on the situation one or the other may be looked for
   and the code tries both.

   The reassociated tree element, for example, would be used
   when doing a link to the tree from the index entry.  But it may
   also be the original tree element that is used, for example
   to get the index entry tree element content, for instance
   when going through the elements associated with indices to setup
   index entries sort strings.
 */
static const ELEMENT *
find_index_entry_associated_hv (const INDEX_ENTRY *index_entry,
                                const HV *element_hv)
{
  if (index_entry->entry_associated_element
      && (HV *) SvRV ((SV *)index_entry->entry_associated_element->sv)
           == element_hv)
    return index_entry->entry_associated_element;

  if (index_entry->entry_element
  /* if the index entry was reassociated it is important to check */
      && (HV *) SvRV ((SV *)index_entry->entry_element->sv) == element_hv)
    return index_entry->entry_element;

  return 0;
}

#define EXTRA(key) key##_sv = hv_fetch (extra_hv, #key, strlen (#key), 0);

/* find C Texinfo tree element based on element_sv perl tree element.
   Both DOCUMENT_IN and CONVERTER are optional, but if there is no
   document coming from one or the other, elements will not be found.
   If a DOCUMENT_IN argument is given, the corresponding document is
   used.  If there is no DOCUMENT_IN and there is a CONVERTER argument,
   the CONVERTER document is used.
   OUTPUT_UNIT_DESCRIPTOR is optional, it should allow to find sectioning
   commands faster.
   Only for global commands, commands with indices, and sectioning root
   commands.  More could be added if needed, for example node
   associated nodedescription.
 */
const ELEMENT *
find_element_from_sv (const CONVERTER *converter, const DOCUMENT *document_in,
                      const SV *element_sv, size_t output_units_descriptor)
{
  enum command_id cmd = 0;
  HV *element_hv;
  SV **cmdname_sv;
  SV **extra_sv;
  const DOCUMENT *document = document_in;

  dTHX;

  element_hv = (HV *) SvRV (element_sv);

  if (!document && converter && converter->document)
    document = converter->document;

  FETCH(cmdname)

  if (cmdname_sv && (output_units_descriptor || document))
    {
      char *cmdname = SvPVutf8_nolen (*cmdname_sv);
      cmd = lookup_builtin_command (cmdname);

      if (builtin_command_data[cmd].flags & CF_root
          && cmd != CM_node)
        {
          const ELEMENT *element = find_root_command (document,
                                                element_hv,
                                                output_units_descriptor);
          if (element)
            return element;
        }
      else if (cmd == CM_subentry)
        {
          const ELEMENT *index_element
               = find_subentry_index_command_sv (document, element_hv);
          if (index_element)
            {
              const ELEMENT *element
                = find_index_entry_subentry (index_element, element_hv);
              if (element)
                return element;
            }
        }
      if (document)
        {
          const ELEMENT *element
            = get_cmd_global_uniq_command (&document->global_commands, cmd);
          if (element)
            return (element);
        }
    }

  FETCH(extra)

  if (extra_sv)
    {
      HV *extra_hv = (HV *) SvRV (*extra_sv);
      SV **index_entry_sv;
      SV **associated_index_entry_sv;

      if (document)
        {
          SV **global_command_number_sv;
          EXTRA(global_command_number)
          if (global_command_number_sv)
            {
              size_t global_command_number
                = (size_t) SvIV (*global_command_number_sv);
              const ELEMENT_LIST *global_cmd_list
                = get_cmd_global_multi_command (
                              &document->global_commands, cmd);

              if (global_command_number > 0
                  && global_command_number - 1 < global_cmd_list->number)
                return global_cmd_list->list[global_command_number - 1];
            }
        }

      if (document
          && identifiers_target_number (&document->identifiers_target))
        {
          SV **normalized_sv;
          EXTRA(normalized)
          if (normalized_sv)
            {
              char *normalized = SvPVutf8_nolen (*normalized_sv);
              ELEMENT *element_found
                = find_identifier_target
                      (&document->identifiers_target, normalized);
         /* check the element found in case of multiple defined identifier */
              if (element_found && element_hv
                                    == (HV *) SvRV ((SV *) element_found->sv))
                return element_found;
            }
        }

      EXTRA(associated_index_entry)
      if (associated_index_entry_sv)
        {
          const INDEX_ENTRY *index_entry
               = find_element_extra_index_entry_sv (document,
                                                    converter,
                                              *associated_index_entry_sv);
          if (index_entry)
            {
              const ELEMENT *index_element
                = find_index_entry_associated_hv (index_entry, element_hv);
              if (index_element)
                return (index_element);
            }
        }

      EXTRA(index_entry)
      if (index_entry_sv)
        {
          const INDEX_ENTRY *index_entry
                     = find_element_extra_index_entry_sv (document,
                                                          converter,
                                                          *index_entry_sv);
          if (index_entry)
            {
              const ELEMENT *index_element
                = find_index_entry_associated_hv (index_entry, element_hv);
              if (index_element)
                return (index_element);
            }
        }
    }
  return 0;
}
#undef FETCH

/* returns the sorted index for a LANGUAGE if found.
   Also returns the hash containing the sorted index languages,
   associated with KEY in the DOCUMENT_HV, created if it did not exist */
SV *
get_language_document_hv_sorted_indices (HV *document_hv, const char *key,
                      const char *language, HV **out_sorted_indices_hv)
{
  SV **sorted_indices_sv;
  HV *sorted_indices_hv;

  dTHX;

  sorted_indices_sv = hv_fetch (document_hv, key, strlen (key), 0);

  if (!sorted_indices_sv)
    {
      SV *new_sorted_indices_sv;

      sorted_indices_hv = newHV ();
      new_sorted_indices_sv = newRV_noinc ((SV *) sorted_indices_hv);
      hv_store (document_hv, key, strlen (key), new_sorted_indices_sv, 0);
      *out_sorted_indices_hv = sorted_indices_hv;
    }
  else
    {
      SV *lang_sv = newSVpv_utf8 (language, 0);
      HE *language_indices_he;

      sorted_indices_hv = (HV *)SvRV (*sorted_indices_sv);
      *out_sorted_indices_hv = sorted_indices_hv;

      language_indices_he = hv_fetch_ent (sorted_indices_hv, lang_sv,
                                          0, 0);
      if (language_indices_he)
        {
          SV *language_indices_sv = HeVAL (language_indices_he);

          if (SvOK (language_indices_sv))
            return language_indices_sv;
        }
    }
  return 0;
}



/* Note that it is not really possible to get FILE from a filehandle associated
   to a file to be closed in unclosed_files.  If the file was opened in C,
   it is not possible to directly associate the unclosed stream to a SV
   to transit through Perl, see comment in build_output_files_unclosed_files.
   If the file was opened in Perl, it is possible to get a PerlIO, as done
   below in code, but not a FILE to be closed.  A file obtained with
   PerlIO_exportFILE is a new FILE and should be released before closed and
   do not close the PerlIO.  The PerlIO can be closed, though, or be carried
   around to be closed later on.
 */
 /*
   NOTE clears Perl output files information, as if
   Texinfo::Convert::Utils::output_files_reset had been called.
  */
OUTPUT_FILES_INFORMATION *
get_output_files_information (SV *output_files_sv)
{
  OUTPUT_FILES_INFORMATION *output_files_information;
  SV **unclosed_files_sv;
  SV **opened_files_sv;
  HV *hv;

  dTHX;

  if (!SvOK (output_files_sv))
    return 0;

  output_files_information = new_output_files_information ();

  hv = (HV *) SvRV (output_files_sv);

  opened_files_sv = hv_fetch (hv, "opened_files",
                                strlen ("opened_files"), 0);

  if (opened_files_sv)
    {
      HV *opened_files_hv = (HV *) SvRV (*opened_files_sv);
      I32 hv_number;
      I32 i;

      hv_number = hv_iterinit (opened_files_hv);

      for (i = 0; i < hv_number; i++)
        {
          HE *next = hv_iternext (opened_files_hv);
          SV *file_name_sv = hv_iterkeysv (next);
          const char *file_name = (char *) SvPVutf8_nolen (file_name_sv);
          add_string (file_name, &output_files_information->opened_files);
          /* no real need for the value, still check that it is 1 */
          SV *value_sv = HeVAL(next);
          if (!SvOK (value_sv) || !looks_like_number (value_sv)
              || SvIV (value_sv) != 1)
            {
              fprintf (stderr, "BUG? Unexpected opened_files value for `%s'\n",
                                file_name);
            }
        }

      hv_clear (opened_files_hv);
    }

  unclosed_files_sv = hv_fetch (hv, "unclosed_files",
                                strlen ("unclosed_files"), 0);

  if (unclosed_files_sv)
    {
      HV *unclosed_files_hv = (HV *) SvRV (*unclosed_files_sv);
      I32 hv_number;
      I32 i;

      hv_number = hv_iterinit (unclosed_files_hv);

      for (i = 0; i < hv_number; i++)
        {
          FILE_STREAM *file_stream;
          HE *next = hv_iternext (unclosed_files_hv);
          SV *file_name_sv = hv_iterkeysv (next);
          const char *file_name = (char *) SvPVutf8_nolen (file_name_sv);
          SV *value_sv = HeVAL(next);

          file_stream = allocate_file_stream (output_files_information,
                                              file_name);

          /* Should be two possibilities, undef meaning the FILE was opened
             in C, or Perl file handle.
           */
          if (!SvOK (value_sv))
            {
          /* TODO It could be possible to find the FILE, by adding
             a converter argument to the function, and using code similar
             to get_unclosed_stream.
             However, since the files are all closed (maybe except STDOUT)
             this situation probably never happens, so it is not important
             to fix this issue.
           */
              fprintf (stderr, "REMARK: unclosed C stream for `%s'\n",
                       file_name);
            }
          else
            {/* SvTYPE(SvRV(value_sv)) should be SVt_PVGV,
                Glob (possibly a file handle) */
               /*
              fprintf (stderr,
                       "REMARK: unclosed SV: %d (expected %d) for `%s'\n",
                       SvTYPE(SvRV(value_sv)), SVt_PVGV, file_name);
                */
              IO *file_stream_IO = sv_2io (value_sv);
              if (file_stream_IO)
                {
                  PerlIO *file_stream_PerlIO = IoOFP (file_stream_IO);
                  if (!file_stream_PerlIO)
                    {
                      fprintf (stderr,
                        "BUG? unclosed SV no PerlIO: %d %p %p for `%s'\n",
                        SvTYPE(SvRV(value_sv)), SvRV(value_sv), value_sv,
                        file_name);
                    }
                  else
                    {
                      file_stream->io = (void *) file_stream_PerlIO;
                    }
                }
              else
                fprintf (stderr,
                        "BUG? unclosed SV no IO: %d %p %p for `%s'\n",
                        SvTYPE(SvRV(value_sv)), SvRV(value_sv), value_sv,
                        file_name);
            }
        }

      hv_clear (unclosed_files_hv);
    }

  return output_files_information;
}



/* destruction */

/* Same as Texinfo::OutputUnits release_output_units_list */
static void
release_output_units_list_built (OUTPUT_UNIT_LIST *output_units)
{
  dTHX;

  size_t j;

  for (j = 0; j < output_units->number; j++)
    {
      OUTPUT_UNIT *output_unit = output_units->list[j];

      if (output_unit->hv)
        {
          size_t i;
          SV **directions_sv;

          hv_delete (output_unit->hv, "first_in_page",
                     strlen ("first_in_page"), G_DISCARD);

          hv_delete (output_unit->hv, "tree_unit_directions",
                     strlen ("tree_unit_directions"), G_DISCARD);

          directions_sv
            = hv_fetch (output_unit->hv, "directions",
                        strlen ("directions"), 0);
          if (directions_sv)
            {
              HV *directions_hv
                 = (HV *) SvRV (*directions_sv);
              hv_clear (directions_hv);
              hv_delete (output_unit->hv, "directions",
                     strlen ("directions"), G_DISCARD);
            }

          hv_delete (output_unit->hv, "unit_command",
                     strlen ("unit_command"), G_DISCARD);

          hv_delete (output_unit->hv, "unit_contents",
                     strlen ("unit_contents"), G_DISCARD);

          hv_delete (output_unit->hv, "unit_node",
                     strlen ("unit_node"), G_DISCARD);

          hv_delete (output_unit->hv, "unit_section",
                     strlen ("unit_section"), G_DISCARD);

          for (i = 0; i < output_unit->unit_contents.number; i++)
            {
              const ELEMENT *element = output_unit->unit_contents.list[i];
              HV *element_hv = (HV *) SvRV ((SV *) element->sv);
              hv_delete (element_hv, "associated_unit",
                         strlen ("associated_unit"), G_DISCARD);
            }

           hv_delete (output_unit->hv, "associated_document_unit",
                      strlen ("associated_document_unit"), G_DISCARD);
        }
    }
}

/* Retrieve the output units lists associated to a converter and release the
   associated Perl output units.  Same effect as calling
   Texinfo::OutputUnits::release_output_units_list on all the converter
   output unit lists.
 */
void
converter_release_output_units_built (CONVERTER *converter)
{
  int i;

  for (i = 0; i < OUDT_external_nodes_units+1; i++)
    {
      if (converter->output_units_descriptors[i])
        {
          OUTPUT_UNIT_LIST *output_unit_list
            = retrieve_output_units (converter->document,
                                     converter->output_units_descriptors[i]);
          if (output_unit_list)
            release_output_units_list_built (output_unit_list);
        }
    }
}

/* For documents output units lists, not currently called */
void
release_output_units_lists_built (OUTPUT_UNIT_LISTS *output_units_lists)
{
  size_t i;

  for (i = 0; i < output_units_lists->number; i++)
    {
      OUTPUT_UNIT_LIST *output_units
         = &output_units_lists->output_units_lists[i];

      release_output_units_list_built (output_units);
    }
}



/* the following is only needed in converters, but we still define here
   such that it is available for functions called from C */
void
set_translated_commands (SV *translated_commands_sv,
                         TRANSLATED_COMMAND_LIST *translated_commands)
{
  dTHX;

  clear_translated_commands (translated_commands);

  if (translated_commands_sv)
    {
      HV *translated_commands_hv = 0;
      I32 hv_number;
      I32 i;

      if (!SvOK (translated_commands_sv))
        hv_number = 0;
      else
        {
          translated_commands_hv
            = (HV *)SvRV (translated_commands_sv);

          hv_number = hv_iterinit (translated_commands_hv);
        }

      for (i = 0; i < hv_number; i++)
        {
          char *cmdname;
          I32 retlen;
          SV *translation_sv = hv_iternextsv (translated_commands_hv,
                                              &cmdname, &retlen);
          if (SvOK (translation_sv))
            {
              enum command_id cmd = lookup_builtin_command (cmdname);

              if (!cmd)
                fprintf (stderr, "ERROR: %s: no translated command\n", cmdname);
              else
                {
                  char *tmp_spec = (char *) SvPVutf8_nolen (translation_sv);
                  add_translated_command (translated_commands, cmd,
                                          tmp_spec);
                }
            }
        }
    }
}

static void
get_deprecated_config_directories_sv (SV *deprecated_config_directories_sv,
                                      DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  dTHX;

  if (deprecated_config_directories_sv)
    {
      HV *deprecated_config_directories_hv = 0;
      I32 hv_number;
      I32 i;

      if (!SvOK (deprecated_config_directories_sv))
        hv_number = 0;
      else
        {
          deprecated_config_directories_hv
            = (HV *)SvRV (deprecated_config_directories_sv);

          hv_number = hv_iterinit (deprecated_config_directories_hv);
        }

      for (i = 0; i < hv_number; i++)
        {
          HE *next = hv_iternext (deprecated_config_directories_hv);
          SV *obsolete_dir_sv = hv_iterkeysv (next);
          const char *obsolete_dir = (char *) SvPVutf8_nolen (obsolete_dir_sv);
          SV *value_sv = HeVAL(next);
          if (SvOK (value_sv))
            {
              const char *reference_dir = (char *) SvPVutf8_nolen (value_sv);
              add_new_deprecated_dir_info (deprecated_dirs, obsolete_dir,
                                           reference_dir);
            }
        }
    }
}


/* CLASS_NAME is Perl converter class for warning message.  If NULL, no message.
   CONVERTER may be NULL (when called from converter_defaults). */
CONVERTER_INITIALIZATION_INFO *
get_converter_info_from_sv (SV *conf_sv, const char *class_name,
                            CONVERTER *converter)
{
  CONVERTER_INITIALIZATION_INFO *initialization_info = 0;

  dTHX;

  if (conf_sv && SvOK (conf_sv))
    {
      I32 hv_number;
      I32 i;

      HV *conf_hv = (HV *)SvRV (conf_sv);

      initialization_info = new_converter_initialization_info ();

      hv_number = hv_iterinit (conf_hv);

      if (!hv_number)
        return initialization_info;

      for (i = 0; i < hv_number; i++)
        {
          char *key;
          I32 retlen;
          SV *value_sv = hv_iternextsv (conf_hv, &key, &retlen);

          OPTION *option = find_option_string (
                       initialization_info->conf.sorted_options, key);
          if (option)
            {
              int status = get_sv_option (option, value_sv, 0,
                                      initialization_info->conf.options,
                                      converter);
              if (!status)
                options_list_add_option_number (&initialization_info->conf,
                                                option->number);
              else
               /* can only be an error of bad data value_sv, as the options
                  cannot be set already */
                fprintf (stderr, "ERROR: %s unexpected conf error\n", key);
            }
          else
            {
              /* Currently no information passed as is from Perl without
                 being stored in C.
              add_string (key,
                &initialization_info->non_valid_customization);
               */

              if (!strcmp (key, "translated_commands"))
                set_translated_commands (value_sv,
                       &initialization_info->translated_commands);
              else if (!strcmp (key, "deprecated_config_directories"))
                {
                  get_deprecated_config_directories_sv (value_sv,
                    &initialization_info->deprecated_config_directories);
                }
              else if (class_name)
                {
                  fprintf (stderr,
                           "%s: %s not a possible configuration\n",
                           class_name, key);
                }
            }
        }
    }
  return initialization_info;
}

