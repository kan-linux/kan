/* texinfo.h - Texinfo API */
#ifndef TEXINFO_H
#define TEXINFO_H

#include <stddef.h>

#include "use_interpreter_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "option_types.h"

typedef struct TRANSFORMATION_NAME_FLAG {
    const char *name;
    unsigned long flag;
} TRANSFORMATION_NAME_FLAG;

/* tree transformations, keep in sync with
   Texinfo::Common::valid_tree_transformations and STTF flags just below */
#define TT_TYPES_LIST \
  tt_type(complete_tree_nodes_menus) \
  tt_type(complete_tree_nodes_missing_menu) \
  tt_type(fill_gaps_in_sectioning) \
  tt_type(insert_nodes_for_sectioning_commands) \
  tt_type(move_index_entries_after_items) \
  tt_type(regenerate_master_menu) \
  tt_type(relate_index_entries_to_table_items)

/* sync relevant flags with swig/texinfo.i */
/* document tree transformations selection flags */
#define STTF_complete_tree_nodes_menus              0x0001
#define STTF_complete_tree_nodes_missing_menu       0x0002
#define STTF_fill_gaps_in_sectioning                0x0004
#define STTF_insert_nodes_for_sectioning_commands   0x0008
#define STTF_move_index_entries_after_items         0x0010
#define STTF_regenerate_master_menu                 0x0020
#define STTF_relate_index_entries_to_table_items    0x0040

/* document structuring selection flags */
#define STTF_floats                                 0x0080
#define STTF_no_warn_non_empty_parts                0x0100
#define STTF_nodes_tree                             0x0200
#define STTF_setup_index_entries_sort_strings       0x0400

/* for complete_tree_nodes_menus, complete_tree_nodes_missing_menu
   and regenerate_master_menu */
#define STTF_complete_menus_use_sections            0x0800

/* not strictly a structuring and transformations selection flags */
/* used to mark that splitting is possible for a format */
#define STTF_split                                  0x1000
/* used to mark that internal links can be output for that format */
#define STTF_internal_links                         0x2000
/* mark a format handled by texi2dvi */
#define STTF_texi2dvi_format                        0x4000

unsigned long txi_find_tree_transformation (const char *transformation_name);

void txi_set_base_default_options (OPTIONS_LIST *main_program_set_options,
                              const char *locale_encoding,
                              const char *console_output_encoding,
                              const char *program_file);

void txi_general_output_strings_setup (int use_external_translate_string);

void txi_setup_main_load_interpreter (enum interpreter_use embedded_interpreter,
                      int texinfo_uninstalled,
                      const char *datadir,
                      const char *converter_datadir,
                      const char *converter_libdir,
                      const char *t2a_builddir,
                      const char *t2a_srcdir, int updirs,
                      int *argc_ref, char ***argv_ref, char ***env_ref,
                      const char *version_checked);

void txi_converter_output_format_setup (const char *converted_format,
                                        const char *external_module);

CONVERTER_INITIALIZATION_INFO *txi_converter_format_defaults (
                               const char *converted_format,
                               const char *external_module,
                               OPTIONS_LIST *customizations);

void txi_parser (const char *file_path, const VALUE_LIST *values,
                 OPTIONS_LIST *options);

DOCUMENT *txi_parse_texi_file (const char *input_file_path, int *status);

void txi_complete_document (DOCUMENT *document, unsigned long flags,
                            int format_menu);

void txi_converter_initialization_setup (CONVERTER_INITIALIZATION_INFO *conf,
                                    const DEPRECATED_DIRS_LIST *deprecated_dirs,
                                    const OPTIONS_LIST *customizations);
int txi_load_init_file (const char *file,
                        enum interpreter_use embedded_interpreter);
void txi_stop_interpreter (enum interpreter_use embedded_interpreter);

CONVERTER *txi_converter_setup (const char *external_module,
                     const char *converted_format,
                     const CONVERTER_INITIALIZATION_INFO *converter_init_info);

char *txi_converter_output (CONVERTER *converter, DOCUMENT *document,
                            const char *external_module);
char *txi_converter_convert (CONVERTER *converter, DOCUMENT *document);

CONVERTER_TEXT_INFO *txi_sort_element_counts (const char *external_module,
                               const OPTIONS_LIST *customizations,
                               DOCUMENT *document, int use_options,
                               int count_words);

size_t txi_output_parser_error_messages (DOCUMENT *document,
                                         const char *message_encoding,
                                         int no_warn, int use_filename);
size_t txi_output_document_error_messages (DOCUMENT *document,
                                           const char *message_encoding,
                                           int no_warn, int use_filename);
size_t txi_output_converter_error_messages (CONVERTER *converter,
                                            const char *message_encoding,
                                            int no_warn, int use_filename);

void txi_destroy_document (DOCUMENT *document, const char *external_module,
                           int remove_references);

void txi_converter_remove_output_units (CONVERTER *converter,
                                        const char *external_module);
void txi_destroy_converter (CONVERTER *converter, const char *external_module);

int txi_close_file_stream (const char *program_file,
                           const FILE_STREAM *file_stream);

char *txi_builtin_default_css_text (void);
#endif
