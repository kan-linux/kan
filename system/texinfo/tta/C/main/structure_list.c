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

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "document_types.h"
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
/* xasprintf */
#include "utils.h"
#include "convert_to_texinfo.h"
#include "debug.h"
/* root_command_element_string */
#include "manipulate_tree.h"
#include "api_to_perl.h"
#include "structure_list.h"

NODE_RELATIONS_LIST *
new_node_relations_list (void)
{
  NODE_RELATIONS_LIST *result = (NODE_RELATIONS_LIST *)
     malloc (sizeof (NODE_RELATIONS_LIST));
  memset (result, 0, sizeof (NODE_RELATIONS_LIST));
  return result;
}

CONST_NODE_RELATIONS_LIST *
new_const_node_relations_list (void)
{
  CONST_NODE_RELATIONS_LIST *result = (CONST_NODE_RELATIONS_LIST *)
     malloc (sizeof (CONST_NODE_RELATIONS_LIST));
  memset (result, 0, sizeof (CONST_NODE_RELATIONS_LIST));
  return result;
}

SECTION_RELATIONS_LIST *
new_section_relations_list (void)
{
  SECTION_RELATIONS_LIST *result = (SECTION_RELATIONS_LIST *)
     malloc (sizeof (SECTION_RELATIONS_LIST));
  memset (result, 0, sizeof (SECTION_RELATIONS_LIST));
  return result;
}

NODE_RELATIONS *
new_node_relations (ELEMENT *element)
{
  NODE_RELATIONS *node = (NODE_RELATIONS *) malloc (sizeof (NODE_RELATIONS));
  memset (node, 0, sizeof (NODE_RELATIONS));
  node->element = element;
  return node;
}

SECTION_RELATIONS *
new_section_relations (ELEMENT *element)
{
  SECTION_RELATIONS *section
    = (SECTION_RELATIONS *) malloc (sizeof (SECTION_RELATIONS));
  memset (section, 0, sizeof (SECTION_RELATIONS));
  section->element = element;
  return section;
}

HEADING_RELATIONS *
new_heading_relations (ELEMENT *element)
{
  HEADING_RELATIONS *heading
    = (HEADING_RELATIONS *) malloc (sizeof (HEADING_RELATIONS));
  memset (heading, 0, sizeof (HEADING_RELATIONS));
  heading->element = element;
  return heading;
}

