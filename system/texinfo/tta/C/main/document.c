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

/* ALTMP perl/Texinfo/Document.pm */

#include <config.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#include "command_ids.h"
#include "tree_types.h"
#include "options_data.h"
#include "document_types.h"
/* fatal */
#include "base_utils.h"
/* also for library initialization for setup_ai_key_name_index */
#include "tree.h"
#include "errors.h"
#include "debug.h"
#include "hashmap.h"
/* for delete_global_info wipe_index setup_structuring_data */
#include "utils.h"
#include "customization_options.h"
#include "structure_list.h"
/* for library initialization, not for document code.
   set_element_type_name_info */
#include "builtin_commands.h"
#include "floats.h"
#include "manipulate_indices.h"
#include "convert_to_text.h"
/* setup_convert_utils */
#include "convert_utils.h"
#include "output_unit.h"
#include "api_to_perl.h"
/* for setup_unicode_data */
#include "unicode.h"
/* for setup_node_name_normalization */
#include "node_name_normalization.h"
#include "document.h"

static DOCUMENT **document_list;
static size_t document_number;
static size_t document_space;


/* generic setup of C data not needed for parser */
PATHS_INFORMATION txi_paths_info;

static void
free_converter_paths_information (PATHS_INFORMATION *paths_info)
{
  if (paths_info->texinfo_uninstalled)
    {
      free (paths_info->p.uninstalled.t2a_builddir);
      free (paths_info->p.uninstalled.t2a_srcdir);
    }
  else
    free (paths_info->p.installed.converter_datadir);
}

static void
setup_txi_paths_information (int texinfo_uninstalled,
                             const char *datadir,
                             const char *t2a_builddir,
                             const char *t2a_srcdir)
{
  free_converter_paths_information (&txi_paths_info);
  memset (&txi_paths_info, 0, sizeof (PATHS_INFORMATION));
  txi_paths_info.texinfo_uninstalled = texinfo_uninstalled;
  if (texinfo_uninstalled)
    {
      if (t2a_builddir)
        {
          txi_paths_info.p.uninstalled.t2a_builddir
            = strdup (t2a_builddir);
        }
      if (t2a_srcdir)
        {
          txi_paths_info.p.uninstalled.t2a_srcdir
            = strdup (t2a_srcdir);
        }
    }
  else
    {
      if (datadir)
        {
          xasprintf (&txi_paths_info.p.installed.converter_datadir,
                     "%s/" CONVERTER_CONFIG, datadir);
        }
    }
}

/* should be called only once. */
void
setup_texinfo_main (int texinfo_uninstalled,
                    const char *datadir,
                 const char *t2a_builddir, const char *t2a_srcdir)
{
  char *silent_refcount = getenv ("TEXINFO_SILENT_REFCOUNT");

  if (silent_refcount && !strcmp (silent_refcount, "1"))
    unset_check_element_interpreter_refcount ();

  /* used in converters and in main C program at early steps, not in Parser */
  setup_txi_paths_information (texinfo_uninstalled,
                               datadir, t2a_builddir, t2a_srcdir);

  set_element_type_name_info ();
  txi_initialise_base_options ();

  setup_ai_key_name_index ();

  /* used for the TreeElements interface */
  setup_convert_utils ();

  /* used in Parser */
  setup_unicode_data ();
  setup_node_name_normalization ();
  setup_structuring_data ();
}



DOCUMENT *
retrieve_document (size_t document_descriptor)
{
  if (document_descriptor <= document_number
      && document_list[document_descriptor -1] != 0)
    return document_list[document_descriptor -1];
  return 0;
}

/* descriptor starts at 1, 0 is an error */
DOCUMENT *
new_document (void)
{
  size_t document_index;
  size_t i;
  int slot_found = 0;
  DOCUMENT *document = (DOCUMENT *) malloc (sizeof (DOCUMENT));

  for (i = 0; i < document_number; i++)
    {
      if (document_list[i] == 0)
        {
          slot_found = 1;
          document_index = i;
        }
    }
  if (!slot_found)
    {
      if (document_number == document_space)
        {
          document_list = realloc (document_list,
                              (document_space += 5) * sizeof (DOCUMENT *));
          if (!document_list)
            fatal ("realloc failed");
        }
      document_index = document_number;
      document_number++;
    }
  document_list[document_index] = document;

  memset (document, 0, sizeof (DOCUMENT));
  document->descriptor = document_index +1;

  /* For filenames and macro names, it is possible that they won't be referenced
   in the line number of any element.  It would be too much work to keep track,
   so just keep them all here, and free them all together at the end. */
  document->small_strings = new_string_list ();

  document->modified_information |= F_DOCM_tree | F_DOCM_index_names
     | F_DOCM_floats | F_DOCM_internal_references | F_DOCM_labels_list
     | F_DOCM_identifiers_target | F_DOCM_global_info
     | F_DOCM_global_commands | F_DOCM_nodes_list | F_DOCM_sections_list
     | F_DOCM_headings_list;

  /*
  fprintf (stderr, "NEW DOCUMENT %zu %p\n", document_index +1, document);
   */
  return document;
}

