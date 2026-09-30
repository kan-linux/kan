/* source_mark_types.h - types for the source marks */
#ifndef SOURCE_MARK_TYPES_H
#define SOURCE_MARK_TYPES_H
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

/* the expanded_conditional_command source mark is used in arrays
   dimensions, keep it in the end or change code */
#define SM_TYPES_LIST \
   sm_type(include) \
   sm_type(setfilename) \
   sm_type(delcomment) \
   sm_type(defline_continuation) \
   sm_type(macro_expansion) \
   sm_type(linemacro_expansion) \
   sm_type(value_expansion) \
   sm_type(ignored_conditional_block) \
   sm_type(line_directive) \
   sm_type(macro_arg_escape_backslash) \
   sm_type(expanded_conditional_command) \


enum source_mark_type {
   SM_type_none,
  #define sm_type(name) SM_type_ ## name,
   SM_TYPES_LIST
  #undef sm_type
};

enum source_mark_status {
   SM_status_none,
   SM_status_start,
   SM_status_end,
};

typedef struct SOURCE_MARK {
    enum source_mark_type type;
    enum source_mark_status status;
    size_t position;
    int counter;
    struct ELEMENT *element; /* holds the source mark information, such as
                                macro call, @include, @value or @def* line */
    char *line;  /* used when the information is not available as
                    an element, for DEL comments, for instance */
} SOURCE_MARK;

#endif
