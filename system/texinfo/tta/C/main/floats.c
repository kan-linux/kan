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
#include <stdio.h>

#include "text.h"
#include "tree_types.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
#include "utils.h"
#include "node_name_normalization.h"
#include "convert_to_texinfo.h"
#include "floats.h"

char *
parse_float_type (ELEMENT *current, ELEMENT *element)
{
  char *normalized;
  normalized = convert_to_normalized (element);
  add_extra_string (current, AI_key_float_type, normalized);
  return normalized;
}

void
add_to_float_record_list (FLOAT_RECORD_LIST *float_records, const char *type,
                          ELEMENT *element,
                          const SECTION_RELATIONS *section_relations)
{
  if (float_records->number == float_records->space)
    {
      float_records->list
               = realloc (float_records->list,
                          (float_records->space += 5) * sizeof (FLOAT_RECORD));
    }
  /* string stored in element extra */
  float_records->list[float_records->number].type = type;
  float_records->list[float_records->number].element = element;
  float_records->list[float_records->number].section = section_relations;
  float_records->number++;
}

static LISTOFFLOATS_TYPE *
find_float_type (LISTOFFLOATS_TYPE_LIST *listoffloats_list,
                 const char *float_type)
{
  size_t i;
  for (i = 0; i < listoffloats_list->number; i++)
    {
      LISTOFFLOATS_TYPE *listoffloats = &listoffloats_list->float_types[i];
      if (!strcmp (listoffloats->type, float_type))
        return listoffloats;
    }
  return 0;
}

static LISTOFFLOATS_TYPE *
add_to_listoffloats_list (LISTOFFLOATS_TYPE_LIST *listoffloats_list,
                          const char *type)
{
  LISTOFFLOATS_TYPE *result = find_float_type (listoffloats_list, type);

  if (result)
    return result;

  if (listoffloats_list->number == listoffloats_list->space)
    {
      listoffloats_list->float_types
               = realloc (listoffloats_list->float_types,
                  (listoffloats_list->space += 5) * sizeof (LISTOFFLOATS_TYPE));
    }

  result = &listoffloats_list->float_types[listoffloats_list->number];
  memset (result, 0, sizeof (LISTOFFLOATS_TYPE));
  result->type = strdup (type);

  listoffloats_list->number++;

  return result;
}

static FLOAT_INFORMATION *
add_to_float_information_list (FLOAT_INFORMATION_LIST *float_list,
                               ELEMENT *float_element,
                               const SECTION_RELATIONS *float_section)
{
  FLOAT_INFORMATION *result;
  if (float_list->number == float_list->space)
    {
      float_list->list
               = realloc (float_list->list,
                  (float_list->space += 5) * sizeof (FLOAT_INFORMATION));
    }

  result = &float_list->list[float_list->number];
  memset (result, 0, sizeof (FLOAT_INFORMATION));

  result->float_element = float_element;
  result->float_section = float_section;

  float_list->number++;

  return result;
}

static int
compare_listoffloats_type (const void *a, const void *b)
{
  const LISTOFFLOATS_TYPE *loft_a = (const LISTOFFLOATS_TYPE *) a;
  const LISTOFFLOATS_TYPE *loft_b = (const LISTOFFLOATS_TYPE *) b;

  return strcmp (loft_a->type, loft_b->type);
}

void
float_list_to_listoffloats_list (const FLOAT_RECORD_LIST *floats_list,
                                 LISTOFFLOATS_TYPE_LIST *result)
{
  size_t i;

  for (i = 0; i < floats_list->number; i++)
    {
      const FLOAT_RECORD *float_record = &floats_list->list[i];
      const char *float_type = float_record->type;

      LISTOFFLOATS_TYPE *listoffloats_type
        = add_to_listoffloats_list (result, float_type);

      add_to_float_information_list (&listoffloats_type->float_list,
                                     float_record->element,
                                     float_record->section);
    }

  qsort (result->float_types, result->number,
         sizeof (LISTOFFLOATS_TYPE), compare_listoffloats_type);

}

