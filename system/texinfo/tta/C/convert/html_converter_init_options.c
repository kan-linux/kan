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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#include <config.h>

#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

#include "tree_types.h"
#include "option_types.h"
#include "converter_types.h"
#include "converters_options.h"
/* html_get_direction_index */
#include "utils.h"
/* add_new_button_option html_free_button_specification_list */
#include "customization_options.h"
/* new_converter_initialization_info */
#include "converter.h"
#include "html_converter_api.h"

/* HTML converter options setting and initialization -- converter_defaults. */

/* the enum value is negative to denote a special unit direction with
   a direction index not already known.  And such that -enum_value -2
   is the index in the special units directions names array */
enum BUTTON_special_unit_directions {
    BSUD_D_About = -3,
    BSUD_D_Contents,
};

/* should be consistent with enum BUTTON_special_unit_directions.  See
   the comment there */
static const char *buttons_special_units_names[] = {
    "Contents",
    "About",
};

static const int DEFAULT_MISC_BUTTONS[] = {
 D_direction_Top, BSUD_D_Contents, D_direction_Index, BSUD_D_About,
 -1
};

/* same as NODE_FOOTER_BUTTONS */
static const int T2H_SECTION_BUTTONS[] = {
 D_direction_FastBack, D_direction_Back, D_direction_Up, D_direction_Forward,
 D_direction_FastForward,
 D_direction_Space, D_direction_Space, D_direction_Space, D_direction_Space,
 D_direction_Top, BSUD_D_Contents, D_direction_Index, BSUD_D_About,
 -1
};

/* same as TOP_FOOTER_BUTTONS */
static const int T2H_TOP_BUTTONS[] = {
 D_direction_Back, D_direction_Forward, D_direction_Space,
 BSUD_D_Contents, D_direction_Index, BSUD_D_About,
 -1
};

/* same as CHAPTER_FOOTER_BUTTONS */
static const int T2H_CHAPTER_BUTTONS[] = {
 D_direction_FastBack, D_direction_FastForward, D_direction_Space,
 D_direction_Space, D_direction_Space, D_direction_Space, D_direction_Space,
 D_direction_Top, BSUD_D_Contents, D_direction_Index, BSUD_D_About,
 -1
};

static const int T2H_SECTION_FOOTER_BUTTONS[] = {
 D_direction_FastBack, D_direction_FirstInFileBack, D_direction_FirstInFileUp,
 D_direction_Forward, D_direction_FastForward,
 -1
};



/* functions to create one button specification and buttons
   specifications lists corresponding to the defaults.
 */

/* create button specification */
/* NOTE this function is quite generic and could be in another
   file if it becomes used elsewhere */
static void
new_button_specification (BUTTON_SPECIFICATION *button,
                          enum button_specification_type type,
                          enum button_information_type info_type,
                          int direction, const char *direction_string,
                          enum button_function_type function_type,
                          enum html_text_type text_type)
{
  button->type = type;
  button->direction_string = direction_string;

  if (type == BST_direction)
    button->b.direction = direction;
  else if (type == BST_direction_info)
    {
      BUTTON_SPECIFICATION_INFO *button_spec
                    = html_new_button_specification_info ();

      button->b.button_info = button_spec;

      button_spec->type = info_type;
      button_spec->direction = direction;

      if (info_type == BIT_function)
        button_spec->bi.button_function.type = function_type;
      else if (info_type == BIT_selected_direction_information_type)
        button_spec->bi.direction_information_type = text_type;
    }
}

/* this function may be called too early for special units direction
   indices to be known, in that case we register direction string name
   for such directions, directions are set afterwards by calling
   html_fill_options_directions
 */
static void
new_special_unit_direction_button (const CONVERTER *self,
                                   BUTTON_SPECIFICATION *button,
                       enum BUTTON_special_unit_directions special_direction)
{
  const char *button_name = buttons_special_units_names[-special_direction -2];
  int direction = html_get_direction_index (self, button_name);

  if (direction < 0)
    new_button_specification (button, BST_direction,
                              0, -1, button_name, 0, 0);
  else
    new_button_specification (button, BST_direction,
                              0, direction, 0, 0, 0);
}

static BUTTON_SPECIFICATION_LIST *
new_base_navigation_buttons (const CONVERTER *self,
                             enum button_function_type function_type,
                             int with_about)
{
  BUTTON_SPECIFICATION_LIST *result;
  int buttons_nr = 6;

  if (with_about)
    buttons_nr++;

  result = html_new_button_specification_list (buttons_nr);

  new_button_specification (&result->list[0], BST_direction_info,
                            BIT_function, D_direction_Next, 0,
                            function_type, 0);
  new_button_specification (&result->list[1], BST_direction_info,
                            BIT_function, D_direction_Prev, 0,
                            function_type, 0);
  new_button_specification (&result->list[2], BST_direction_info,
                            BIT_function, D_direction_Up, 0,
                            function_type, 0);
  new_button_specification (&result->list[3], BST_direction, 0,
                            D_direction_Space, 0, 0, 0);
  new_special_unit_direction_button (self, &result->list[4], BSUD_D_Contents);
  new_button_specification (&result->list[5], BST_direction, 0,
                            D_direction_Index, 0, 0, 0);
  if (with_about)
    new_special_unit_direction_button (self, &result->list[6], BSUD_D_About);
  return result;
}