void
register_document_options (DOCUMENT *document, OPTIONS *options,
                           OPTION **sorted_options)
{
  document->options = options;
  document->sorted_options = sorted_options;
}

/* ALTIMP Texinfo::Common */
void
set_output_encoding (OPTIONS *customization_information, DOCUMENT *document)
{
  if (customization_information
      && !customization_information->OUTPUT_ENCODING_NAME.o.string
      && document && document->global_info.input_encoding_name) {
    option_set_conf (&customization_information->OUTPUT_ENCODING_NAME, -1,
                     document->global_info.input_encoding_name);
  }
}

/* not used when document options are set from Perl */
/* mixes main program Perl code setting $main_configuration,
   get_customization_options_hash() call and register_document_options
 */
void
set_document_options (DOCUMENT *document, const OPTIONS_LIST *program_options,
                      const OPTIONS_LIST *cmdline_options,
                      const OPTIONS_LIST *init_files_options)
{
  OPTIONS_LIST document_options;
  const ELEMENT *document_language;
  OPTIONS *options = new_options ();
  OPTION **sorted_options = new_sorted_options (options);

  initialize_options_list (&document_options);
  copy_options_list (&document_options, program_options);

  /* specific document options based on the document */
  if (document->global_commands.novalidate)
    {
      OPTION *novalidate_option = &document_options.options->novalidate;
      novalidate_option->o.integer = 1;
      options_list_add_option_number (&document_options,
                                      novalidate_option->number);
    }

  document_language
    = get_global_document_command (&document->global_commands,
                                   CM_documentlanguage, CL_preamble);
  if (document_language)
    {
      enum command_id cmd;
      const char *language = informative_command_value (document_language,
                                                        &cmd);
      OPTION *documentlanguage_option
        = &document_options.options->documentlanguage;
      option_set_conf (documentlanguage_option, -1, language);
      options_list_add_option_number (&document_options,
                                      documentlanguage_option->number);
    }

  /* similar to set_output_encoding but for OPTIONS_LIST */
  if (document->global_info.input_encoding_name)
    {
      OPTION *output_encoding_name_option
        = &document_options.options->OUTPUT_ENCODING_NAME;
      option_set_conf (output_encoding_name_option, -1,
                       document->global_info.input_encoding_name);
      options_list_add_option_number (&document_options,
                                      output_encoding_name_option->number);
    }

  copy_options_list (&document_options, init_files_options);
  copy_options_list (&document_options, cmdline_options);

  copy_options_list_set_configured (options,
                                    sorted_options,
                                    &document_options, 0);

  free_options_list (&document_options);

  register_document_options (document, options, sorted_options);
}

const MERGED_INDICES *
document_merged_indices (DOCUMENT *document)
{
  if (document->indices_info.number)
    {
      if (!document->merged_indices)
        {
          document->merged_indices
            = merge_indices (&document->indices_info);
          document->modified_information |= F_DOCM_merged_indices;
        }
    }
  return document->merged_indices;
}

void
register_document_convert_index_text_options (DOCUMENT *document,
                                              TEXT_OPTIONS *text_options)
{
  /* this can happen if indices are sorted more than once for a document */
  if (document->convert_index_text_options)
    destroy_text_options (document->convert_index_text_options);
  document->convert_index_text_options = text_options;
}

const INDICES_SORT_STRINGS *
document_indices_sort_strings (DOCUMENT *document,
                               ERROR_MESSAGE_LIST *error_messages,
                               OPTIONS *options)
{
  if (!document->indices_sort_strings)
    {
      const MERGED_INDICES *merged_indices
         = document_merged_indices (document);

      document->indices_sort_strings
       = setup_index_entries_sort_strings (error_messages, options,
                        merged_indices, &document->indices_info, 0);

      document->modified_information |= F_DOCM_indices_sort_strings;
    }
  return document->indices_sort_strings;
}

