/* txi_config.h - declarations of txi_config.c */
#ifndef TXI_CONFIG_H
#define TXI_CONFIG_H

/* Copyright 2010-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */


#include <stdarg.h>
#include <stddef.h>

#include "option_types.h"

OPTIONS_LIST *GNUT_initialize_customization (char * const *real_command_name,
                               OPTIONS_LIST *main_options_defaults,
                               OPTIONS_LIST *main_cmdline_options);

/* called from Perl */
OPTION *texinfo_get_conf_by_name (const char *var);
OPTION *texinfo_find_command_line_option_name (const char *option_name);
OPTION *texinfo_find_init_file_option_name (const char *option_name);
void texinfo_command_line_option_add_option_number (size_t number);

/* called from main C program */
OPTION *GNUT_get_conf (size_t number);
char *GNUT_decode_input (char *text);
char *GNUT_encode_message (char *text);
int GNUT_set_customization_default (size_t number, const char *value);
void GNUT_set_from_cmdline (OPTIONS_LIST *options_list, size_t number,
                            const char *value);
int GNUT_set_from_init_file (const char *option_name,
                             const char *option_value);

/* called from main C program and Perl */
int txi_config_add_to_option_list (OPTION *option, const char *value,
                                   int prepend);
int txi_config_remove_from_option_list (OPTION *option, const char *value);

void txi_config_document_warn (const char *format, ...);

void texinfo_set_format_from_init_file (const char *init_file_format_in);
char *GNUT_get_format_from_init_file (void);
#endif
