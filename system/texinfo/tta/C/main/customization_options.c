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

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#include "option_types.h"
#include "options_data.h"
#include "command_ids.h"
#include "converter_types.h"
#include "options_defaults.h"
#include "api_to_perl.h"
/* *_strings_list
 */
#include "utils.h"
#include "builtin_commands.h"
#include "customization_options.h"

OPTIONS txi_base_options;
OPTION *txi_base_sorted_options[TXI_OPTIONS_NR];
COMMAND_OPTION_NUMBER_CMD txi_options_command_map[TXI_COMMAND_OPTIONS_NR];

static size_t txi_cmd_option_number[BUILTIN_CMD_NUMBER];


/* functions to setup and use sorted options */

static int
compare_option_str (const void *a, const void *b)
{
  const OPTION **opt_a = (const OPTION **) a;
  const OPTION **opt_b = (const OPTION **) b;

  return strcmp ((*opt_a)->name, (*opt_b)->name);
}

/* sort options and set the index in the option structure to the index in
   the sorted array */
static void
setup_sorted_options (OPTION **sorted_options, OPTIONS *options)
{
  size_t i;
  setup_sortable_options (sorted_options, options);
  qsort (sorted_options, TXI_OPTIONS_NR, sizeof (OPTION *), compare_option_str);

  for (i = 0; i < TXI_OPTIONS_NR; i++)
    {
      sorted_options[i]->number = i + 1;
    }
}

OPTION **
new_sorted_options (OPTIONS *options)
{
  OPTION **sorted_options
    = (OPTION **) malloc (sizeof (OPTION *) * TXI_OPTIONS_NR);

  setup_sorted_options (sorted_options, options);
  return sorted_options;
}

OPTION *
find_option_string (OPTION **sorted_options, const char *name)
{
  static OPTION option_key;
  OPTION *option_ref = &option_key;
  OPTION **result;

  option_key.name = name;
  result = (OPTION **)bsearch (&option_ref, sorted_options, TXI_OPTIONS_NR,
                               sizeof (OPTION *), compare_option_str);
  if (result)
    return *result;
  else
    return 0;
}



/* initialization */

void
txi_initialise_base_options (void)
{
  size_t i;

  initialize_options (&txi_base_options);
  set_all_options_defaults (&txi_base_options);
  setup_sorted_options (txi_base_sorted_options, &txi_base_options);
  setup_options_command_map (txi_options_command_map, &txi_base_options);

  for (i = 0; i < TXI_COMMAND_OPTIONS_NR; i++)
    txi_cmd_option_number[txi_options_command_map[i].cmd]
      = txi_options_command_map[i].option_number;
}



/* single option and options structure functions */

OPTIONS *
new_options (void)
{
  OPTIONS *options = (OPTIONS *) malloc (sizeof (OPTIONS));
  memset (options, 0, sizeof (OPTIONS));
  initialize_options (options);
  return options;
}

/* html options */

BUTTON_SPECIFICATION_INFO *
html_new_button_specification_info (void)
{
  BUTTON_SPECIFICATION_INFO *button_spec
    = (BUTTON_SPECIFICATION_INFO *)
        malloc (sizeof (BUTTON_SPECIFICATION_INFO));
  memset (button_spec, 0, sizeof (BUTTON_SPECIFICATION_INFO));
  return button_spec;
}

BUTTON_SPECIFICATION_LIST *
html_new_button_specification_list (size_t buttons_nr)
{
  BUTTON_SPECIFICATION_LIST *result;

  result = (BUTTON_SPECIFICATION_LIST *)
              malloc (sizeof (BUTTON_SPECIFICATION_LIST));

  result->BIT_user_function_number = 0;
  result->number = buttons_nr;
  result->av = 0;

  result->list = (BUTTON_SPECIFICATION *) malloc (buttons_nr *
                   sizeof (BUTTON_SPECIFICATION));
  memset (result->list, 0, buttons_nr * sizeof (BUTTON_SPECIFICATION));

  return result;
}

void
html_free_button_specification_list (BUTTON_SPECIFICATION_LIST *buttons)
{
  if (!buttons)
    return;

  if (buttons->number > 0)
    {
      size_t i;
      for (i = 0; i < buttons->number; i++)
        {
          BUTTON_SPECIFICATION *button = &buttons->list[i];
          if (button->type == BST_direction_info)
            {
              free (button->b.button_info);
            }
          if (button->sv)
            unregister_perl_data (button->sv);
        }
    }
  free (buttons->list);
  if (buttons->av)
    unregister_perl_data (buttons->av);
  free (buttons);
}

