/* reader_api.h - interface of reader.c */
#ifndef READER_API_H
#define READER_API_H
 
#include <stddef.h>
 
#include "reader_types.h"
#include "tree_types.h"
#include "document_types.h"

/* hide READER structure fields and types */
struct READER;

struct READER *retrieve_reader_descriptor (size_t reader_descriptor);
size_t txi_register_new_reader (ELEMENT *tree, DOCUMENT *document);

const READER_TOKEN *txi_reader_read (struct READER *reader);
const READER_TOKEN *txi_reader_skip_children (struct READER *reader,
                                              const ELEMENT *element);

#endif
