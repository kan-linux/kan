/* api.h - declarations for api.c */
#ifndef API_H
#define API_H

#include "tree_types.h"
#include "document_types.h"

DOCUMENT *parse_file (const char *input_file_path, int *status);
DOCUMENT *parse_piece (const char *string, int line_nr);
DOCUMENT *parse_string (const char *string, int line_nr);
DOCUMENT *parse_text (const char *string, int line_nr);
void reset_parser (int debug_output);

void parser_conf_reset_values (void);
void parser_conf_add_value (const char *name, const char *value);

#endif
