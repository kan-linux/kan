/* structure_list.h - declarations for structure_list.c */
#ifndef STRUCTURE_LIST_H
#define STRUCTURE_LIST_H

#include <stddef.h>

#include "text.h"
#include "tree_types.h"
#include "document_types.h"

NODE_RELATIONS_LIST *new_node_relations_list (void);
CONST_NODE_RELATIONS_LIST *new_const_node_relations_list (void);
SECTION_RELATIONS_LIST *new_section_relations_list (void);

void reallocate_node_relations_for (size_t n, NODE_RELATIONS_LIST *list);

const struct SECTION_RELATIONS **new_section_directions (void);

void add_to_node_relations_list (NODE_RELATIONS_LIST *list,
                                 NODE_RELATIONS *node_relations);
NODE_RELATIONS *add_node_to_node_relations_list (NODE_RELATIONS_LIST *list,
                                            ELEMENT *e);
void add_to_const_node_relations_list (CONST_NODE_RELATIONS_LIST *list,
                                       const NODE_RELATIONS *node_relations);
void add_to_section_relations_list (SECTION_RELATIONS_LIST *list,
                                    SECTION_RELATIONS *section_relations);
SECTION_RELATIONS *add_section_to_section_relations_list (
                                               SECTION_RELATIONS_LIST *list,
                                                  ELEMENT *e);
HEADING_RELATIONS *add_heading_to_heading_relations_list (
                                            HEADING_RELATIONS_LIST *list,
                                                  ELEMENT *e);

NODE_RELATIONS *insert_node_into_node_relations_list (
                                                 NODE_RELATIONS_LIST *list,
                                                 ELEMENT *e, size_t where);
SECTION_RELATIONS *insert_section_into_section_relations_list (
                                 SECTION_RELATIONS_LIST *list,
                                 ELEMENT *e, size_t where);

void free_node_relations_list (NODE_RELATIONS_LIST *list);
void destroy_node_relations_list (NODE_RELATIONS_LIST *list);
void free_section_relations_list (SECTION_RELATIONS_LIST *list);
void free_heading_relations_list (HEADING_RELATIONS_LIST *list);

char *print_sections_list (const DOCUMENT *document);
char *print_nodes_list (const DOCUMENT *document);
char *print_headings_list (const DOCUMENT *document);

char *print_sectioning_root (const DOCUMENT *document);

#endif
