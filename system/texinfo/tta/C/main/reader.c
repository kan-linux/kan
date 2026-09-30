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

/* ALTIMP perl/Texinfo/ReaderNonXS.pm */

#include <config.h>

#include <sys/types.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "reader_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "types_data.h"
#include "reader_api.h"
#include "tree.h"
#include "debug.h"
#include "base_utils.h"
#include "reader.h"


static READER **reader_list;
static size_t reader_number;
static size_t reader_space;

static READER *
allocate_reader (void)
{
  READER *new_reader = (READER *) malloc (sizeof (READER));
  ELEMENT_LIST *sequence = new_list();

  new_reader->top = 0;
  new_reader->space = 4;
  new_reader->stack = (READER_CONTEXT *)
    malloc (sizeof (READER_CONTEXT) * new_reader->space);
  memset (new_reader->stack, 0, sizeof (READER_CONTEXT) * new_reader->space);

  new_reader->stack[0].sequence = sequence;

  return new_reader;
}

/* The DOCUMENT is not used, it is only stored in the reader, such that
   it is possible to get it back later on.  This may be useful because
   there is no easy way to obtain the document from the tree.
 */
static void
initialize_reader (READER *reader, ELEMENT *tree, DOCUMENT *document)
{
  reader->top = 1;
  reader->stack[0].index = -1;
  add_to_element_list (reader->stack[0].sequence, tree);

  reader->document = document;
}

/* Used in the readers list code.  May also be used for a reader outside
   of the list, in that case the reader should be destroyed by calling
   destroy_reader.
 */
static READER *
new_reader (ELEMENT *tree, DOCUMENT *document)
{
  READER *new_reader;

  if (!tree)
    return 0;

  new_reader = allocate_reader();

  initialize_reader (new_reader, tree, document);

  return new_reader;
}

/* Get a reader from the readers list.  Reader at each slot is allocated
   only once.  A reader is automatically re-usable at the end of a tree.
   The list and the allocated readers are never freed.
   Returns a reader descriptor that can be used to retrieve the reader.
 */
size_t
txi_register_new_reader (ELEMENT *tree, DOCUMENT *document)
{
  size_t i;

  if (!tree)
    return 0;

  for (i = 0; i < reader_number; i++)
    {
      if (reader_list[i]->top == 0)
        {
          /* reusable reader */
          initialize_reader (reader_list[i], tree, document);
          return i+1;
        }
    }

  if (reader_number == reader_space)
    {
      reader_list = realloc (reader_list,
                          (reader_space += 5) * sizeof (READER *));
      if (!reader_list)
        fatal ("realloc failed");
    }

  reader_list[reader_number] = new_reader (tree, document);

  reader_number++;

  return reader_number;
}

/* descriptor starts at 1, 0 is an error */
READER *
retrieve_reader_descriptor (size_t reader_descriptor)
{
  if (reader_descriptor <= reader_number
      && reader_list[reader_descriptor -1] != 0)
    return reader_list[reader_descriptor -1];
  return 0;
}

static void
push_reader_context (READER *reader)
{
  if (reader->top >= reader->space)
    {
      reader->stack = realloc (reader->stack,
                (reader->space += 2) * sizeof (READER_CONTEXT));
      memset (&reader->stack[reader->top], 0, 2 * sizeof (READER_CONTEXT));
    }
  reader->stack[reader->top].index = -1;
  reader->top++;
}

static void
pop_reader_context (READER *reader)
{
  reader->top--;
}

static READER_CONTEXT *
top_reader_context (READER *reader)
{
  if (reader->top == 0)
    return 0;
  return &reader->stack[reader->top -1];
}

/* NOTE that this functions takes care of resetting the reader when empty */
static const READER_TOKEN *
end_element (READER *reader)
{
  READER_TOKEN *token;
  READER_CONTEXT *top_context;

  pop_reader_context (reader);
  if (!reader->top)
    {
      /* reset reader, such that it may be reused for another tree */
      reader->stack[0].sequence->number = 0;
      return 0;
    }

  token = &reader->token;

  token->category = TXI_READ_ELEMENT_END;

  top_context = top_reader_context (reader);
  token->element
    = top_context->sequence->list[top_context->index];

  return token;
}

const READER_TOKEN *
txi_reader_read (READER *reader)
{
  READER_TOKEN *token = &reader->token;
  READER_CONTEXT *top_context;
  const ELEMENT *element;

  top_context = top_reader_context (reader);

  if (!top_context)
    return 0;

  top_context->index++;

  if (top_context->index +1 > (ssize_t) top_context->sequence->number)
    return end_element (reader);

  element = top_context->sequence->list[top_context->index];

  token->element = element;

  if (type_data[element->type].flags & TF_ignorable_text)
    {
      token->category = TXI_READ_IGNORABLE_TEXT;
    }
  else if (type_data[element->type].flags & TF_text)
    {
      token->category = TXI_READ_TEXT;
    }
  else
    {
      if (element->e.c->contents.number)
        {
          push_reader_context (reader);
          top_context = top_reader_context (reader);
          top_context->sequence = &element->e.c->contents;
          token->category = TXI_READ_ELEMENT_START;
        }
      else
        {
          token->category = TXI_READ_EMPTY;
        }
    }

  return token;
}


const READER_TOKEN *
txi_reader_skip_children (READER *reader, const ELEMENT *element)
{
  end_element (reader);

  if (element && reader->token.element != element)
    {
      char *end_element_str = print_element_debug (reader->token.element, 0);
      char *element_str = print_element_debug (element, 0);
      fprintf (stderr, "skip_children %p ne %p; %s;%s\n",
               reader->token.element, element, end_element_str,
               element_str);
      abort ();
      free (end_element_str);
      free (element_str);
    }

  return &reader->token;
}

static void
destroy_reader (READER *reader)
{
  destroy_list (reader->stack[0].sequence);
  free (reader->stack);
  free (reader);
}

CONST_ELEMENT_LIST *
txi_reader_collect_commands_list (ELEMENT *tree,
                                  const COMMAND_STACK *commands)
{
  CONST_ELEMENT_LIST *collected_commands_list = new_const_element_list ();

  READER *reader = new_reader (tree, 0);
  const READER_TOKEN *next;

  while (1)
    {
      next = txi_reader_read (reader);

      if (!next)
        break;

      if (next->category == TXI_READ_ELEMENT_START
          || next->category == TXI_READ_EMPTY)
        {
          size_t i;
          for (i = 0; i < commands->top; i++)
            {
              if (next->element->e.c->cmd == commands->stack[i])
                {
                  add_to_const_element_list (collected_commands_list,
                                             next->element);
                  break;
                }
            }
        }
    }
  destroy_reader (reader);

  return collected_commands_list;
}
