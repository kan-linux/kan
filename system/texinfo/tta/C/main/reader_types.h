/* reader_types.h - types for Texinfo tree reader */
#ifndef READER_TYPES_H
#define READER_TYPES_H

#include "tree_types.h"

#define TXI_READER_TOKEN_CAT_LST \
  trt_cat(ELEMENT_START) \
  trt_cat(ELEMENT_END) \
  trt_cat(TEXT) \
  trt_cat(IGNORABLE_TEXT) \
  trt_cat(EMPTY)

enum reader_token_category {
  #define trt_cat(name) TXI_READ_ ## name,
   TXI_READER_TOKEN_CAT_LST
  #undef trt_cat
};

typedef struct READER_TOKEN {
    const ELEMENT *element;
    enum reader_token_category category;
} READER_TOKEN;

#endif
