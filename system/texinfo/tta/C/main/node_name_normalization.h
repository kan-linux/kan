/* node_name_normalization.h - definitions for node_name_normalization.c */
#ifndef NODE_NAME_NORMALIZATION_H
#define NODE_NAME_NORMALIZATION_H

#include "tree_types.h"

void setup_node_name_normalization (void);

char *convert_to_normalized (const ELEMENT *e);
char *convert_to_node_identifier (const ELEMENT *root);
char *convert_contents_to_node_identifier (const ELEMENT *e);
char *convert_to_identifier (const ELEMENT *root);
char *convert_contents_to_identifier (const ELEMENT *e);

char *normalize_transliterate_texinfo (const ELEMENT *e, int external_translit,
                                       int in_test, int no_unidecode);
char *normalize_transliterate_texinfo_contents (const ELEMENT *e,
                int in_test, int external_translit, int no_unidecode);

#endif

