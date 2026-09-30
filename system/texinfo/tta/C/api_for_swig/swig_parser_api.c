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
 
#include <config.h>

#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>

#include "document_types.h"
#include "parser_conf.h"
#include "utils.h"
#include "api.h"
#include "conf.h"
#include "swig_parser_api.h"

PARSER *
txi_ext_parser (void)
{
  PARSER_CONF *parser_conf = register_conf();
  PARSER *result = (PARSER *) malloc (sizeof (PARSER));
  result->parser_conf_descriptor = parser_conf->descriptor;
  return result;
}

void
txi_ext_destroy_parser (PARSER *parser)
{
  size_t parser_conf_descriptor = parser->parser_conf_descriptor;

  unregister_parser_conf_descriptor (parser_conf_descriptor);
  free (parser);
}


/* in api.h */

DOCUMENT *
txi_ext_parse_file (PARSER *parser, const char *input_file_path, 
                   int *status)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parse_file (input_file_path, status);
}

DOCUMENT *
txi_ext_parse_piece (PARSER *parser, const char *string, int line_nr)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parse_piece (string, line_nr);
}

DOCUMENT *
txi_ext_parse_string (PARSER *parser, const char *string, int line_nr)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parse_string (string, line_nr);
}

DOCUMENT *
txi_ext_parse_text (PARSER *parser, const char *string, int line_nr)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parse_text (string, line_nr);
}

void
txi_ext_parser_conf_reset_values (PARSER *parser)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_reset_values ();
}

void
txi_ext_parser_conf_add_value (PARSER *parser, const char *name,
                               const char *value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_add_value (name, value);
}



/* in conf.h */

void
txi_ext_parser_conf_set_show_menu (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_show_menu (i);
}

void
txi_ext_parser_conf_set_CPP_LINE_DIRECTIVES (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_CPP_LINE_DIRECTIVES (i);
}

int
txi_ext_parser_conf_set_DEBUG (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parser_conf_set_DEBUG (i);
}

void
txi_ext_parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME (
                                                    PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME (i);
}

void
txi_ext_parser_conf_set_MAX_MACRO_CALL_NESTING (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_MAX_MACRO_CALL_NESTING (i);
}

int
txi_ext_parser_conf_set_NO_INDEX (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parser_conf_set_NO_INDEX (i);
}

int
txi_ext_parser_conf_set_NO_USER_COMMANDS (PARSER *parser, int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  return parser_conf_set_NO_USER_COMMANDS (i);
}

void
txi_ext_parser_conf_clear_INCLUDE_DIRECTORIES (PARSER *parser)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_clear_INCLUDE_DIRECTORIES ();
}

void
txi_ext_parser_conf_add_include_directory (PARSER *parser,
                                           const char *filename)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_add_include_directory (filename);
}

void
txi_ext_parser_conf_clear_expanded_formats (PARSER *parser)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_clear_expanded_formats ();
}

void
txi_ext_parser_conf_add_expanded_format (PARSER *parser,
                                         const char *format)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_add_expanded_format (format);
}

void
txi_ext_parser_conf_set_documentlanguage (PARSER *parser,
                                          const char *value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_documentlanguage (value);
}

void
txi_ext_parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME (PARSER *parser,
                                                          int i)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME (i);
}

void
txi_ext_parser_conf_set_INPUT_FILE_NAME_ENCODING (PARSER *parser,
                                                  const char *value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_INPUT_FILE_NAME_ENCODING (value);
}

void
txi_ext_parser_conf_set_LOCALE_ENCODING (PARSER *parser,
                                         const char *value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_LOCALE_ENCODING (value);
}

void
txi_ext_parser_conf_set_COMMAND_LINE_ENCODING (PARSER *parser,
                                               const char *value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_COMMAND_LINE_ENCODING (value);
}

void txi_ext_parser_conf_set_accept_internalvalue (PARSER *parser,
                                                   int value)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  apply_conf (parser_conf);
  parser_conf_set_accept_internalvalue (value);
}



/* Not in libtexinfo parser API */
STRING_LIST *
txi_ext_parser_conf_get_INCLUDE_DIRECTORIES (PARSER *parser)
{
  PARSER_CONF *parser_conf
    = retrieve_parser_conf (parser->parser_conf_descriptor);
  return &parser_conf->include_directories;
}

