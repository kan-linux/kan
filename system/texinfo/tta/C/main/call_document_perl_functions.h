/* call_document_perl_function.h - API to interact with perl from C code */
#ifndef CALL_DOCUMENT_PERL_FUNCTION_H
#define CALL_DOCUMENT_PERL_FUNCTION_H

#include "document_types.h"

void call_document_remove_document_references (DOCUMENT *document,
                                     int remove_references);

#endif
