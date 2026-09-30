/* swig_error_messages_types.h - External interface for error messages */
#ifndef SWIG_ERROR_MESSAGES_TYPES_H
#define SWIG_ERROR_MESSAGES_TYPES_H

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

#include <stddef.h>

#include "tree_types.h"
#include "document_types.h"

typedef struct FORMATTED_ERROR_MESSAGE {
    char *message;
    char *error_line;
    enum error_type type;
    int continuation;
    SOURCE_INFO source_info;
    char *formatted;
} FORMATTED_ERROR_MESSAGE;

typedef struct FORMATTED_ERROR_MESSAGE_LIST {
    FORMATTED_ERROR_MESSAGE *list;
    size_t number;
} FORMATTED_ERROR_MESSAGE_LIST;

#endif
