/* html_prepare_converter.h - definitions for html_prepare_converter.c */
#ifndef HTML_PREPARE_CONVERTER_H
#define HTML_PREPARE_CONVERTER_H

#include "command_ids.h"
#include "converter_types.h"

/* NOTE the high-level functions are declared in html_converter_api.h.
        the intermediate level functions are declared in
        html_conversion_api.h */

/* in conversion_data.c */
extern const char *html_global_unit_direction_names[];

extern const char *html_formatting_reference_names[];

extern const char *htmlxref_split_type_names[htmlxref_split_type_chapter + 1];



void clear_css_selector_style_list (CSS_SELECTOR_STYLE_LIST *selector_styles);
/* void html_format_setup (void); */
/* char *html_builtin_default_css_text (void); */



int html_nr_string_directions (const CONVERTER *self);
void html_free_customized_global_units_directions (
             DIRECTION_NODE_NAME_LIST *customized_global_units_directions);
void html_set_global_direction (CONVERTER *self,
              DIRECTION_NODE_NAME_LIST *customized_global_units_directions,
              const char *direction, const char *node_name);

/* void html_converter_initialize_beginning (CONVERTER *self); */

/* called from XS only */
FORMATTING_REFERENCE *new_special_unit_formatting_references
                                      (int special_units_varieties_nr);
/* Called from XS only */
HTMLXREF_MANUAL *new_htmlxref_manual_list (size_t size);

/* Called from XS only */
SPECIAL_UNIT_INFO *html_add_special_unit_info (
                            SPECIAL_UNIT_INFO_LIST *special_unit_info_list,
                            int type, size_t variety_nr, const char *value);

/* void html_converter_init_special_unit_varieties (CONVERTER *self); */
/* void html_converter_init_special_units_info (CONVERTER *self); */
/* int html_set_main_units_direction_names (CONVERTER *self); */
/* void html_converter_customize (CONVERTER *self); */



void free_html_no_arg_command_conversion (
                         HTML_NO_ARG_COMMAND_CONVERSION *format_spec);

char ***new_directions_strings_type (int nr_string_directions,
                                     int nr_dir_str_contexts);

void free_js_categories_list (JSLICENSE_CATEGORY_LIST *js_files_info);

void reset_html_page_css (CONVERTER *self);

/* void html_conversion_initialization (CONVERTER *self, const char *context); */

void initialize_js_categories_list (JSLICENSE_CATEGORY_LIST *js_files_info,
                                   size_t size);
void initialize_jslicense_files
                       (JSLICENSE_FILE_INFO_LIST *jslicences_files_info,
                                 const char *category, size_t size);

/* int html_setup_output (CONVERTER *self, char **paths); */
/* void html_setup_convert (CONVERTER *self); */

void reset_html_targets (CONVERTER *self);

/* void html_setup_output_simple_page (CONVERTER *self,
                                    const char *output_filename); */

/* void html_prepare_conversion_units (CONVERTER *self); */



int html_id_is_registered (CONVERTER *self, const char *string);
void html_register_id (CONVERTER *self, const char *string);

/* void html_prepare_conversion_units_targets (CONVERTER *self,
                                     const char *document_name); */



/* called separately for convert() */
/* void html_prepare_output_units_global_targets (CONVERTER *self); */

/* called from XS only */
void html_setup_global_units_direction_names (CONVERTER *self);
void html_setup_global_texts_direction_names (CONVERTER *self);

void html_reset_files_source_info (FILE_SOURCE_INFO_LIST *files_source_info);

/* only called for output() */
/* FILE_SOURCE_INFO_LIST * html_prepare_units_directions_files (CONVERTER *self,
          const char *output_file, const char *destination_directory,
          const char *output_filename, const char *document_name); */

#endif
