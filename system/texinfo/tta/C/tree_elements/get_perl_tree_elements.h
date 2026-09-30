/* get_perl_tree_elements.h - declarations for get_perl_tree_elements.c */
#ifndef GET_PERL_TREE_ELEMENTS_H
#define GET_PERL_TREE_ELEMENTS_H

#include "EXTERN.h"
#include "perl.h"

#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"

/* do not depend on READER structure implementation details */
struct READER;

struct READER *get_sv_reader_reader (SV *sv_in);

ELEMENT *new_element_from_sv (DOCUMENT *document, const SV *element_hash,
                              CONVERTER *converter);

LANG_TRANSLATION *get_lang_translations_sv (SV *lang_translations_sv,
                                            const char *command_line_encoding);

NAMED_STRING_ELEMENT_LIST *get_replaced_substrings (SV *replaced_substrings_sv);

#endif
