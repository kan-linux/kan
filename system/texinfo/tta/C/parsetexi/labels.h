/* labels.h - declarations for labels.c */
#ifndef LABELS_H
#define LABELS_H
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

void check_register_target_element_label (ELEMENT *label_element,
                                          ELEMENT *target_element);
void set_labels_identifiers_target (const LABEL_LIST *labels,
                               C_HASHMAP *hashmap, size_t sections_number);

#endif
