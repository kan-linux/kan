/* transformations.h - declarations for transformations.c */
#ifndef TRANSFORMATIONS_H
#define TRANSFORMATIONS_H

#include "tree_types.h"
#include "document_types.h"

ELEMENT_LIST *fill_gaps_in_sectioning_in_document (DOCUMENT *document,
                                const ELEMENT *commands_heading_content);
void relate_index_entries_to_table_items_in_document (DOCUMENT *document);
void move_index_entries_after_items_in_document (DOCUMENT *document);
ELEMENT *reference_to_arg_in_tree (ELEMENT *tree, DOCUMENT *document);
void reference_to_arg_in_document (DOCUMENT *document);
void complete_tree_nodes_menus_in_document (DOCUMENT *document,
                                            int use_sections);
void complete_tree_nodes_missing_menu (DOCUMENT *document, int use_sections);
int regenerate_master_menu (DOCUMENT *document, int use_sections);
ELEMENT_LIST *insert_nodes_for_sectioning_commands (DOCUMENT *document);
ELEMENT *protect_hashchar_at_line_beginning (ELEMENT *tree,
                                             DOCUMENT *document);
void protect_hashchar_at_line_beginning_in_document (DOCUMENT *document);
void protect_first_parenthesis_in_targets (ELEMENT *tree);
void protect_first_parenthesis_in_targets_in_document (DOCUMENT *document);


#endif