static COLLATION_INDICES_SORTED_BY_INDEX *
new_collation_sorted_indices_by_index (
            COLLATIONS_INDICES_SORTED_BY_INDEX *collations,
            enum collation_type_name type,
            const char *language)
{
  COLLATION_INDICES_SORTED_BY_INDEX *result = 0;
  if (collations->number <= collations->space)
    {
      collations->collation_sorted_indices
        = (COLLATION_INDICES_SORTED_BY_INDEX *) realloc
           (collations->collation_sorted_indices,
             (collations->space += 3)
                * sizeof (COLLATION_INDICES_SORTED_BY_INDEX));
      if (!collations->collation_sorted_indices)
        fatal ("realloc failed");
    }

  result = &collations->collation_sorted_indices[collations->number];
  memset (result, 0, sizeof (COLLATION_INDICES_SORTED_BY_INDEX));
  result->type = type;
  result->language = strdup (language);

  collations->number++;

  return result;
}

COLLATION_INDICES_SORTED_BY_INDEX *
find_collation_sorted_indices_by_index (
            COLLATIONS_INDICES_SORTED_BY_INDEX *collations,
            enum collation_type_name type,
            const char *language)
{
  size_t i;
  for (i = 2; i < collations->number; i++)
    {
      COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices
        = &collations->collation_sorted_indices[i];
      if (collation_sorted_indices->type == type
          && !strcmp (collation_sorted_indices->language, language))
        return collation_sorted_indices;
    }
  return 0;
}

COLLATION_INDICES_SORTED_BY_INDEX *
sorted_indices_by_index (DOCUMENT *document,
                         ERROR_MESSAGE_LIST *error_messages,
                         OPTIONS *options, int use_unicode_collation,
                         const char *collation_language,
                         const char *collation_locale)
{
  COLLATIONS_INDICES_SORTED_BY_INDEX *collations;
  COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices = 0;
  if (!document->sorted_indices_by_index)
    {
      collations
       = (COLLATIONS_INDICES_SORTED_BY_INDEX *)
           malloc (sizeof (COLLATIONS_INDICES_SORTED_BY_INDEX));
      memset (collations, 0,
              sizeof (COLLATIONS_INDICES_SORTED_BY_INDEX));

      /* order is important, to match enum */
      new_collation_sorted_indices_by_index (collations, ctn_unicode, "-");
      new_collation_sorted_indices_by_index (collations, ctn_no_unicode, "");

      document->sorted_indices_by_index = collations;
    }

  collations = document->sorted_indices_by_index;

  if (use_unicode_collation == 0)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_no_unicode];
  else if (!collation_language && !collation_locale)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_unicode];
  else
    {
      enum collation_type_name type;
      const char *language;
      if (collation_language)
        {
          type = ctn_language_collation;
          language = collation_language;
        }
      else
        {
          type = ctn_locale_collation;
          language = collation_locale;
        }
      collation_sorted_indices
        = find_collation_sorted_indices_by_index (collations, type, language);
      if (!collation_sorted_indices)
        collation_sorted_indices
          = new_collation_sorted_indices_by_index (collations,
                                                   type, language);
    }

  if (!collation_sorted_indices->sorted_indices)
    {
      document_merged_indices (document);
      collation_sorted_indices->sorted_indices
        = sort_indices_by_index (document, error_messages, options,
                                 use_unicode_collation, collation_language,
                                 collation_locale);
    }
  return collation_sorted_indices;
}

static COLLATION_INDICES_SORTED_BY_LETTER *
new_collation_sorted_indices_by_letter (
            COLLATIONS_INDICES_SORTED_BY_LETTER *collations,
            enum collation_type_name type,
            const char *language)
{
  COLLATION_INDICES_SORTED_BY_LETTER *result = 0;
  if (collations->number <= collations->space)
    {
      collations->collation_sorted_indices
        = (COLLATION_INDICES_SORTED_BY_LETTER *) realloc
           (collations->collation_sorted_indices,
             (collations->space += 3)
                * sizeof (COLLATION_INDICES_SORTED_BY_LETTER));
      if (!collations->collation_sorted_indices)
        fatal ("realloc failed");
    }

  result = &collations->collation_sorted_indices[collations->number];
  memset (result, 0, sizeof (COLLATION_INDICES_SORTED_BY_LETTER));
  result->type = type;
  result->language = strdup (language);

  collations->number++;

  return result;
}

