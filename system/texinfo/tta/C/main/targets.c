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
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

#include <config.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#include "tree_types.h"
#include "document_types.h"
/* fatal */
#include "base_utils.h"
#include "tree.h"
#include "errors.h"
#include "debug.h"
#include "builtin_commands.h"
#include "extra.h"
#include "hashmap.h"
/* for get_label_element */
#include "utils.h"
#include "convert_to_texinfo.h"
/* for retrieve_document */
#include "document.h"
#include "targets.h"

size_t identifiers_target_number (const struct C_HASHMAP *identifiers_target)
{
  if (identifiers_target)
    return (c_hashmap_count (identifiers_target));

  return 0;
}

ELEMENT *
find_identifier_target (const struct C_HASHMAP *identifiers_target,
                        const char *normalized)
{
  int found;
  ELEMENT *result;

  /* discard const */
  result = (ELEMENT *)c_hashmap_value (identifiers_target, normalized, &found);

  return result;
}

/* unused */
int
compare_labels (const void *a, const void *b)
{
  const LABEL *label_a = (const LABEL *) a;
  const LABEL *label_b = (const LABEL *) b;

  if (label_a->identifier != 0 && label_b->identifier != 0)
    {
      int result = strcmp (label_a->identifier, label_b->identifier);
      if (result != 0)
        return result;
    }
  else if (label_a->identifier)
    return -1;
  else if (label_b->identifier)
    return 1;

  if (label_a->label_number < label_b->label_number)
    return -1;
  else
    return 1;
}

void
register_label_in_list (LABEL_LIST *labels_list, ELEMENT *element,
                        const char *normalized)
{
  LABEL *label;

  if (labels_list->number == labels_list->space)
   {
      labels_list->space += 1;
      labels_list->space *= 1.5;
      labels_list->list = realloc (labels_list->list,
                                   labels_list->space * sizeof (LABEL));
      if (!labels_list->list)
        fatal ("realloc failed");
    }
  label = &labels_list->list[labels_list->number];

  label->element = element;
  label->label_number = labels_list->number;
  label->identifier = normalized;
  label->reference = 0;

  labels_list->number++;
}

/* *STATUS 0 means success, 1 or 2 means error */
static const char *
add_element_to_identifiers_target (DOCUMENT *document, ELEMENT *element,
                                   int *status)
{
  const char *normalized = lookup_extra_string (element, AI_key_normalized);

  if (normalized)
    {
      C_HASHMAP *identifiers_target = &document->identifiers_target;
      const ELEMENT *target = find_identifier_target (identifiers_target,
                                                      normalized);
      if (!target)
        {
          element->flags |= EF_is_target;

          c_hashmap_register (identifiers_target, normalized,
                              element);

          document->modified_information |= F_DOCM_identifiers_target;

          *status = 0;
        }
      else
        *status = 1;
    }
  else
    *status = 2;
  return normalized;
}

/* NOTE this function cannot currently be called as the code calling
   register_label_element makes sure that there is no preexisting
   target element with the same normalized identifier.
   */
static void
existing_label_error (const DOCUMENT *document, const ELEMENT *element,
                      const char *normalized,
                      ERROR_MESSAGE_LIST *error_messages)
{
  if (normalized && error_messages)
    {
      ELEMENT *existing_target
        = find_identifier_target (&document->identifiers_target, normalized);
      const ELEMENT *label_element = get_label_element (element);
      char *label_element_texi = convert_contents_to_texinfo (label_element);
      message_list_command_error (error_messages,
            (document->options && document->options->DEBUG.o.integer > 0),
                     element, "@%s `%s' previously defined",
                     builtin_command_name (element->e.c->cmd),
                     label_element_texi);
      message_list_line_error_ext (error_messages,
            (document->options && document->options->DEBUG.o.integer > 0),
                      MSG_error, 1, &existing_target->e.c->source_info,
                      "here is the previous definition as @%s",
                      builtin_command_name (existing_target->e.c->cmd));
      free (label_element_texi);
    }
}

/* return value is 1 for success, 0 for failure */
int
register_label_element (DOCUMENT *document, ELEMENT *element,
                        ERROR_MESSAGE_LIST *error_messages)
{
  int status;

  const char *normalized
     = add_element_to_identifiers_target (document, element, &status);
  if (status)
    {
      existing_label_error (document, element, normalized, error_messages);
    }

  register_label_in_list (&document->labels_list, element,
                          normalized);
  document->modified_information |= F_DOCM_labels_list;

  return !status;
}

