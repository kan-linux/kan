/* output_unit.h - declarations for output_unit.c */
#ifndef OUTPUT_UNIT_H
#define OUTPUT_UNIT_H

#include <stddef.h>

#include "tree_types.h"
#include "document_types.h"

enum units_split_type {
   UST_none = -1,
   UST_section,
   UST_node,
};

extern const char *relative_unit_direction_name[];

OUTPUT_UNIT_LIST *retrieve_output_units (const DOCUMENT *document,
                                         size_t output_units_descriptor);
size_t new_output_units_descriptor (DOCUMENT *document);

size_t split_by_node (DOCUMENT *document);
size_t split_by_section (DOCUMENT *document);
int unsplit (DOCUMENT *document);
void split_pages (OUTPUT_UNIT_LIST *output_units,
                  const NODE_RELATIONS_LIST *nodes_list, const char *split);

OUTPUT_UNIT *new_output_unit (enum output_unit_type unit_type);
void add_to_output_unit_list (OUTPUT_UNIT_LIST *list,
                              OUTPUT_UNIT *output_unit);
void free_output_unit_list (OUTPUT_UNIT_LIST *output_units_list);
void free_output_units_lists (OUTPUT_UNIT_LISTS *output_units_lists);

char *output_unit_texi (const OUTPUT_UNIT *output_unit);

void units_directions (const C_HASHMAP *identifiers_target,
                       const NODE_RELATIONS_LIST *nodes_list,
                       OUTPUT_UNIT_LIST *output_units,
                       OUTPUT_UNIT_LIST *external_node_target_units,
                       int print_debug);
void units_file_directions (OUTPUT_UNIT_LIST *output_units);

void do_units_directions_pages (DOCUMENT *document,
                           enum units_split_type units_split,
                           const char *split_pages_string, int debug);

char *print_output_units_tree_details (OUTPUT_UNIT_LIST *output_units,
                                 ELEMENT *tree,
                                 const char *fname_encoding, int use_filename);
char *output_units_print_details (OUTPUT_UNIT_LIST *output_units,
                                const char *fname_encoding, int use_filename);
#endif
