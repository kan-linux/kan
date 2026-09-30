/*
 * debug.h: interface to debugging messages
 *
 * Copyright (C) 2007-2022 Colin Watson.
 *
 * This file is part of man-db.
 *
 * man-db is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * man-db is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with man-db; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <stdbool.h>

#include "attribute.h"

extern bool debug_level; /* shows whether -d issued */
extern void init_debug (void);
extern void debug (const char *message, ...)
        ATTRIBUTE_FORMAT ((__printf__, 1, 2));
extern void debug_error (const char *message, ...)
        ATTRIBUTE_FORMAT ((__printf__, 1, 2));
