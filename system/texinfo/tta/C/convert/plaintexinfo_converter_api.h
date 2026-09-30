/* plaintexinfo_converter_api.h - PlainTexinfo converter API */
#ifndef PLAINTEXINFO_CONVERTER_API_H
#define PLAINTEXINFO_CONVERTER_API_H

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

/* PlainTexinfo Converter API */

#include "document_types.h"
#include "converter_types.h"

CONVERTER_INITIALIZATION_INFO *plaintexinfo_converter_defaults
                                (enum converter_format format,
                                 const CONVERTER_INITIALIZATION_INFO *conf);

char *plaintexinfo_output (CONVERTER *converter, DOCUMENT *document);

char *plaintexinfo_convert (CONVERTER *converter, DOCUMENT *document);

char *plaintexinfo_convert_tree (CONVERTER *converter,
                                 const ELEMENT *tree);
#endif