void html_clear_direction_icons (DIRECTION_ICON_LIST *direction_icons)
{
  if (!direction_icons)
    return;

  if (direction_icons->number > 0)
    {
      size_t i;
      for (i = 0; i < direction_icons->number; i++)
        {
          DIRECTION_ICON *icon = &direction_icons->icons_list[i];
          free (icon->name);
          free (icon->direction_name);
        }
    }
  direction_icons->number = 0;
}

static void
html_free_direction_icons (DIRECTION_ICON_LIST *direction_icons)
{
  if (!direction_icons)
    return;

  html_clear_direction_icons (direction_icons);
  free (direction_icons->icons_list);
  direction_icons->space = 0;
  direction_icons->icons_list = 0;
  if (direction_icons->sv)
    unregister_perl_data (direction_icons->sv);
}

void
clear_option (OPTION *option)
{
  switch (option->type)
    {
      case GOT_char:
      case GOT_bytes:
        free (option->o.string);
        option->o.string = 0;
        break;

      case GOT_bytes_string_list:
      case GOT_file_string_list:
      case GOT_char_string_list:
        clear_strings_list (option->o.strlist);
        break;

      case GOT_buttons:
        html_free_button_specification_list (option->o.buttons);
        option->o.buttons = 0;
        break;

      case GOT_icons:
        html_clear_direction_icons (option->o.icons);
        break;

      case GOT_integer:
        option->o.integer = -1;

      default:
        break;
    }
  /* need to reset the flags too, otherwise the options will not be readded
     to the list.  Note that we do that for all the options, while we could
     have selected the options in the list only, but this allows to clear
     an option individually */
  option->flags &= ~OF_set_in_list;
}

/* option is not supposed to be accessed again */
void
free_option (OPTION *option)
{
  switch (option->type)
    {
      case GOT_integer:
        break;

      case GOT_char:
      case GOT_bytes:
        free (option->o.string);
        break;

      case GOT_bytes_string_list:
      case GOT_file_string_list:
      case GOT_char_string_list:
        destroy_strings_list (option->o.strlist);
        break;

      case GOT_buttons:
        html_free_button_specification_list (option->o.buttons);
        break;

      case GOT_icons:
        html_free_direction_icons (option->o.icons);
        free (option->o.icons);
        break;

      default:
        break;
    }
}

void
initialize_option (OPTION *option, enum global_option_type type,
                   const char *name, unsigned long flags)
{
  option->type = type;
  option->name = name;
  option->flags = flags;
  option->number = 0;
  switch (type)
    {
      case GOT_integer:
        option->o.integer = -1;
        break;

      case GOT_char:
      case GOT_bytes:
        option->o.string = 0;
        break;

      case GOT_bytes_string_list:
      case GOT_file_string_list:
      case GOT_char_string_list:
        option->o.strlist = new_string_list ();
        break;

      case GOT_buttons:
        option->o.buttons = 0;
        break;

      case GOT_icons:
        option->o.icons = (DIRECTION_ICON_LIST *)
                          malloc (sizeof (DIRECTION_ICON_LIST));
        memset (option->o.icons, 0, sizeof (DIRECTION_ICON_LIST));
        break;

      default:
        break;
    }
}

/* only for strings and integers */
static void
option_set_conf_internal (OPTION *option, int int_value, const char *char_value)
{
  switch (option->type)
    {
      case GOT_integer:
        option->o.integer = int_value;
        break;
      case GOT_char:
      case GOT_bytes:
        free (option->o.string);
        if (!char_value)
          option->o.string = 0;
        else
          option->o.string = strdup (char_value);
        break;

      default:
        fprintf (stderr, "BUG: set_conf type not handled: %d\n",
                 option->type);
    }
}

int
option_set_conf (OPTION *option, int int_value, const char *char_value)
{
  if (option->flags & OF_configured)
    return 0;
  option_set_conf_internal (option, int_value, char_value);
  return 1;
}

void
option_force_conf (OPTION *option, int int_value, const char *char_value)
{
  option_set_conf_internal (option, int_value, char_value);
}