COLLATION_INDICES_SORTED_BY_LETTER *
find_collation_sorted_indices_by_letter (
            COLLATIONS_INDICES_SORTED_BY_LETTER *collations,
            enum collation_type_name type,
            const char *language)
{
  size_t i;
  for (i = 2; i < collations->number; i++)
    {
      COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices
        = &collations->collation_sorted_indices[i];
      if (collation_sorted_indices->type == type
          && !strcmp (collation_sorted_indices->language, language))
        return collation_sorted_indices;
    }
  return 0;
}

COLLATION_INDICES_SORTED_BY_LETTER *
sorted_indices_by_letter (DOCUMENT *document,
                          ERROR_MESSAGE_LIST *error_messages,
                          OPTIONS *options, int use_unicode_collation,
                          const char *collation_language,
                          const char *collation_locale)
{
  COLLATIONS_INDICES_SORTED_BY_LETTER *collations;
  COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices = 0;
  if (!document->sorted_indices_by_letter)
    {
      collations
       = (COLLATIONS_INDICES_SORTED_BY_LETTER *)
           malloc (sizeof (COLLATIONS_INDICES_SORTED_BY_LETTER));
      memset (collations, 0,
              sizeof (COLLATIONS_INDICES_SORTED_BY_LETTER));

      /* order is important, to match enum */
      new_collation_sorted_indices_by_letter (collations, ctn_unicode, "-");
      new_collation_sorted_indices_by_letter (collations, ctn_no_unicode, "");

      document->sorted_indices_by_letter = collations;
    }

  collations = document->sorted_indices_by_letter;

  if (use_unicode_collation == 0)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_no_unicode];
  else if (!collation_language && !collation_locale)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_unicode];
  else
    {
      enum collation_type_name type;
      const char *language;
      if (collation_language)
        {
          type = ctn_language_collation;
          language = collation_language;
        }
      else
        {
          type = ctn_locale_collation;
          language = collation_locale;
        }
      collation_sorted_indices
        = find_collation_sorted_indices_by_letter (collations, type, language);
      if (!collation_sorted_indices)
        collation_sorted_indices
          = new_collation_sorted_indices_by_letter (collations,
                                                    type, language);
    }

  if (!collation_sorted_indices->sorted_indices)
    {
      document_merged_indices (document);
      collation_sorted_indices->sorted_indices
        = sort_indices_by_letter (document, error_messages, options,
                                  use_unicode_collation, collation_language,
                                  collation_locale);
    }
  return collation_sorted_indices;
}

void
destroy_document_information_except_tree (DOCUMENT *document)
{
  delete_global_info (&document->global_info);
  delete_global_commands (&document->global_commands);
  free (document->internal_references.list);
  free_listoffloats_list (&document->listoffloats);
  free (document->labels_list.list);
  clear_c_hashmap (&document->identifiers_target);
  free_indices_info (&document->indices_info);
  wipe_error_message_list (&document->error_messages);
  wipe_error_message_list (&document->parser_error_messages);
  free_node_relations_list (&document->nodes_list);
  free_section_relations_list (&document->sections_list);
  free_heading_relations_list (&document->headings_list);
  if (document->sectioning_root)
    {
      free (document->sectioning_root->section_children.list);
      free (document->sectioning_root);
    }
  if (document->sorted_options)
    {
      size_t i;
      for (i = 0; i < TXI_OPTIONS_NR; i++)
        free_option (document->sorted_options[i]);

      free (document->sorted_options);
      free (document->options);
    }
  if (document->convert_index_text_options)
    destroy_text_options (document->convert_index_text_options);

  free_output_units_lists (&document->output_units_lists);

  if (document->merged_indices)
    destroy_merged_indices (document->merged_indices);
  if (document->indices_sort_strings)
    destroy_index_entries_sort_strings (document->indices_sort_strings);
  if (document->sorted_indices_by_index)
    {
      if (document->sorted_indices_by_index->number > 0)
        {
          size_t i;
          for (i = 0; i < document->sorted_indices_by_index->number; i++)
            {
              COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices
        = &document->sorted_indices_by_index->collation_sorted_indices[i];
              free (collation_sorted_indices->language);
              if (collation_sorted_indices->sorted_indices)
                destroy_indices_sorted_by_index (
                                collation_sorted_indices->sorted_indices);
            }
        }
      free (document->sorted_indices_by_index->collation_sorted_indices);
      free (document->sorted_indices_by_index);
    }
  if (document->sorted_indices_by_letter)
    {
      if (document->sorted_indices_by_letter->number > 0)
        {
          size_t i;
          for (i = 0; i < document->sorted_indices_by_letter->number; i++)
            {
              COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices
        = &document->sorted_indices_by_letter->collation_sorted_indices[i];
              free (collation_sorted_indices->language);
              if (collation_sorted_indices->sorted_indices)
                destroy_indices_sorted_by_letter (
                                collation_sorted_indices->sorted_indices);
            }
        }
      free (document->sorted_indices_by_letter->collation_sorted_indices);
      free (document->sorted_indices_by_letter);
    }
}

