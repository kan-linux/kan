/* call_conversion_perl.h - API to interact with embedded perl from C code */
#ifndef CALL_CONVERSION_PERL_H
#define CALL_CONVERSION_PERL_H

#include "tree_types.h"
#include "option_types.h"
#include "document_types.h"
#include "converter_types.h"

CONVERTER_INITIALIZATION_INFO *call_module_converter_defaults (
                                   const char *module_name,
                                   OPTIONS_LIST *customizations);

CONVERTER *call_module_converter (const char *module_name,
                        const CONVERTER_INITIALIZATION_INFO *conf);
void call_object_converter_perl_release (const CONVERTER *self);
void release_converter_output_units_remove_perl_output_units (
                                                  CONVERTER *self);
OUTPUT_TEXT_FILES_INFO *call_converter_output (CONVERTER *self,
                                               DOCUMENT *document);

char *call_sort_element_counts (const CONVERTER *self,
                          DOCUMENT *document, int use_sections,
                          int count_words);

int call_config_GNUT_load_init_file (const char *file_path);

#endif
