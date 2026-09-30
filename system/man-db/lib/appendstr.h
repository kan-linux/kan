/* appendstr.h -- interface to appending to a dynamically allocated string
 *
 * Copyright (C) 1994 Markus Armbruster
 * Copyright (C) 2022 Colin Watson
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Library Public License
 * as published by the Free Software Foundation; either version 2, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file docs/COPYING.LIB.  If not, write
 * to the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA
 * 02139, USA.
 */

#include "attribute.h"

NODISCARD extern char *appendstr (char *, ...) ATTRIBUTE_SENTINEL ();
