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

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "tree_types.h"
#include "converter_types.h"
#include "document_types.h"
#include "build_perl_info.h"
#include "get_perl_info.h"
#include "get_converter_perl_info.h"
#include "xs_utils.h"
/* retrieve_converter */
#include "converter.h"
#include "call_conversion_perl.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */


int
call_config_GNUT_load_init_file (const char *file_path)
{
  int count;

  dTHX;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 1);

  PUSHs(sv_2mortal (newSVpv_byte (file_path, 0)));

  PUTBACK;

  count = call_pv ("Texinfo::Config::GNUT_load_init_file",
                   G_VOID);

  SPAGAIN;

  if (count != 0)
    croak ("Texinfo::Config::GNUT_load_init_file should not return anything\n");

  PUTBACK;

  FREETMPS;
  LEAVE;

  return 1;
}

CONVERTER *
get_sv_converter (SV *sv_in, const char *warn_string)
{
  size_t converter_descriptor = 0;
  CONVERTER *converter = 0;
  SV** converter_descriptor_sv;
  HV *hv_in;
  char *key = "converter_descriptor";

  dTHX;

  hv_in = (HV *)SvRV (sv_in);
  converter_descriptor_sv = hv_fetch (hv_in, key, strlen (key), 0);
  if (converter_descriptor_sv)
    {
      converter_descriptor = (size_t) SvIV (*converter_descriptor_sv);
      converter = retrieve_converter (converter_descriptor);
    }
  else if (warn_string)
    {
      fprintf (stderr, "ERROR: %s: no %s\n", warn_string, key);
      return 0;
    }
  if (! converter && warn_string)
    {
      fprintf (stderr, "ERROR: %s: no converter %zu\n", warn_string,
                                                      converter_descriptor);
    }
  return converter;
}

CONVERTER_INITIALIZATION_INFO *
call_module_converter_defaults (const char *module_name,
                                OPTIONS_LIST *customizations)
{
  SV *options_list_sv;
  int count;
  SV *result_sv;
  CONVERTER_INITIALIZATION_INFO *result;

  dTHX;

  options_list_sv
    = build_sv_options_from_options_list (customizations, 0);

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs(sv_2mortal (newSVpv (module_name, 0)));
  PUSHs(sv_2mortal (SvREFCNT_inc (options_list_sv)));
  PUTBACK;

  count = call_method ("converter_defaults",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("call: module converter_defaults should return 1 item\n");

  result_sv = POPs;

  result = get_converter_info_from_sv (result_sv, module_name, 0);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

CONVERTER *
call_module_converter (const char *module_name,
                       const CONVERTER_INITIALIZATION_INFO *conf)
{
  SV *converter_info_sv;
  int count;
  CONVERTER *result;
  SV *result_sv;

  dTHX;

  converter_info_sv
    = build_sv_converter_info_from_converter_initialization_info (conf, 0);

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs(sv_2mortal (newSVpv (module_name, 0)));
  PUSHs(sv_2mortal (SvREFCNT_inc (converter_info_sv)));
  PUTBACK;

  count = call_method ("converter",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("call: module converter should return 1 item\n");

  result_sv = POPs;
  result = get_sv_converter (result_sv, "call_module_converter");

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

static void
call_object_perl_converter_remove_output_units (const CONVERTER *self)
{
  int count;

  dTHX;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 1);

  PUSHs(sv_2mortal (SvREFCNT_inc ((SV *) self->sv)));
  PUTBACK;

  count = call_method ("perl_converter_remove_output_units",
                       G_DISCARD|G_SCALAR);

  SPAGAIN;

  if (count != 0)
    croak ("call: object perl_converter_remove_output_units should return 0 item\n");

  PUTBACK;

  FREETMPS;
  LEAVE;
}

void
release_converter_output_units_remove_perl_output_units (CONVERTER *self)
{
  converter_release_output_units_built (self);
  call_object_perl_converter_remove_output_units (self);
}

void
call_object_converter_perl_release (const CONVERTER *self)
{
  int count;

  dTHX;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 1);

  PUSHs(sv_2mortal (SvREFCNT_inc ((SV *) self->sv)));
  PUTBACK;

  count = call_method ("converter_perl_release",
                       G_DISCARD|G_SCALAR);

  SPAGAIN;

  if (count != 0)
    croak ("call: object converter_perl_release should return 0 item\n");

  PUTBACK;

  FREETMPS;
  LEAVE;
}

/* call converter->output and converter->output_files_information if needed
   and return an OUTPUT_TEXT_FILES_INFO which contains both the resulting text
   and the output files information, if not already in the converter. */
OUTPUT_TEXT_FILES_INFO *
call_converter_output (CONVERTER *self, DOCUMENT *document)
{
  SV *document_sv;
  int count;
  OUTPUT_TEXT_FILES_INFO *result;
  const char *result_ret;
  STRLEN len;
  SV *result_sv;

  dTHX;

  /* The Perl document object should not have been built already when called
     from C texi2any.  If called by other codes it may become relevant to
     check if there is already a document->hv and reuse it.
   */
  document_sv = build_minimal_document (document);

  result = (OUTPUT_TEXT_FILES_INFO *)
    non_perl_malloc (sizeof (OUTPUT_TEXT_FILES_INFO));

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs(sv_2mortal (SvREFCNT_inc ((SV *) self->sv)));
  PUSHs(sv_2mortal (SvREFCNT_inc (document_sv)));
  PUTBACK;

  count = call_method ("output",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("call: converter output should return 1 item\n");

  result_sv = POPs;
  result_ret = SvPVutf8 (result_sv, len);
  result->text = non_perl_strndup (result_ret, len);
  result->output_files_information = 0;

  PUTBACK;

  FREETMPS;
  LEAVE;

  /* already set in the converter, no need to get from Perl.
     Case of converters with file opening implemented in C, called through
     XS interfaces, that would not transfer files information to Perl.
   */
  if (self->output_files_information.opened_files.number > 0
      || self->output_files_information.unclosed_files.number > 0)
    return result;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 1);

  PUSHs(sv_2mortal (SvREFCNT_inc ((SV *) self->sv)));
  PUTBACK;

  count = call_method ("output_files_information",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("call: converter output_files_information should return 1 item\n");

  result_sv = POPs;
  result->output_files_information = get_output_files_information (result_sv);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

char *
call_sort_element_counts (const CONVERTER *self, DOCUMENT *document,
                          int use_sections, int count_words)
{
  SV *document_sv;
  int count;
  const char *result_ret;
  char *result;
  STRLEN len;
  SV *result_sv;

  dTHX;

  /* get the document and increase refcount */
  if (document->hv)
    {
      /* reuse if the document hv already exists */
      document_sv = newRV_inc ((SV *) document->hv);
    }
  else
    {
      document_sv = build_minimal_document (document);
      SvREFCNT_inc (document_sv);
    }

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 4);

  PUSHs(sv_2mortal (SvREFCNT_inc ((SV *) self->sv)));
  PUSHs(sv_2mortal (document_sv));
  PUSHs(sv_2mortal (newSViv (use_sections)));
  PUSHs(sv_2mortal (newSViv (count_words)));
  PUTBACK;

  count = call_method ("sort_element_counts",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("call: sort_element_counts should return 1 item\n");

  result_sv = POPs;
  result_ret = SvPVutf8 (result_sv, len);
  result = non_perl_strndup (result_ret, len);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