void
destroy_document (DOCUMENT *document)
{
  size_t document_descriptor = document->descriptor;
  size_t i;

   /*
  fprintf (stderr, "DOC BEGIN REMOVE\n");
    */
  destroy_document_information_except_tree (document);

  for (i = 0; i < document->additional_elements.number; i++)
    destroy_element (document->additional_elements.list[i]);
  free (document->additional_elements.list);

  free (document->element_handles.list);

  if (document->tree)
    {
      destroy_element_and_children (document->tree);
    }

  if (document->small_strings)
    destroy_strings_list (document->small_strings);

  if (document->hv)
    {
      unregister_perl_data (document->hv);
       /*
      fprintf (stderr, "DOC: %d\n", get_refcount (document->hv));
        */
      document->hv = 0;
    }

  /*
  fprintf (stderr, "DOC REMOVED %zu %p\n", document_descriptor, document);
   */

  free (document);
  document_list[document_descriptor -1] = 0;
}

/* destroy everything except for the tree and merge small string to
   DOCUMENT */
ELEMENT *
unregister_document_merge_with_document (DOCUMENT *removed_document,
                                         DOCUMENT *document)
{
  size_t document_descriptor;
  ELEMENT *tree;

  if (!removed_document)
    return 0;

  document_descriptor = removed_document->descriptor;

  destroy_document_information_except_tree (removed_document);

  tree = removed_document->tree;
  removed_document->tree = 0;

  /*
  fprintf (stderr, "UNREGISTER %p (%zu)\n", removed_document,
                                           document_descriptor);
   */

  if (removed_document->small_strings->number)
    {
      if (document)
        merge_strings (document->small_strings,
                       removed_document->small_strings);
      else
       fatal ("unregister_document_merge_with_document "
               "no document but small_strings");
    }
  free (removed_document->small_strings->list);
  free (removed_document->small_strings);

  free (removed_document);
  document_list[document_descriptor -1] = 0;
  return tree;
}

void
add_other_global_info_string (OTHER_GLOBAL_INFO *other_global_info,
                              const char *key, const char *value)
{
  size_t i;
  for (i = 0; i < other_global_info->info_number; i++)
    {
      if (!strcmp (other_global_info->info[i].key, key))
        break;
    }
  if (i == other_global_info->info_number)
    {
      if (other_global_info->info_number == other_global_info->info_space)
        {
          other_global_info->info = realloc (other_global_info->info,
             (other_global_info->info_space += 5) * sizeof (KEY_STRING_PAIR));
          if (!other_global_info->info)
            fatal ("realloc failed");
        }
      other_global_info->info_number++;

      other_global_info->info[i].key = strdup (key);
    }

  other_global_info->info[i].string = strdup (value);
}

/* unused */
void
wipe_document_errors (DOCUMENT *document)
{
  if (document)
    wipe_error_message_list (&document->error_messages);
}

void
wipe_document_parser_errors (DOCUMENT *document)
{
  if (document)
    wipe_error_message_list (&document->parser_error_messages);
}



/* textual representations mainly used for tests */

/* ALTIMP Texinfo::Structuring */
char *
print_document_listoffloats (DOCUMENT *document)
{
  if (document)
    return print_listoffloats_types (&document->listoffloats);

  return 0;
}

char *
print_document_indices_information (DOCUMENT *document)
{
  if (document)
    return print_indices_information (&document->indices_info);

  return 0;
}

