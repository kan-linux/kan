/* swig_element_data.h - declarations for elements data */
#ifndef SWIG_ELEMENT_DATA_H
#define SWIG_ELEMENT_DATA_H

#include "swig_element_types.h"

#define cm_flag(name) \
int txi_ext_element_command_is_##name (ELEMENT *e);
TXI_CM_FLAGS_LIST
#undef cm_flag

#define cm_oflag(name) \
int txi_ext_element_command_is_##name (ELEMENT *e);
TXI_CM_OTHER_FLAGS_LIST
#undef cm_oflag

#define ty_flag(name) \
int txi_ext_element_type_is_##name (ELEMENT *element);
TXI_TY_FLAGS_LIST
#undef ty_flag

#endif
