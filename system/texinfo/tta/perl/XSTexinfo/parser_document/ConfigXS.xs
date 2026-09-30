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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#include <stddef.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "option_types.h"
#include "txi_config.h"
#include "customization_options.h"
#include "get_perl_info.h"
#include "build_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */


MODULE = Texinfo::ConfigXS		PACKAGE = Texinfo::ConfigXS

PROTOTYPES: ENABLE

SV *
texinfo_get_conf (option_name)
        const char *option_name = (char *)SvPVbyte_nolen($arg);
      PREINIT:
        OPTION *option;
      CODE:
        option = texinfo_get_conf_by_name (option_name);
        if (option)
          RETVAL = build_sv_option (option, 0);
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

int
texinfo_set_from_init_file (option_name, SV *value)
        const char *option_name = (char *)SvPVbyte_nolen($arg);
      PREINIT:
        OPTION *option;
        int status = 0;
      CODE:
        option = texinfo_find_init_file_option_name (option_name);
        if (option)
          {
            int get_sv_status;
            get_sv_status = get_sv_option (option, value, 0, 0, 0);
            if (get_sv_status == 0)
              status = 1;
            texinfo_command_line_option_add_option_number (option->number);
          }
        RETVAL = status;
    OUTPUT:
        RETVAL

int
texinfo_add_to_option_list (option_name, SV *values, ...)
        const char *option_name = (char *)SvPVbyte_nolen($arg);
      PROTOTYPE: $$;$
      PREINIT:
        int status = 0;
        int prepend = 0;
        OPTION *option;
      CODE:
        if (items > 2 && SvOK(ST(2)))
          prepend = SvIV (ST(2));
        option = texinfo_find_command_line_option_name (option_name);
        if (option)
          {
            if (option->type == GOT_bytes_string_list
                || option->type == GOT_file_string_list)
              status = 1;
            else if (option->type == GOT_char_string_list)
              status = 2;
          }
        if (status && SvOK (values))
          {
            SSize_t i;
            AV *values_av = (AV *)SvRV (values);
            SSize_t values_nr = AvFILL (values_av) +1;

            for (i = 0; i < values_nr; i++)
              {
                SV **value_sv = av_fetch (values_av, i, 0);
                if (value_sv && SvOK (*value_sv))
                  {
                    char *value;
                    if (status == 1)
                      value = SvPVbyte_nolen(*value_sv);
                    else
                      value = SvPVutf8_nolen(*value_sv);
                    txi_config_add_to_option_list (option, value, prepend);
                  }
              }
          }

        RETVAL = status;
    OUTPUT:
        RETVAL

int
texinfo_remove_from_option_list (option_name, SV *values)
        const char *option_name = (char *)SvPVbyte_nolen($arg);
      PREINIT:
        OPTION *option;
        int status = 0;
      CODE:
        option = texinfo_find_command_line_option_name (option_name);
        if (option)
          {
            if (option->type == GOT_bytes_string_list
                || option->type == GOT_file_string_list)
              status = 1;
            else if (option->type == GOT_char_string_list)
              status = 2;
          }
        if (status && SvOK (values))
          {
            SSize_t i;
            AV *values_av = (AV *)SvRV (values);
            SSize_t values_nr = AvFILL (values_av) +1;

            for (i = 0; i < values_nr; i++)
              {
                SV **value_sv = av_fetch (values_av, i, 0);
                if (value_sv && SvOK (*value_sv))
                  {
                    char *value;
                    if (status == 1)
                      value = SvPVbyte_nolen (*value_sv);
                    else
                      value = SvPVutf8_nolen (*value_sv);
                    txi_config_remove_from_option_list (option, value);
                  }
              }
          }

        RETVAL = status;
    OUTPUT:
        RETVAL

void
texinfo_set_format_from_init_file (format_name)
        const char *format_name = (char *)SvPVbyte_nolen($arg);

