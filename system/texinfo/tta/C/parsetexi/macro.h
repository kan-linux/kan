/* macro.h - declarations for macro.c */
#ifndef MACRO_H
#define MACRO_H
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

#include "command_ids.h"
#include "tree_types.h"
#include "document_types.h"

typedef struct {
    enum command_id cmd;
    char *begin;
    char *end;
} INFO_ENCLOSE;

typedef struct {
    char *macro_name;
    const ELEMENT *element;
    enum command_id cmd;
    char *macrobody;
} MACRO;

void new_macro (const char *name, const ELEMENT *macro);
ELEMENT *parse_macro_command_line (enum command_id, const char **line_inout,
                                   ELEMENT *parent);
ELEMENT *handle_macro (ELEMENT *current, const char **line_inout,
                       enum command_id cmd_id, enum command_id from_alias);
void delete_macro (const char *name);
void unset_macro_record (MACRO *m);
MACRO *lookup_macro (enum command_id cmd);
void wipe_macros (void);

void store_value_parsed_document (VALUE_LIST *values, const char *name,
                                  const char *value);
char *fetch_value (const char *name);
void clear_parser_value_parsed_document (const char *name);
void store_parser_value_parsed_document (const char *name, const char *value);
void init_values (void);

INFO_ENCLOSE *lookup_infoenclose (enum command_id cmd);
void add_infoenclose (enum command_id cmd, const char *begin, const char *end);

#endif
