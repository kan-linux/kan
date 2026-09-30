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
#include <string.h>
#include <stdio.h>
#include <stddef.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "command_ids.h"
#include "element_types.h"
#include "types_data.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
/* for associated_info_table find_associated_info_key
   add_to_element_list */
#include "tree.h"
/* for lookup_extra */
#include "extra.h"
/* for element_command_name */
#include "builtin_commands.h"
/* for debugging */
#include "debug.h"
/* build_key_pair_info */
#include "build_perl_info.h"
/* get_sv_document_document */
#include "get_perl_info.h"


/* return the handle if the element is registered by the call,
   not if it was already registered */
size_t
register_sv_element_handle_in_sv (ELEMENT *element, SV *element_sv,
                                  DOCUMENT *document)
{
  HV *element_hv;
  SV **element_document_descriptor_sv;
  SV **handle_sv;
  const char *document_key = "element_document_descriptor";
  const char *handle_key = "_handle";

  dTHX;

  element_hv = (HV *) SvRV (element_sv);

  element_document_descriptor_sv
    = hv_fetch (element_hv, document_key, strlen (document_key), 0);

  if (!element_document_descriptor_sv)
    {
      hv_store (element_hv, document_key, strlen (document_key),
                newSViv (document->descriptor), 0);
    }

  handle_sv = hv_fetch (element_hv, handle_key, strlen(handle_key), 0);
  if (!handle_sv)
    {
      add_to_element_list (&document->element_handles, element);
      hv_store (element_hv, handle_key, strlen(handle_key),
                newSViv (document->element_handles.number), 0);
      return document->element_handles.number;
    }
  return 0;
}

size_t
register_element_handle_in_sv (ELEMENT *element, DOCUMENT *document)
{
  size_t number;

  dTHX;

  build_new_base_element (element);

  number = register_sv_element_handle_in_sv (element, element->sv, document);

  return number;
}

/* In this function, elements handles only are registered, with
   register_element_handle_in_sv */
SV *
build_element_attribute (const ELEMENT *element, const char *attribute,
                         DOCUMENT *document)
{
  enum ai_key_name key;

  dTHX;

  key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_string:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return newSVpv_utf8 (k->k.string, 0);
          break;
          }
        case extra_integer:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return newSViv (k->k.integer);
          break;
          }
        case extra_flag:
          {
          if (element->flags & associated_info_table[key].data)
            return newSViv (1);
          break;
          }
        case extra_element_info:
          {
          int idx = associated_info_table[key].data;
          if (idx < type_data[element->type].elt_info_number
              && element->elt_info[idx])
            {
              ELEMENT *info_element = element->elt_info[idx];
              register_element_handle_in_sv (info_element, document);
              return newSVsv ((SV *)info_element->sv);
            }
          break;
          }
        case extra_misc_args:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return build_extra_misc_args (k->k.strings_list);
          break;
          }
        case extra_index_entry:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return build_extra_index_entry (k->k.index_entry);
          break;
          }
        case extra_element_oot:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            {
              ELEMENT *oot_element = k->k.element;
              register_element_handle_in_sv (oot_element, document);
              return newSVsv ((SV *)oot_element->sv);
            }
          break;
          }
        case extra_string_info:
          {
          int idx = associated_info_table[key].data;
          switch (key)
            {
            case AI_key_delimiter:
              if (element->e.c->cmd == CM_verb
                  && element->e.c->string_info[idx])
                return newSVpv_utf8 (element->e.c->string_info[idx], 0);
              break;
            case AI_key_alias_of:
              if ((element->e.c->cmd
                   || type_data[element->type].flags & TF_with_command)
                  && element->e.c->string_info[idx])
                return newSVpv_utf8 (element->e.c->string_info[idx], 0);
              break;
            default:
              break;
            }
          break;
          }
        default:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return build_key_pair_info (k, 0);
          break;
          }
        }
    }

  return 0;
}

static void
register_document_sections_list_elements (DOCUMENT *document)
{
  size_t i;
  const SECTION_RELATIONS_LIST *list = &document->sections_list;

  for (i = 0; i < list->number; i++)
    {
      /* cast to drop const */
      register_element_handle_in_sv ((ELEMENT *)list->list[i]->element,
                                     document);
    }
}

