/* replacements for Perl functions calling.  Most could be called. */

#include <config.h>

#include "converter_types.h"
#include "document_types.h"
#include "call_conversion_perl.h"
#include "call_document_perl_functions.h"

int
call_config_GNUT_load_init_file (const char *file_path)
{
  return 0; 
}

CONVERTER_INITIALIZATION_INFO *
call_module_converter_defaults (const char *module_name,
                                OPTIONS_LIST *customizations)
{
  return 0;
}

CONVERTER *
call_module_converter (const char *module_name,
                       const CONVERTER_INITIALIZATION_INFO *conf)
{
  return 0;
}

void
release_converter_output_units_remove_perl_output_units (CONVERTER *self)
{
}

void
call_object_converter_perl_release (const CONVERTER *self)
{
}

void
call_document_remove_document_references (DOCUMENT *document,
                                          int remove_references)
{
}

OUTPUT_TEXT_FILES_INFO *
call_converter_output (CONVERTER *self, DOCUMENT *document)
{
  return 0;
}

char *
call_sort_element_counts (const CONVERTER *self, DOCUMENT *document,
                          int use_sections, int count_words)
{
  return 0;
}