/* structures and functions used to find sort strings based on the
   sorted index index entry, using the original index name and
   index entry position in the original index
 */
typedef struct INDEX_ENTRIES_SORT_STRINGS {
  const INDEX *index;
  const INDEX_ENTRY_SORT_STRING **sort_strings;
} INDEX_ENTRIES_SORT_STRINGS;

typedef struct INDICES_ENTRIES_SORT_STRINGS {
  size_t space;
  size_t number;
  INDEX_ENTRIES_SORT_STRINGS *list;
} INDICES_ENTRIES_SORT_STRINGS;

static size_t
find_indices_entries_sort_strings_index (const INDEX_LIST *indices_info,
       INDICES_ENTRIES_SORT_STRINGS *map_idx_sort_str,
                                   const char* index_name)
{
  size_t i;
  size_t result_index;
  INDEX_ENTRIES_SORT_STRINGS *idx_sort_str;

  for (i = 0; i < map_idx_sort_str->number; i++)
    {
      if (!strcmp (map_idx_sort_str->list[i].index->name, index_name))
        return i;
    }

  if (map_idx_sort_str->number >= map_idx_sort_str->space)
    {
      map_idx_sort_str->list = realloc (map_idx_sort_str->list,
                    (map_idx_sort_str->space += 1)
                           * sizeof (INDEX_ENTRIES_SORT_STRINGS));
      if (!map_idx_sort_str->list)
        fatal ("realloc failed");
    }

  result_index = map_idx_sort_str->number;
  idx_sort_str = &map_idx_sort_str->list[result_index];

  idx_sort_str->index = 0;

  for (i = 0; i < indices_info->number; i++)
    {
      if (indices_info->list[i]->name == index_name)
        {
          idx_sort_str->index = indices_info->list[i];
          break;
        }
    }

  if (!idx_sort_str->index)
    {
      char *msg;
      xasprintf (&msg, "sort strings index not found: %s\n", index_name);
      fatal (msg);
      free (msg);
    }

  idx_sort_str->sort_strings = (const INDEX_ENTRY_SORT_STRING **)
   malloc (idx_sort_str->index->entries_number
           * sizeof (const INDEX_ENTRY_SORT_STRING *));
  memset (idx_sort_str->sort_strings, 0, idx_sort_str->index->entries_number
                * sizeof (const INDEX_ENTRY_SORT_STRING *));

  map_idx_sort_str->number++;

  return result_index;
}

static void
setup_indices_entries_sort_strings (const INDEX_LIST *indices_info,
                  INDICES_ENTRIES_SORT_STRINGS *map_idx_sort_str,
                  const INDEX_SORT_STRINGS *index_sort_strings)
{
  size_t i;

  for (i = 0; i < index_sort_strings->entries_number; i++)
    {
      INDEX_ENTRY_SORT_STRING *sort_string
        = &index_sort_strings->sort_string_entries[i];
      size_t index_idx
        = find_indices_entries_sort_strings_index (indices_info,
                                                 map_idx_sort_str,
                                         sort_string->entry->index_name);
      map_idx_sort_str->list[index_idx]
             .sort_strings[sort_string->entry->number -1]
        = sort_string;
    }
}

