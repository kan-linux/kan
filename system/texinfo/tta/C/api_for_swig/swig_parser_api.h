/* swig_parser_api.h - declarations for swig_parser_api.c */
#ifndef SWIG_PARSER_API_H
#define SWIG_PARSER_API_H

#include <stddef.h>

#include "source_mark_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "swig_error_messages_types.h"

PARSER *txi_ext_parser (void);
void txi_ext_destroy_parser (PARSER *parser);

DOCUMENT *txi_ext_parse_file (PARSER *parser, const char *input_file_path,
                              int *status);
DOCUMENT *txi_ext_parse_piece (PARSER *parser, const char *string,
                              int line_nr);
DOCUMENT *txi_ext_parse_string (PARSER *parser, const char *string,
                                int line_nr);
DOCUMENT *txi_ext_parse_text (PARSER *parser, const char *string,
                              int line_nr);

void txi_ext_parser_conf_reset_values (PARSER *parser);
void txi_ext_parser_conf_add_value (PARSER *parser, const char *name,
                                    const char *value);

void txi_ext_parser_conf_set_show_menu (PARSER *parser, int i);
void txi_ext_parser_conf_set_CPP_LINE_DIRECTIVES (PARSER *parser, int i);
int txi_ext_parser_conf_set_DEBUG (PARSER *parser, int i);
void txi_ext_parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME (
                                                    PARSER *parser, int i);
void txi_ext_parser_conf_set_MAX_MACRO_CALL_NESTING (PARSER *parser, int i);
int txi_ext_parser_conf_set_NO_INDEX (PARSER *parser, int i);
int txi_ext_parser_conf_set_NO_USER_COMMANDS (PARSER *parser, int i);
void txi_ext_parser_conf_clear_INCLUDE_DIRECTORIES (PARSER *parser);
void txi_ext_parser_conf_add_include_directory (PARSER *parser,
                                                const char *filename);
void txi_ext_parser_conf_clear_expanded_formats (PARSER *parser);
void txi_ext_parser_conf_add_expanded_format (PARSER *parser,
                                              const char *format);
void txi_ext_parser_conf_set_documentlanguage (PARSER *parser,
                                               const char *value);
void txi_ext_parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME (PARSER *parser,
                                                               int i);
void txi_ext_parser_conf_set_INPUT_FILE_NAME_ENCODING (PARSER *parser,
                                                       const char *value);
void txi_ext_parser_conf_set_LOCALE_ENCODING (PARSER *parser,
                                              const char *value);
void txi_ext_parser_conf_set_COMMAND_LINE_ENCODING (PARSER *parser,
                                                    const char *value);
void txi_ext_parser_conf_set_accept_internalvalue (PARSER *parser,
                                                   int value);

STRING_LIST *txi_ext_parser_conf_get_INCLUDE_DIRECTORIES (PARSER *parser);

#endif