void
copy_option (OPTION *destination, const OPTION *source)
{
  switch (source->type)
    {
      case GOT_integer:
        destination->o.integer = source->o.integer;
        break;

      case GOT_char:
      case GOT_bytes:
        free (destination->o.string);
        if (!source->o.string)
          destination->o.string = 0;
        else
          destination->o.string = strdup (source->o.string);
        break;

      case GOT_bytes_string_list:
      case GOT_file_string_list:
      case GOT_char_string_list:
        clear_strings_list (destination->o.strlist);
        copy_strings (destination->o.strlist, source->o.strlist);
        break;

      case GOT_icons:
        {
          DIRECTION_ICON_LIST *dest_icons = destination->o.icons;
          DIRECTION_ICON_LIST *source_icons = source->o.icons;
          html_free_direction_icons (dest_icons);
          if (source_icons)
            {
              dest_icons->number = source_icons->number;
              dest_icons->space = source_icons->space;
              dest_icons->sv = source_icons->sv;
              register_perl_data (dest_icons->sv);
              if (dest_icons->space)
                {
                  size_t i;
                  dest_icons->icons_list = (DIRECTION_ICON *) malloc
                             (dest_icons->space * sizeof (DIRECTION_ICON));
                  for (i = 0; i < dest_icons->number; i++)
                    {
                      DIRECTION_ICON *dest_icon = &dest_icons->icons_list[i];
                      DIRECTION_ICON *src_icon = &source_icons->icons_list[i];
                      if (src_icon->direction_name)
                        dest_icon->name = strdup (src_icon->name);
                      else
                        dest_icon->name = 0;
                      if (src_icon->direction_name)
                        dest_icon->direction_name
                          = strdup (src_icon->direction_name);
                      else
                        dest_icon->direction_name = 0;
                    }
                }
            }
        }
        break;

      case GOT_buttons:
        { /* Note that the caller should adjust BIT_user_function_number
             of the options holding the buttons */
          html_free_button_specification_list (destination->o.buttons);
          destination->o.buttons = 0;
          if (source->o.buttons)
            {
              size_t i;
              BUTTON_SPECIFICATION_LIST *result;
              BUTTON_SPECIFICATION_LIST *s_buttons = source->o.buttons;
              result = (BUTTON_SPECIFICATION_LIST *)
                malloc (sizeof (BUTTON_SPECIFICATION_LIST));

              result->BIT_user_function_number
                = s_buttons->BIT_user_function_number;
              result->number = s_buttons->number;

              result->av = s_buttons->av;
              if (result->av)
                register_perl_data (result->av);

              result->list = (BUTTON_SPECIFICATION *)
                 malloc (result->number * sizeof (BUTTON_SPECIFICATION));
              memset (result->list, 0,
                  result->number * sizeof (BUTTON_SPECIFICATION));
              for (i = 0; i < result->number; i++)
                {
                  BUTTON_SPECIFICATION *button = &result->list[i];
                  BUTTON_SPECIFICATION *s_button = &s_buttons->list[i];

                  button->sv = s_button->sv;
                  /* need to increase the counter, as it is decreased upon
                     destroying the button */
                  if (button->sv)
                    register_perl_data (button->sv);
                  button->type = s_button->type;
                  if (button->type == BST_function)
                    button->b.sv_reference = s_button->b.sv_reference;
                  else if (button->type == BST_direction)
                    {
                      button->b.direction = s_button->b.direction;
                      if (button->b.direction < 0 && s_button->direction_string)
                        button->direction_string
                          = s_button->direction_string;
                    }
                  else if (button->type == BST_direction_info)
                    {
                      BUTTON_SPECIFICATION_INFO *s_button_spec
                        = s_button->b.button_info;
                      BUTTON_SPECIFICATION_INFO *button_spec
                        = (BUTTON_SPECIFICATION_INFO *)
                         malloc (sizeof (BUTTON_SPECIFICATION_INFO));
                      memset (button_spec, 0,
                              sizeof (BUTTON_SPECIFICATION_INFO));
                      button->b.button_info = button_spec;
                      button_spec->type = s_button_spec->type;
                      button_spec->direction = s_button_spec->direction;

                      if (button_spec->direction < 0
                          && s_button->direction_string)
                        button->direction_string
                          = s_button->direction_string;

                      if (button_spec->type == BIT_function)
                        {
                          button_spec->bi.button_function.type
                            = s_button_spec->bi.button_function.type;
                          button_spec->bi.button_function.sv_reference
                            = s_button_spec->bi.button_function.sv_reference;
                        }
                      else /* BIT_selected_direction_information_type */
                        button_spec->bi.direction_information_type
                          = s_button_spec->bi.direction_information_type;
                    }
                }
              destination->o.buttons = result;
            }
        }
        break;

      default:
        fprintf (stderr, "BUG: copy_option type not handled: %d\n",
                source->type);
    }
}