void
free_listoffloats_list (LISTOFFLOATS_TYPE_LIST *listoffloats_list)
{
  size_t i;
  for (i = 0; i < listoffloats_list->number; i++)
    {
      LISTOFFLOATS_TYPE *listoffloats_type
         = &listoffloats_list->float_types[i];
      free (listoffloats_type->type);
      free (listoffloats_type->float_list.list);
    }
  free (listoffloats_list->float_types);
}

static void
print_indented (const char *text, TEXT *result)
{
  const char *p = text;

  while (1)
    {
      const char *q = strchr (p, '\n');
      if (q)
        {
          text_append_n (result, p, q +1 - p);
          if (*(q+1))
            {
              text_append_n (result, "   ", 3);
              p = q + 1;
            }
          else
            return;
        }
      else
        {
          text_append (result, p);
          text_append_n (result, "\n", 1);
          return;
        }
    }
}

/* ALTIMP perl/Texinfo/ManipulateTree.pm */
static void
print_caption_shortcaption (const ELEMENT *element, const ELEMENT *float_e,
                            const char *caption_type,
                            const char *type, const char *float_number,
                            TEXT *result)
{
  char *caption_texi = 0;
  const ELEMENT *caption_float;

  if (element->e.c->contents.number > 0)
    caption_texi = convert_to_texinfo (element->e.c->contents.list[0]);

  caption_float = element->e.c->parent;
  if (!caption_float || caption_float != float_e)
    fprintf (stderr, "BUG: @%s %s; %s: caption_float != float_e: %s\n",
                     builtin_command_name (element->e.c->cmd),
                     type, float_number, caption_texi);

  if (caption_texi && strlen (caption_texi))
    {
      text_printf (result, "  %s: ", caption_type);
      print_indented (caption_texi, result);
    }
  else
    text_printf (result, "  %s(E)\n", caption_type);

  free (caption_texi);
}

/* ALTIMP perl/Texinfo/ManipulateTree.pm */
/* this should be mainly to verify listoffloats types, association with
   floats.  The captions are there mainly to identify floats */
/* The list should already be sorted in float_list_to_listoffloats_list */
/* Used in tests */
char *
print_listoffloats_types (LISTOFFLOATS_TYPE_LIST *listoffloats_list)
{
  TEXT result;

  if (listoffloats_list->number == 0)
    return 0;

  text_init (&result);
  text_append (&result, "");

  size_t i;
  for (i = 0; i < listoffloats_list->number; i++)
    {
      size_t j;
      LISTOFFLOATS_TYPE *listoffloats_type
         = &listoffloats_list->float_types[i];
      text_printf (&result, "%s: %zu\n", listoffloats_type->type,
                   listoffloats_type->float_list.number);

      for (j = 0; j < listoffloats_type->float_list.number; j++)
        {
          const FLOAT_INFORMATION *float_info
            = &listoffloats_type->float_list.list[j];
          const ELEMENT *float_e = float_info->float_element;
          const ELEMENT *caption_shortcaption[2];
          const ELEMENT *caption;
          const ELEMENT *shortcaption;
          const char *float_number
            = lookup_extra_string (float_e, AI_key_float_number);
          const char *float_normalized
            = lookup_extra_string (float_e, AI_key_normalized);
          const char *float_type
            = lookup_extra_string (float_e, AI_key_float_type);

          if (!float_type || strcmp (float_type, listoffloats_type->type))
            {
              fprintf (stderr,
                       "BUG: %s: listoffloats != float type '%s' (%s;%s)\n",
                       listoffloats_type->type, float_type, float_normalized,
                       float_number);
              continue;
            }

          find_float_caption_shortcaption(float_e, caption_shortcaption);

          caption = caption_shortcaption[0];
          shortcaption = caption_shortcaption[1];

          text_append_n (&result, " F", 2);
          if (float_number)
            text_printf (&result, "%s:", float_number);
          if (float_normalized)
            text_printf (&result, " {%s}", float_normalized);
          text_append_n (&result, "\n", 1);

          if (shortcaption)
            {
              print_caption_shortcaption (shortcaption, float_e, "S",
                                          listoffloats_type->type,
                                          float_number, &result);
            }
          if (caption)
            {
              print_caption_shortcaption (caption, float_e, "C",
                                          listoffloats_type->type,
                                          float_number, &result);
            }
        }
    }

  return result.text;
}
