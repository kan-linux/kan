/* targets.h - declarations for targets.c */
#ifndef TARGETS_H
#define TARGETS_H

#include <stddef.h>

#include "tree_types.h"
#include "document_types.h"

void register_label_in_list (LABEL_LIST *labels_list, ELEMENT *element,
                             const char *normalized);
int register_label_element (DOCUMENT *document, ELEMENT *element,
                            ERROR_MESSAGE_LIST *error_messages);

size_t identifiers_target_number (const struct C_HASHMAP *identifiers_target);
ELEMENT *find_identifier_target (const struct C_HASHMAP *identifiers_target,
                          const char *normalized);
#endif
