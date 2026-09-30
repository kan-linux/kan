/* swig_text_options.h - text options modification interface */
#ifndef SWIG_TEXT_OPTIONS_H
#define SWIG_TEXT_OPTIONS_H

/* implemented in swig_interface.c.  Could be the basis for an interface
   used for setting text options in C.
 */

#include "document_types.h"
#include "swig_text_options_types.h"

struct TEXT_OPTIONS;

#define tico_option_name(name) \
void txi_ext_text_options_set_##name (struct TEXT_OPTIONS *text_options, int i);
 TEXT_INDICATOR_CONVERTER_OPTIONS
#undef tico_option_name

void txi_ext_text_options_set_encoding (TEXT_OPTIONS *text_options,
                                        const char *encoding);

void txi_ext_text_options_clear_expanded_formats (
                               struct TEXT_OPTIONS *text_options);

void txi_ext_text_options_add_expanded_format (
                                       struct TEXT_OPTIONS *text_options,
                                       const char *format);
struct TEXT_OPTIONS *txi_ext_document_text_options (DOCUMENT *document);

#endif
