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

#include "document_types.h"
#include "converter_types.h"
#include "customization_options.h"
#include "convert_to_texinfo.h"
#include "converters_options.h"
/* converter_output_tree */
#include "converter.h"
#include "plaintexinfo_converter_api.h"

CONVERTER_INITIALIZATION_INFO *
plaintexinfo_converter_defaults (enum converter_format format,
                                 const CONVERTER_INITIALIZATION_INFO *conf)
{
  CONVERTER_INITIALIZATION_INFO *format_defaults
    = new_converter_initialization_info ();

  add_plaintexinfo_converter_regular_options_defaults (&format_defaults->conf);

  return format_defaults;
}

char *
plaintexinfo_output (CONVERTER *converter, DOCUMENT *document)
{
  return converter_output_tree (converter, document, 0, 0, 0, 0);
}

char *
plaintexinfo_convert (CONVERTER *converter, DOCUMENT *document)
{
  char *result = convert_to_texinfo (document->tree);
  return result;
}

char *
plaintexinfo_convert_tree (CONVERTER *converter,
                           const ELEMENT *tree)
{
  char *result = convert_to_texinfo (tree);
  return result;
}


