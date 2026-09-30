/* rawtext_converter_api.h - raw text converter API */
#ifndef RAWTEXT_CONVERTER_API_H
#define RAWTEXT_CONVERTER_API_H

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

void rawtext_converter (CONVERTER *self,
                        const CONVERTER_INITIALIZATION_INFO *conf);

char *rawtext_output (CONVERTER *converter, DOCUMENT *document);

char *rawtext_convert (CONVERTER *converter, DOCUMENT *document);

char *rawtext_convert_tree (CONVERTER *converter, const ELEMENT *tree);
#endif
