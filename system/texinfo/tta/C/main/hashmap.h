/* hashmap.h - declarations for hashmap.c */
#ifndef HASHMAP_H
#define HASHMAP_H

/* Copyright 2024-2026 Free Software Foundation, Inc.

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

struct BUCKET_ARENA_ITERATOR;

C_HASHMAP *new_c_hashmap (size_t nbuckets);
void init_c_hashmap (C_HASHMAP *H, size_t nbuckets);
int is_c_hashmap_registered (C_HASHMAP *H, const char *in_string);
void c_hashmap_register (C_HASHMAP *H, const char *in_string,
                         const void *value);
const void *c_hashmap_value (const C_HASHMAP *H, const char *in_string,
                             int *found);
void clear_c_hashmap (C_HASHMAP *H);
size_t c_hashmap_count (const C_HASHMAP *H);

const void *c_hashmap_iterator_next_value (const C_HASHMAP *H,
                               struct BUCKET_ARENA_ITERATOR **hash_iterator,
                               const char **key);

#endif
