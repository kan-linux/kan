/* call_perl_function.h - API to interact with perl from C code */
#ifndef CALL_PERL_FUNCTION_H
#define CALL_PERL_FUNCTION_H

/* for BYTES_STRING */
#include "document_types.h"

char *call_nodenamenormalization_unicode_to_transliterate (const char *text,
                                              int in_test, int no_unidecode);

char *call_translations_translate_string (const char *string,
                                          const char *in_lang,
                                          const char *in_encoded_lang,
                                          const char *translation_context);

void *call_setup_collator (int use_unicode_collation,
                                 const char *locale_lang);

BYTES_STRING *call_collator_getSortKey (const void *collator_sv,
                                        const char *string);

int call_eval_load_texinfo_modules (int texinfo_uninstalled,
          const char *t2a_builddir, int updirs, const char *converter_datadir,
          const char *converter_libdir, const char *datadir);

#endif