static void
register_document_nodes_list_elements (DOCUMENT *document)
{
  size_t i;
  const NODE_RELATIONS_LIST *list = &document->nodes_list;

  for (i = 0; i < list->number; i++)
    {
      /* cast to drop const */
      NODE_RELATIONS *node_relation = list->list[i];
      register_element_handle_in_sv ((ELEMENT *)node_relation->element,
                                     document);
      /* this is probably unneeded, as all the headings and sections
         elements should be registered as part of their lists */
      if (node_relation->associated_title_command)
        register_element_handle_in_sv (
                  (ELEMENT *)node_relation->associated_title_command,
                                       document);
      if (node_relation->node_description)
        register_element_handle_in_sv (
                  (ELEMENT *)node_relation->node_description,
                                       document);
      if (node_relation->node_long_description)
        register_element_handle_in_sv (
                  (ELEMENT *)node_relation->node_long_description,
                                       document);
      if (node_relation->menus)
        {
          size_t j;
          CONST_ELEMENT_LIST *menus = node_relation->menus;
          for (j = 0; j < menus->number; j++)
            register_element_handle_in_sv ((ELEMENT *)menus->list[j],
                                           document);
        }
    }
}

static void
register_document_headings_list_elements (DOCUMENT *document)
{
  const HEADING_RELATIONS_LIST *list = &document->headings_list;
  size_t i;
  for (i = 0; i < list->number; i++)
    {
      /* cast to drop const */
      register_element_handle_in_sv ((ELEMENT *)list->list[i]->element,
                                     document);
    }
}

/* to register elements when the document information is already built */

void
register_document_relations_lists_elements (SV *converter, SV *document_in)
{
  DOCUMENT *document = get_sv_document_document (document_in,
                     "register_document_relations_lists_elements");

  if (document)
    {
       /* TODO separate function?  Change this function name? */
       register_element_handle_in_sv (document->tree, document);

       register_document_sections_list_elements (document);
       register_document_nodes_list_elements (document);
       register_document_headings_list_elements (document);
    }
}

/* to be used with TreeElements interface.  Build all the lists together
   as they refer to each other in Perl code.  Alternatively an interface
   with accessors could be set. */
static void
build_tree_elements_relations_lists (DOCUMENT *document)
{
  dTHX;

  if (document->modified_information & F_DOCM_sections_list)
    {
      const char *key = "sections_list";
      const SECTION_RELATIONS_LIST *list = &document->sections_list;
      AV *av_list;
      SV *result_sv;

      register_document_sections_list_elements (document);

      av_list = build_section_relations_list (list);
      result_sv = newRV_noinc ((SV *) av_list);
      hv_store (document->hv, key, strlen (key), result_sv, 0);

      document->modified_information &= ~F_DOCM_sections_list;
    }

  if (document->modified_information & F_DOCM_nodes_list)
    {
      const char *key = "nodes_list";
      const NODE_RELATIONS_LIST *list = &document->nodes_list;
      AV *av_list;
      SV *result_sv;

      register_document_nodes_list_elements (document);

      av_list = build_node_relations_list (list);
      result_sv = newRV_noinc ((SV *) av_list);
      hv_store (document->hv, key, strlen (key), result_sv, 0);

      document->modified_information &= ~F_DOCM_nodes_list;
    }

  if (document->modified_information & F_DOCM_headings_list)
    {
      const char *key = "headings_list";
      const HEADING_RELATIONS_LIST *list = &document->headings_list;
      AV *av_list;
      SV *result_sv;

      register_document_headings_list_elements (document);

      av_list = build_heading_relations_list (list);
      result_sv = newRV_noinc ((SV *) av_list);
      hv_store (document->hv, key, strlen (key), result_sv, 0);

      document->modified_information &= ~F_DOCM_headings_list;
    }
}

/* for use with the TreeElement interface */
SV *
build_tree_elements_sections_list (DOCUMENT *document)
{
  const char *key = "sections_list";
  SV **relations_list_sv;

  dTHX;

  build_tree_elements_relations_lists (document);

  relations_list_sv = hv_fetch (document->hv, key, strlen (key), 0);

  if (relations_list_sv)
    {
      SV *result_sv = newSVsv (*relations_list_sv);
      return result_sv;
    }
  else
    return newSV (0);
}

/* for use with the TreeElement interface */
SV *
build_tree_elements_nodes_list (DOCUMENT *document)
{
  const char *key = "nodes_list";
  SV **relations_list_sv;

  dTHX;

  build_tree_elements_relations_lists (document);

  relations_list_sv = hv_fetch (document->hv, key, strlen (key), 0);

  if (relations_list_sv)
    {
      SV *result_sv = newSVsv (*relations_list_sv);
      return result_sv;
    }
  else
    return newSV (0);
}

/* for use with the TreeElement interface */
SV *
build_tree_elements_headings_list (DOCUMENT *document)
{
  const char *key = "headings_list";
  SV **relations_list_sv;

  dTHX;

  build_tree_elements_relations_lists (document);

  relations_list_sv = hv_fetch (document->hv, key, strlen (key), 0);

  if (relations_list_sv)
    {
      SV *result_sv = newSVsv (*relations_list_sv);
      return result_sv;
    }
  else
    return newSV (0);
}

