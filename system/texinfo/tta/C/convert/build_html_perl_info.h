/* build_html_perl_info.h - declarations for build_html_perl_info.c */
#ifndef BUILD_HTML_PERL_INFO_H
#define BUILD_HTML_PERL_INFO_H

#include "EXTERN.h"
#include "perl.h"

#include "tree_types.h"
#include "converter_types.h"

void html_pass_htmlxref (HTMLXREF_MANUAL_LIST *htmlxref_list, SV *converter_sv);

void html_pass_conversion_initialization (CONVERTER *converter,
                                          SV *converter_sv);
void html_pass_converter_initialization_state (const CONVERTER *converter,
                                               HV *converter_hv);

void html_pass_converter_setup_state (const CONVERTER *converter,
                                      SV *converter_sv);

void set_document_units_handle (CONVERTER *converter, SV *converter_sv);

SV *build_html_files_source_info
                          (const FILE_SOURCE_INFO_LIST *files_source_info);

SV *build_replaced_substrings (NAMED_STRING_ELEMENT_LIST *replaced_substrings);

void build_pending_footnotes (AV *av, HTML_PENDING_FOOTNOTE_STACK *stack);

void build_simpletitle (const CONVERTER *converter, HV *converter_info_hv);
void pass_jslicenses (const JSLICENSE_CATEGORY_LIST *jslicenses,
                      HV *converter_info_hv);

SV *pass_sv_converter_info (const CONVERTER *converter,
                            const char *converter_info, SV *converter_sv);
#endif