/* functions to set and use options list */

void
initialize_options_list (OPTIONS_LIST *options_list)
{
  memset (options_list, 0, sizeof (OPTIONS_LIST));

  options_list->options = new_options ();
  options_list->sorted_options = new_sorted_options (options_list->options);
}

void
free_options_list (OPTIONS_LIST *options_list)
{
  size_t i;

  free (options_list->list);

  for (i = 0; i < TXI_OPTIONS_NR; i++)
    free_option (options_list->sorted_options[i]);

  free (options_list->sorted_options);
  free (options_list->options);
}

void
clear_options_list (OPTIONS_LIST *options_list)
{
  size_t i;
  OPTION **sorted_options = options_list->sorted_options;

  for (i = 0; i < TXI_OPTIONS_NR; i++)
    clear_option (sorted_options[i]);

  options_list->number = 0;
  options_list->options->BIT_user_function_number = 0;
}

int
option_number_in_option_list (OPTIONS_LIST *options_list, size_t number)
{
  if (options_list->sorted_options[number -1]->flags & OF_set_in_list)
    return 1;
  else
    return 0;
}

void
options_list_add_option_number (OPTIONS_LIST *options_list,
                                size_t number)
{
  if (options_list->sorted_options[number -1]->flags & OF_set_in_list)
    return;

  if (options_list->number >= options_list->space)
    {
      options_list->list = realloc (options_list->list,
             (options_list->space += 5) * sizeof (size_t));
    }
  options_list->list[options_list->number] = number;
  options_list->sorted_options[number -1]->flags |= OF_set_in_list;
  options_list->number++;
}

static OPTION *
options_list_add_option_name (OPTIONS_LIST *options_list,
                              const char *option_name)
{
  OPTION *option = find_option_string (options_list->sorted_options,
                                       option_name);
  if (!option)
    return 0;

  options_list_add_option_number (options_list, option->number);

  return option;
}

/* remove and clear */
OPTION *
options_list_remove_option_number (OPTIONS_LIST *options_list,
                                   size_t number)
{
  size_t i;

  if (!(options_list->sorted_options[number -1]->flags & OF_set_in_list))
    return 0;

  for (i = 0; i < options_list->number; i++)
    {
      size_t index = options_list->list[i] - 1;
      OPTION *option = options_list->sorted_options[index];
      if (option->number == number)
        {
          if (i < options_list->number -1)
            memmove (&options_list->list[i], &options_list->list[i+1],
                     (options_list->number - (i+1)) * sizeof (size_t));
          options_list->number--;
          clear_option (option);
          return option;
        }
    }
  /* should never happen */
  return 0;
}

/* copy OPTIONS_LIST options to an OPTIONS structure */
static void
copy_options_list_options (OPTIONS *options, OPTION **sorted_options,
                           const OPTIONS_LIST *options_list)
{
  if (options_list)
    {
      size_t i;
      for (i = 0; i < options_list->number; i++)
        {
          size_t index = options_list->list[i] - 1;
          OPTION *src_option = options_list->sorted_options[index];
          OPTION *dst_option = sorted_options[index];

          if (src_option->type == GOT_buttons)
            {
              if (src_option->o.buttons)
                options->BIT_user_function_number
                   += src_option->o.buttons->BIT_user_function_number;
              if (dst_option->o.buttons)
                options->BIT_user_function_number
                   -= dst_option->o.buttons->BIT_user_function_number;
            }

          copy_option (dst_option, src_option);
        }
    }
}

void
copy_options_list (OPTIONS_LIST *options_list, const OPTIONS_LIST *options_src)
{
  copy_options_list_options (options_list->options,
                             options_list->sorted_options,
                             options_src);
  if (options_src)
    {
      size_t i;
      for (i = 0; i < options_src->number; i++)
        options_list_add_option_number (options_list, options_src->list[i]);
    }
}