char *
print_document_indices_sort_strings (DOCUMENT *document)
{
  size_t i;
  const MERGED_INDICES *merged_indices;
  NAME_NUMBER_LIST indices_sort_strings_n_nr;
  NAME_NUMBER_LIST sorted_index_entries_n_nr;
  int use_unicode_collation = 1;
  const char *locale_lang = 0;
  const INDICES_SORT_STRINGS *indices_sort_strings;
  const COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_index_entries;
  INDICES_ENTRIES_SORT_STRINGS indices_entries_sort_string;
  TEXT result;

  merged_indices = document_merged_indices (document);

  if (!merged_indices->number)
    return 0;

  memset (&indices_entries_sort_string,
          0, sizeof (INDICES_ENTRIES_SORT_STRINGS));

  if (document->options)
    {
      use_unicode_collation
        = document->options->USE_UNICODE_COLLATION.o.integer;

      if (use_unicode_collation != 0)
        locale_lang = document->options->COLLATION_LANGUAGE.o.string;
    }

  indices_sort_strings = document_indices_sort_strings (document,
                            &document->error_messages, document->options);

  collation_sorted_index_entries
   = sorted_indices_by_index (document, &document->error_messages,
                              document->options, use_unicode_collation,
                              locale_lang, 0);

  memset (&indices_sort_strings_n_nr, 0, sizeof (NAME_NUMBER_LIST));

  allocate_name_number_list (&indices_sort_strings_n_nr,
                             indices_sort_strings->number);

  for (i = 0; i < indices_sort_strings->number; i++)
    {
      NAME_NUMBER *index_name_number = &indices_sort_strings_n_nr.list[i];
      index_name_number->name = indices_sort_strings->indices[i].index->name;
      index_name_number->number = i;
    }

  sort_name_number_list (&indices_sort_strings_n_nr);

  memset (&sorted_index_entries_n_nr, 0, sizeof (NAME_NUMBER_LIST));

  allocate_name_number_list (&sorted_index_entries_n_nr,
                             indices_sort_strings->number);

  /* use the sorting of indices_sort_strings and find the number,
     index +1 of the sorted index name with a linear search.  The number
     is used and not the index in order to use 0 to mean not found */
  for (i = 0; i < indices_sort_strings->number; i++)
    {
      size_t j;
      const char *index_name = indices_sort_strings_n_nr.list[i].name;
      NAME_NUMBER *index_name_number = &sorted_index_entries_n_nr.list[i];

      index_name_number->name = index_name;
      index_name_number->number = 0;

      for (j = 0; collation_sorted_index_entries->sorted_indices[j].name; j++)
        {
          if (! strcmp(collation_sorted_index_entries->sorted_indices[j].name,
                       index_name))
            {
              index_name_number->number = j+1;
              break;
            }
        }
    }

  text_init (&result);
  text_append (&result, "");

  for (i = 0; i < indices_sort_strings_n_nr.number; i++)
    {
      NAME_NUMBER *sorted_indices_number = &sorted_index_entries_n_nr.list[i];
      size_t sorted_index_nr = sorted_indices_number->number;
      INDEX_SORTED_BY_INDEX *sorted_index;

      if (sorted_index_nr == 0)
        continue;

      sorted_index
        = &collation_sorted_index_entries->sorted_indices[sorted_index_nr -1];
      if (sorted_index->entries_number > 0)
        {
          size_t j;
          NAME_NUMBER *sort_string_number = &indices_sort_strings_n_nr.list[i];
          const INDEX_SORT_STRINGS *index_sort_strings
            = &indices_sort_strings->indices[sort_string_number->number];

          setup_indices_entries_sort_strings (&document->indices_info,
                      &indices_entries_sort_string, index_sort_strings);

          text_printf (&result, "%s:\n", sorted_index->name);
          for (j = 0; j < sorted_index->entries_number; j++)
            {
              const INDEX_ENTRY *idx_entry = sorted_index->entries[j];
              const INDEX_ENTRY_SORT_STRING *sort_string = 0;
              size_t k;
              for (k = 0; k < indices_entries_sort_string.number; k++)
                {
                  if (!strcmp (indices_entries_sort_string.list[k].index->name,
                               idx_entry->index_name))
                    {
                      sort_string = indices_entries_sort_string.list[k]
                                       .sort_strings[idx_entry->number -1];
                      break;
                    }
                }
              if (!sort_string)
                {
                  char *msg;
                  xasprintf (&msg, "sort string not found: %s",
                                    idx_entry->index_name);
                  fatal (msg);
                  free (msg);
                }

              text_append_n (&result, " ", 1);
      /* same as Texinfo::Indices format_index_entries_sort_strings */
              text_append (&result,
                  sort_string->sort_string_subentries[0].sort_string);
              if (sort_string->subentries_number > 1)
                {
                  size_t n;
                  for (n = 1; n < sort_string->subentries_number; n++)
                    {
                      text_append_n (&result, ", ", 2);
                      text_append (&result,
                        sort_string->sort_string_subentries[n].sort_string);
                    }
                }
              text_append_n (&result, "\n", 1);
            }

           /* reset indices_entries_sort_string */
          for (j = 0; j < indices_entries_sort_string.number; j++)
            {
              free (indices_entries_sort_string.list[j].sort_strings);
              indices_entries_sort_string.list[j].index = 0;
            }
          indices_entries_sort_string.number = 0;
        }
    }

  free (indices_entries_sort_string.list);

  free_name_number_list (&sorted_index_entries_n_nr);
  free_name_number_list (&indices_sort_strings_n_nr);

  return result.text;
}