/* Make sure there is space for at least one more element. */
#define setup_reallocate_relations_list(name, type) \
static void \
reallocate_##name##_relations_list (type##_RELATIONS_LIST *list) \
{ \
  if (list->number + 1 >= list->space) \
    { \
      list->space += 10; \
      list->list = realloc (list->list, \
                            list->space * sizeof (type##_RELATIONS *)); \
      if (!list->list) \
        fatal ("realloc failed"); \
    } \
}

setup_reallocate_relations_list(node,NODE)
setup_reallocate_relations_list(section,SECTION)
setup_reallocate_relations_list(heading,HEADING)

static void
reallocate_const_node_relations_list (CONST_NODE_RELATIONS_LIST *list)
{
  if (list->number + 1 >= list->space)
    {
      list->space += 10;
      list->list = realloc (list->list,
                            list->space * sizeof (const NODE_RELATIONS *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

void
reallocate_node_relations_for (size_t n, NODE_RELATIONS_LIST *list)
{
  if (list->number + n >= list->space)
    {
      list->space += n + 1;
      list->list = realloc (list->list,
                            list->space * sizeof (NODE_RELATIONS *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

const struct SECTION_RELATIONS **
new_section_directions (void)
{
  const SECTION_RELATIONS **result
      = (const SECTION_RELATIONS **) malloc ((D_up + 1)
                          * sizeof (const SECTION_RELATIONS *));
  memset (result, 0, (D_up + 1) * sizeof (const SECTION_RELATIONS *));
  return result;
}

void
add_to_node_relations_list (NODE_RELATIONS_LIST *list,
                            NODE_RELATIONS *node_relations)
{
  /* NOTE there could be theoretically an overflow if
     list->number + 1 > SIZE_MAX.  The numbers are big, this is unlikely
     to happen */
  reallocate_node_relations_list (list);

  list->list[list->number++] = node_relations;
}

void
add_to_const_node_relations_list (CONST_NODE_RELATIONS_LIST *list,
                                  const NODE_RELATIONS *node_relations)
{
  /* NOTE there could be theoretically an overflow if
     list->number + 1 > SIZE_MAX.  The numbers are big, this is unlikely
     to happen */
  reallocate_const_node_relations_list (list);

  list->list[list->number++] = node_relations;
}

NODE_RELATIONS *
add_node_to_node_relations_list (NODE_RELATIONS_LIST *list, ELEMENT *e)
{
  NODE_RELATIONS *node_relations = new_node_relations (e);

  add_to_node_relations_list (list, node_relations);

  return node_relations;
}

void
add_to_section_relations_list (SECTION_RELATIONS_LIST *list,
                               SECTION_RELATIONS *section_relations)
{
  reallocate_section_relations_list (list);

  list->list[list->number++] = section_relations;
}

SECTION_RELATIONS *
add_section_to_section_relations_list (SECTION_RELATIONS_LIST *list,
                                       ELEMENT *e)
{
  SECTION_RELATIONS *section = new_section_relations (e);

  add_to_section_relations_list (list, section);

  return section;
}

HEADING_RELATIONS *
add_heading_to_heading_relations_list (HEADING_RELATIONS_LIST *list,
                                       ELEMENT *e)
{
  HEADING_RELATIONS *heading = new_heading_relations (e);
  reallocate_heading_relations_list (list);

  list->list[list->number++] = heading;

  return heading;
}

/* Add a node relations for the element E into the LIST at index WHERE. */
NODE_RELATIONS *
insert_node_into_node_relations_list (NODE_RELATIONS_LIST *list,
                                      ELEMENT *e, size_t where)
{
  NODE_RELATIONS *node = new_node_relations (e);
  reallocate_node_relations_list (list);

  if (where > list->number)
    fatal ("elements list index out of bounds");

  memmove (&list->list[where + 1], &list->list[where],
           (list->number - where) * sizeof (NODE_RELATIONS *));
  list->list[where] = node;
  list->number++;

  return node;
}

SECTION_RELATIONS *
insert_section_into_section_relations_list (SECTION_RELATIONS_LIST *list,
                                             ELEMENT *e, size_t where)
{
  SECTION_RELATIONS *section = new_section_relations (e);
  reallocate_section_relations_list (list);

  if (where > list->number)
    fatal ("elements list index out of bounds");

  memmove (&list->list[where + 1], &list->list[where],
           (list->number - where) * sizeof (SECTION_RELATIONS *));
  list->list[where] = section;
  list->number++;

  return section;
}

void
free_node_relations_list (NODE_RELATIONS_LIST *list)
{
  size_t i;
  for (i = 0; i < list->number; i++)
    {
      NODE_RELATIONS *node_relations = list->list[i];
      if (node_relations->menus)
        destroy_const_element_list (node_relations->menus);
      free (node_relations->node_directions);
      if (node_relations->hv)
        unregister_perl_data (node_relations->hv);
      free (node_relations);
    }
  free (list->list);
}

void
destroy_node_relations_list (NODE_RELATIONS_LIST *list)
{
  free_node_relations_list (list);
  free (list);
}

void
free_section_relations_list (SECTION_RELATIONS_LIST *list)
{
  size_t i;
  for (i = 0; i < list->number; i++)
    {
      SECTION_RELATIONS *section_relations = list->list[i];
      free (section_relations->section_directions);
      free (section_relations->toplevel_directions);
      if (section_relations->section_children)
        {
          free (section_relations->section_children->list);
          free (section_relations->section_children);
        }
      if (section_relations->hv)
        unregister_perl_data (section_relations->hv);
      free (section_relations);
    }
  free (list->list);
}

void
free_heading_relations_list (HEADING_RELATIONS_LIST *list)
{
  size_t i;
  for (i = 0; i < list->number; i++)
    {
      HEADING_RELATIONS *heading_relations = list->list[i];
      if (heading_relations->hv)
        unregister_perl_data (heading_relations->hv);
      free (heading_relations);
    }
  free (list->list);
}

static char *
print_root_command (const ELEMENT *element)
{
  ELEMENT *argument_line = element->e.c->contents.list[0];
  if (argument_line->e.c->contents.number > 0)
    {
      ELEMENT *line_arg = argument_line->e.c->contents.list[0];
      if (line_arg->e.c->contents.number > 0)
        {
          char *root_command_texi
            = convert_contents_to_texinfo (line_arg);
          return root_command_texi;
        }
    }
  return 0;
}

/* used in t/X.t tests */
#define SECTION_RELS_PRINT_KEY(name) \
      if (relations->name) \
        { \
          char *value \
            = root_command_element_string (relations->name->element); \
          if (value) \
            { \
              text_printf (result, " " #name ": %s", \
                           value); \
              free (value); \
            } \
          else \
            text_append (result, " " #name); \
          text_append_n (result, "\n", 1); \
        }

static void
print_sections_directions (TEXT *result,
                           const SECTION_RELATIONS * const *directions)
{
  size_t d;
  for (d = 0; d < directions_length; d++)
    {
      if (directions[d])
        {
          const char *d_key = direction_names[d];
          const ELEMENT *e = directions[d]->element;
          char *element_str = print_root_command (e);
          if (!element_str)
            /* not sure that it may happen */
            text_printf (result, "  %s->\n", d_key);
          else
            {
              text_printf (result, "  %s->%s\n", d_key, element_str);
              free (element_str);
            }
        }
    }
}

static void
print_section_relations_info_internal (const SECTION_RELATIONS *relations,
                                       size_t i, TEXT *result)
{
  const ELEMENT *element = relations->element;
  char *root_command_texi = print_root_command (element);
  if (!root_command_texi)
    text_printf (result, "%zu", i+1);
  else
    {
      text_printf (result, "%zu|%s", i+1, root_command_texi);
      free (root_command_texi);
    }
  text_append_n (result, "\n", 1);

  SECTION_RELS_PRINT_KEY(associated_anchor_command)
  SECTION_RELS_PRINT_KEY(associated_node)
  SECTION_RELS_PRINT_KEY(part_following_node)
  SECTION_RELS_PRINT_KEY(associated_part)
  SECTION_RELS_PRINT_KEY(part_associated_section)
  if (relations->section_directions)
    {
      text_append_n (result, " section_directions:\n", 21);
      print_sections_directions (result, relations->section_directions);
    }
  if (relations->toplevel_directions)
    {
      text_append_n (result, " toplevel_directions:\n", 22);
      print_sections_directions (result, relations->toplevel_directions);
    }
  if (relations->section_children)
    {
      size_t j;
      const char *key = "section_children";
      text_printf (result, " %s:\n", key);
      for (j = 0; j < relations->section_children->number; j++)
        {
          const ELEMENT *element
            = relations->section_children->list[j]->element;
          char *section_texi = print_root_command (element);
          text_printf (result, "  %zu|", j+1);
          if (section_texi)
            {
              text_append (result, section_texi);
              free (section_texi);
            }
          text_append_n (result, "\n", 1);
        }
    }
}

char *
print_sections_list (const DOCUMENT *document)
{
  size_t i;

  TEXT result;

  text_init (&result);
  text_append (&result, "");

  for (i = 0; i < document->sections_list.number; i++)
    {
      const SECTION_RELATIONS *relations
        = document->sections_list.list[i];
      print_section_relations_info_internal (relations, i, &result);
    }

  return result.text;
}

char *
print_sectioning_root (const DOCUMENT *document)
{
  size_t i;
  const SECTIONING_ROOT *sectioning_root = document->sectioning_root;
  const SECTION_RELATIONS_LIST *section_children;

  TEXT result;

  text_init (&result);
  text_append (&result, "");

  if (!sectioning_root)
    return result.text;

  section_children = &sectioning_root->section_children;

  text_printf (&result, "level: %d\n", sectioning_root->section_root_level);

  text_append_n (&result, "list:\n", 6);

  for (i = 0; i < section_children->number; i++)
    {
      const ELEMENT *section = section_children->list[i]->element;
      char *section_texi = print_root_command (section);
      text_printf (&result, " %zu|", i+1);
      if (section_texi)
        {
          text_append (&result, section_texi);
          free (section_texi);
        }
      text_append_n (&result, "\n", 1);
    }

  return result.text;
}

static char *
print_line_command (const ELEMENT *element)
{
  if (builtin_command_data[element->e.c->cmd].flags & CF_root)
    return root_command_element_string (element);
  else
    {
      const ELEMENT *line_arg = element->e.c->contents.list[0];
      if (line_arg->e.c->contents.number > 0)
        {
          char *result;
          char *root_command_texi
            = convert_contents_to_texinfo (line_arg);
          xasprintf (&result , "@%s %s",
                     builtin_command_name (element->e.c->cmd),
                     root_command_texi);
          free (root_command_texi);
          return result;
        }
      return 0;
    }
}

static void
print_line_command_key_element (TEXT *result, const char *key,
                                const ELEMENT *element)
{
  char *line_command_text = print_line_command(element);
  if (!line_command_text)
    text_printf (result, " %s", key);
  else
    {
      text_printf (result, " %s: %s", key, line_command_text);
      free (line_command_text);
    }
}

static char *
print_menu_node (const ELEMENT *element)
{
  if (element->e.c->cmd == CM_node)
    return print_root_command (element);
  else if (element->e.c->cmd)
    {
      const ELEMENT *line_arg = element->e.c->contents.list[0];
      if (line_arg->e.c->contents.number > 0)
        {
          return convert_contents_to_texinfo (line_arg);
        }
    }

  return (convert_to_texinfo (element));
}

static void
print_nodes_directions (TEXT *result, const ELEMENT * const *directions)
{
  size_t d;
  for (d = 0; d < directions_length; d++)
    {
      if (directions[d])
        {
          const char *d_key = direction_names[d];
          const ELEMENT *e = directions[d];
          char *element_str = print_menu_node (e);
          if (!element_str)
            /* not sure that it may happen */
            text_printf (result, "  %s->\n", d_key);
          else
            {
              text_printf (result, "  %s->%s\n", d_key, element_str);
              free (element_str);
            }
        }
    }
}

static void
print_node_relations_info_internal (const NODE_RELATIONS *relations,
                                    size_t i, TEXT *result)
{
  const ELEMENT *element = relations->element;
  char *root_command_texi = print_root_command (element);
  if (!root_command_texi)
    text_printf (result, "%zu", i+1);
  else
    {
      text_printf (result, "%zu|%s", i+1, root_command_texi);
      free (root_command_texi);
    }
  text_append_n (result, "\n", 1);

  SECTION_RELS_PRINT_KEY(associated_section)
  SECTION_RELS_PRINT_KEY(node_preceding_part)

  if (relations->associated_title_command)
    {
      print_line_command_key_element (result, "associated_title_command",
                             relations->associated_title_command);
      text_append_n (result, "\n", 1);
    }
  if (relations->node_description)
    {
      print_line_command_key_element (result, "node_description",
                             relations->node_description);
      text_append_n (result, "\n", 1);
    }
  if (relations->node_long_description)
    {
      const char *command_key = "node_long_description";
      const ELEMENT *command_element = relations->node_long_description;
      text_printf (result, " %s: @%s", command_key,
                   builtin_command_name (command_element->e.c->cmd));
      text_append_n (result, "\n", 1);
    }

  if (relations->menus && relations->menus->number)
    {
      text_append_n (result, " menus:\n", 8);
      size_t j;
      for (j = 0; j < relations->menus->number; j++)
        {
          const ELEMENT *menu = relations->menus->list[j];

          size_t k;
          for (k = 0; k < menu->e.c->contents.number; k++)
            {
              const ELEMENT *menu_content = menu->e.c->contents.list[k];
              if (menu_content->type == ET_menu_entry)
                {
                  size_t l;
                  for (l = 0; l < menu_content->e.c->contents.number; l++)
                    {
                      const ELEMENT *content
                        = menu_content->e.c->contents.list[l];
                      if (content->type == ET_menu_entry_node)
                        {
                          /* This is only supposed to identify the menu */
                          char *node_menu_entry_texi
                            = convert_to_texinfo (content);
                          text_printf (result, "  %s\n",
                                       node_menu_entry_texi);
                          free (node_menu_entry_texi);
                        }
                    }
                }
            }
        }
    }
  if (relations->node_directions)
    {
      text_append_n (result, " node_directions:\n", 18);
      print_nodes_directions (result, relations->node_directions);
    }
}

char *
print_nodes_list (const DOCUMENT *document)
{
  size_t i;

  TEXT result;

  text_init (&result);
  text_append (&result, "");

  for (i = 0; i < document->nodes_list.number; i++)
    {
      const NODE_RELATIONS *relations
        = document->nodes_list.list[i];
      print_node_relations_info_internal (relations, i, &result);
    }

  return result.text;
}

static void
print_heading_relations_info_internal (const HEADING_RELATIONS *relations,
                                       size_t i, TEXT *result)
{
  const ELEMENT *element = relations->element;
  const ELEMENT *line_arg = element->e.c->contents.list[0];
  char *root_command_texi = 0;

  if (line_arg->e.c->contents.number > 0)
    root_command_texi = convert_contents_to_texinfo (line_arg);

  if (!root_command_texi)
    text_printf (result, "%zu", i+1);
  else
    {
      text_printf (result, "%zu|%s", i+1, root_command_texi);
      free (root_command_texi);
    }
  text_append_n (result, "\n", 1);

  SECTION_RELS_PRINT_KEY(associated_anchor_command)
}

char *
print_headings_list (const DOCUMENT *document)
{
  size_t i;

  TEXT result;

  text_init (&result);
  text_append (&result, "");

  for (i = 0; i < document->headings_list.number; i++)
    {
      const HEADING_RELATIONS *relations
        = document->headings_list.list[i];
      print_heading_relations_info_internal (relations, i, &result);
    }

  return result.text;
}

#undef SECTION_RELS_PRINT_KEY