static BUTTON_SPECIFICATION_LIST *
new_base_links_buttons (const CONVERTER *self)
{
  BUTTON_SPECIFICATION_LIST *result = html_new_button_specification_list (7);

  new_button_specification (&result->list[0], BST_direction,
                            0, D_direction_Top, 0, 0, 0);
  new_button_specification (&result->list[1], BST_direction,
                            0, D_direction_Index, 0, 0, 0);

  new_special_unit_direction_button (self, &result->list[2], BSUD_D_Contents);
  new_special_unit_direction_button (self, &result->list[3], BSUD_D_About);

  new_button_specification (&result->list[4], BST_direction,
                            0, D_direction_NodeUp, 0, 0, 0);
  new_button_specification (&result->list[5], BST_direction,
                            0, D_direction_NodeNext, 0, 0, 0);
  new_button_specification (&result->list[6], BST_direction,
                            0, D_direction_NodePrev, 0, 0, 0);
  return result;
}

static BUTTON_SPECIFICATION_LIST *
new_base_navigation_section_buttons (const CONVERTER *self)
{
  return new_base_navigation_buttons (self, BFT_type_panel_directions, 1);
}

static BUTTON_SPECIFICATION_LIST *
new_base_navigation_section_footer_buttons (const CONVERTER *self)
{
  return new_base_navigation_buttons (self, BFT_type_panel_section_footer, 0);
}

/* a negative direction in DIRECTIONS corresponds to a special direction
   which index is not known early and is better stored as a string.

   Mainly called for texi2html style navigation buttons, but also for
   default special units navigation panel buttons.
 */
static BUTTON_SPECIFICATION_LIST *
new_directions_list_buttons_specifications (const CONVERTER *self,
                                            const int *directions)
{
  int buttons_nr = 0;
  int i;

  BUTTON_SPECIFICATION_LIST *result;

  for (buttons_nr = 0; directions[buttons_nr] != -1; buttons_nr++) {};

  result = html_new_button_specification_list (buttons_nr);

  for (i = 0; i < buttons_nr; i++)
    {
      int direction_index = directions[i];
      int direction;
      const char *direction_string = 0;
      if (direction_index < 0)
        {
          int name_idx = -direction_index - 2;
          direction_string = buttons_special_units_names[name_idx];
          direction = html_get_direction_index (self, direction_string);
          if (direction >= 0)
            direction_string = 0;
        }
      else
        direction = direction_index;

      new_button_specification (&result->list[i], BST_direction,
                        0, direction, direction_string, 0, 0);
    }
  return result;
}



static void
add_html_default_buttons_specifications (OPTIONS_LIST *options, CONVERTER *self)
{
  add_new_button_option (options, "LINKS_DIRECTIONS",
                                    new_base_links_buttons (self));

  add_new_button_option (options, "SECTION_BUTTONS",
                                    new_base_navigation_section_buttons (self));
  add_new_button_option (options, "SECTION_FOOTER_BUTTONS",
                           new_base_navigation_section_footer_buttons (self));
  add_new_button_option (options, "NODE_FOOTER_BUTTONS",
           new_base_navigation_buttons (self, BFT_type_panel_node_footer, 0));
  add_new_button_option (options, "CHAPTER_BUTTONS",
                                    new_base_navigation_section_buttons (self));
  add_new_button_option (options, "MISC_BUTTONS",
      new_directions_list_buttons_specifications (self, DEFAULT_MISC_BUTTONS));
  add_new_button_option (options, "TOP_BUTTONS",
                                    new_base_navigation_section_buttons (self));
  add_new_button_option (options, "CHAPTER_FOOTER_BUTTONS",
                          new_base_navigation_section_footer_buttons (self));
  add_new_button_option (options, "TOP_FOOTER_BUTTONS",
                            new_base_navigation_section_footer_buttons (self));
}

static void
add_texi2html_default_buttons_specifications (OPTIONS_LIST *options,
                                              CONVERTER *self)
{
  add_new_button_option (options, "SECTION_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_SECTION_BUTTONS));

  add_new_button_option (options, "TOP_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_TOP_BUTTONS));

  add_new_button_option (options, "TOP_FOOTER_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_TOP_BUTTONS));

  add_new_button_option (options, "MISC_BUTTONS",
      new_directions_list_buttons_specifications (self, DEFAULT_MISC_BUTTONS));

  add_new_button_option (options, "CHAPTER_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_CHAPTER_BUTTONS));

  add_new_button_option (options, "SECTION_FOOTER_BUTTONS",
 new_directions_list_buttons_specifications (self, T2H_SECTION_FOOTER_BUTTONS));

  add_new_button_option (options, "CHAPTER_FOOTER_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_CHAPTER_BUTTONS));

  add_new_button_option (options, "NODE_FOOTER_BUTTONS",
      new_directions_list_buttons_specifications (self, T2H_SECTION_BUTTONS));
}

/* equivalent of Texinfo::Convert::HTML %defaults */
OPTIONS_LIST *html_default_options;

/* Should be called once.  Same as setting %defaults in Perl */
void
html_default_options_setup (void)
{
  if (!html_default_options)
    {
      html_default_options = (OPTIONS_LIST *) malloc (sizeof (OPTIONS_LIST));
      initialize_options_list (html_default_options);
      add_html_converter_regular_options_defaults (html_default_options);
      add_html_default_buttons_specifications (html_default_options, 0);
    }
}

/* ALTIMP Texinfo::Convert::HTML::converter_defaults */
CONVERTER_INITIALIZATION_INFO *
html_converter_defaults (enum converter_format format,
                         const CONVERTER_INITIALIZATION_INFO *conf)
{
  CONVERTER_INITIALIZATION_INFO *format_defaults
    = new_converter_initialization_info ();

  copy_options_list (&format_defaults->conf, html_default_options);

  if (conf)
    {
      if (conf->conf.options->TEXI2HTML.o.integer > 0)
        {
          add_texi2html_regular_options_defaults (&format_defaults->conf);
          add_texi2html_default_buttons_specifications
                                        (&format_defaults->conf, 0);
        }
    }
  return format_defaults;
}