/* copy OPTIONS_LIST options to an OPTIONS structure */
void
copy_options_list_set_configured (OPTIONS *options, OPTION **sorted_options,
                                  const OPTIONS_LIST *options_list,
                                  int set_configured)
{
  copy_options_list_options (options, sorted_options, options_list);

  if (options_list && set_configured)
    {
      size_t i;
      for (i = 0; i < options_list->number; i++)
        {
          size_t index = options_list->list[i] - 1;
          sorted_options[index]->flags |= OF_configured;
        }
    }
}

OPTION *
add_option_value (OPTIONS_LIST *options_list,
                  const char *name,
                  int int_value, const char *char_value)
{
  OPTION *option = options_list_add_option_name (options_list, name);

  option_set_conf (option, int_value, char_value);

  return option;
}

OPTION *
add_new_button_option (OPTIONS_LIST *options_list, const char *option_name,
                       BUTTON_SPECIFICATION_LIST *buttons)
{
  OPTION *option = find_option_string (options_list->sorted_options,
                                       option_name);
  if (!option || option->type != GOT_buttons)
    return 0;

  options_list_add_option_number (options_list, option->number);

  if (option->o.buttons)
    options_list->options->BIT_user_function_number
        -= option->o.buttons->BIT_user_function_number;

  clear_option (option);
  option->o.buttons = buttons;
  if (option->o.buttons)
    options_list->options->BIT_user_function_number
        += option->o.buttons->BIT_user_function_number;

  return option;
}

OPTION *
add_option_strlist_value (OPTIONS_LIST *options_list,
                          const char *option_name, const STRING_LIST *strlist)
{
  OPTION *option = find_option_string (options_list->sorted_options,
                                      option_name);
  if (!option)
    return 0;

  if (option->type != GOT_char_string_list
      && option->type != GOT_bytes_string_list
      && option->type != GOT_file_string_list)
    return 0;

  options_list_add_option_number (options_list, option->number);

  clear_option (option);

  copy_strings (option->o.strlist, strlist);

  return option;
}

/* for debugging */
char *
show_options_list_options_set (OPTIONS_LIST *options_list)
{
  static STRING_LIST options_names;
  size_t i;
  char *result;

  for (i = 0; i < options_list->number; i++)
    {
      OPTION *option = options_list->sorted_options[options_list->list[i] -1];
      add_string (option->name, &options_names);
    }

  sort_strings_list (&options_names);
  result = join_strings_list (&options_names);

  clear_strings_list (&options_names);

  return result;
}



/* misc other functions */

OPTION *
get_converter_command_option (OPTION **sorted_options, enum command_id cmd)
{
  OPTION *result = 0;
  size_t option_number = txi_cmd_option_number[cmd];

  if (option_number)
    {
      result = sorted_options[option_number -1];
    }

  return result;
}

/* ALTIMP perl/Texinfo/Common.pm */
void
set_informative_command_value (OPTION **sorted_options,
                               const ELEMENT *element)
{
  const char *value = 0;
  enum command_id cmd;

  value = informative_command_value (element, &cmd);

  if (value)
    {
      OPTION *option;
      option = get_converter_command_option (sorted_options, cmd);
      if (option)
        {
          int int_value = -1;
          if (option->type == GOT_integer)
            int_value = strtoul (value, NULL, 10);
          option_set_conf (option, int_value, value);
        }
    }
}

/* ALTIMP perl/Texinfo/Common.pm */
/*
  Notice that the only effect is to use set_conf (directly or through
  set_informative_command_value), no @-commands setting side effects are done
  and associated customization variables are not set/reset either.
 */
const ELEMENT *
set_global_document_command (GLOBAL_COMMANDS *global_commands,
                             OPTION **sorted_options,
                             enum command_id cmd,
                             enum command_location command_location)
{
  const ELEMENT *element
     = get_global_document_command (global_commands, cmd,
                                    command_location);
  if (element)
    set_informative_command_value (sorted_options, element);
  return element;
}


/* constructors in particular called from files including perl headers */

CONVERTER_INITIALIZATION_INFO *
new_converter_initialization_info (void)
{
  CONVERTER_INITIALIZATION_INFO *result = (CONVERTER_INITIALIZATION_INFO *)
     malloc (sizeof (CONVERTER_INITIALIZATION_INFO));
  memset (result, 0, sizeof (CONVERTER_INITIALIZATION_INFO));

  initialize_options_list (&result->conf);
  return result;
}

