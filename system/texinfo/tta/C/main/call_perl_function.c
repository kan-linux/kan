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

/* for BYTES_STRING */
#include "document_types.h"
/*
#include "tree_types.h"
#include "converter_types.h"
 */
/* non_perl_* has_perl_interpreter */
#include "xs_utils.h"
#include "call_perl_function.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

/* Used to create a "Perl-internal" string that represents a sequence
   of Unicode codepoints with no specific encoding. */
SV *
newSVpv_utf8 (const char *str, STRLEN len)
{
  SV *sv;
  dTHX;

  sv = newSVpv (str, len);
  SvUTF8_on (sv);
  return sv;
}

/* Used to create a string considered as bytes by perl */
SV *
newSVpv_byte (const char *str, STRLEN len)
{
  SV *sv;
  dTHX;

  sv = newSVpv (str, len);
  SvUTF8_off (sv);
  return sv;
}

char *
call_nodenamenormalization_unicode_to_transliterate (const char *text,
                                        int in_test, int no_unidecode)
{
  int count;
  char *result;
  char *result_ret;
  STRLEN len;
  SV *result_sv;

  dTHX;

  /* this happens if the customization variable TEST is set while there
     is no embedded Perl */
  if (!has_perl_interpreter ())
    return 0;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 3);

  PUSHs(sv_2mortal (newSVpv_utf8 (text, 0)));
  PUSHs(sv_2mortal (newSViv (in_test)));
  PUSHs(sv_2mortal (newSViv (no_unidecode)));
  PUTBACK;

  count = call_pv (
    "Texinfo::Convert::NodeNameNormalization::_unicode_to_transliterate",
    G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("_unicode_to_transliterate should return 1 item\n");

  result_sv = POPs;
  result_ret = SvPVutf8 (result_sv, len);
  result = non_perl_strndup (result_ret, len);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

char *
call_translations_translate_string (const char *string, const char *in_lang,
                                    const char *in_encoded_lang,
                                    const char *translation_context)
{
  int count;
  char *result;
  const char *result_ret;
  STRLEN len;
  SV *result_sv;

  dTHX;

  /* this happens if USE_LIBINTL_PERL_IN_XS is set while there is no
     embedded Perl */
  if (!has_perl_interpreter ())
    return 0;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 3);

  PUSHs(sv_2mortal (newSVpv_utf8 (string, 0)));
  PUSHs(sv_2mortal (newSVpv_utf8 (in_lang, 0)));
  PUSHs(sv_2mortal (newSVpv_byte (in_encoded_lang, 0)));
  PUSHs(sv_2mortal (newSVpv_utf8 (translation_context, 0)));
  PUTBACK;

  count = call_pv (
    "Texinfo::Translations::translate_string",
    G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("translate_string should return 1 item\n");

  result_sv = POPs;
  result_ret = SvPVutf8 (result_sv, len);
  result = non_perl_strndup (result_ret, len);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

void *
call_setup_collator (int use_unicode_collation, const char *locale_lang)
{
  int count;
  void *result = 0;
  SV *collator_sv = 0;

  dTHX;

  /* this happens if XS_STRXFRM_COLLATION_LOCALE=undef while there is
     no embedded Perl */
  if (!has_perl_interpreter ())
    return 0;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs(sv_2mortal (newSViv (use_unicode_collation)));
  PUSHs(sv_2mortal (newSVpv (locale_lang, 0)));

  PUTBACK;

  count = call_pv ("Texinfo::Indices::_setup_collator",
                   G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("_setup_collator should return 1 item\n");

  collator_sv = POPs;
  if (SvOK (collator_sv))
    {
      SvREFCNT_inc (collator_sv);
      result = (void *) collator_sv;
    }

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

BYTES_STRING *
call_collator_getSortKey (const void *collator_sv, const char *string)
{
  BYTES_STRING *result;
  unsigned char *result_ret;
  STRLEN len;
  SV *result_sv;
  int count;

  dTHX;

  result = (BYTES_STRING *) non_perl_malloc (sizeof (BYTES_STRING));
  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 2);

  PUSHs((SV *) collator_sv);
  PUSHs(sv_2mortal (newSVpv_utf8 (string, 0)));

  PUTBACK;

  count = call_method ("getSortKey",
                       G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("getSortKey should return 1 item\n");

  result_sv = POPs;
  result_ret = (unsigned char *)SvPVbyte (result_sv, len);
  result->len = (size_t) len;
  result->bytes = (unsigned char *)
    non_perl_malloc (sizeof (unsigned char) * len);
  memcpy (result->bytes, result_ret, result->len);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}

/* Used to load the Texinfo modules similar to texi2any.pl or
   load_txi_modules.pl, but trimmed down and from C.  This is used
   from the SWIG Perl interface to allow calls to Perl functions from C */

static void
call_modulepath_init (int updirs, const char *perl_modules_dir,
                      const char *converter_libdir,
                      const char *datadir)
{
  int count;

  dTHX;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 5);

  /* call to Modulepath init for the in-build case */
  if (updirs >= 0)
    {
      PUSHs(newSV (0));
      PUSHs(newSV (0));
      PUSHs(newSV (0));
      PUSHs(sv_2mortal (newSVpv ("updirs", 0)));
      PUSHs(sv_2mortal (newSViv (updirs)));
    }
  else
    {
      /* call to Modulepath init for the installed modules case */
      PUSHs(sv_2mortal (newSVpv_byte (perl_modules_dir, 0)));
      PUSHs(sv_2mortal (newSVpv_byte (converter_libdir, 0)));
      PUSHs(sv_2mortal (newSVpv_byte (datadir, 0)));
      PUSHs(sv_2mortal (newSVpv ("installed", 0)));
      PUSHs(sv_2mortal (newSViv (1)));
    }
  PUTBACK;

  count = call_pv ("Texinfo::ModulePath::init",
                   G_DISCARD|G_SCALAR);

  SPAGAIN;

  if (count != 0)
    croak ("ModulePath init should return 0 item\n");

  PUTBACK;

  FREETMPS;
  LEAVE;
}

/* Initializations similar to those in texi2any.pl or load_txi_modules.pl
   but simplified, as we want to initialize only the modules called from
   libtexinfo. */
/* return -1 (or croak) if the modules could not be loaded.
   return 0 if DocumentXS XS extension was not loaded.
   return 1 if DocumentXS XS extension was loaded.
 */
int
call_eval_load_texinfo_modules (int texinfo_uninstalled,
          const char *t2a_builddir, int updirs, const char *modules_dir,
          const char *converter_libdir, const char *datadir)
{
  SV *sv_inc_str;
  SV *document_loader_sv;
  char *str;
  AV *INC;

  dTHX;

  INC = get_av ("INC", 0);

  if (!INC)
    return -1;

  av_unshift (INC, 1);

  if (texinfo_uninstalled)
    sv_inc_str = newSVpvf("%s/perl", t2a_builddir);
  else
    sv_inc_str = newSVpv_byte(modules_dir, 0);
  av_store (INC, 0, sv_inc_str);

  str = "require Texinfo::ModulePath;\n";

  eval_pv (str, TRUE);

  if (texinfo_uninstalled)
    call_modulepath_init (updirs, 0, 0, 0);
  else
    call_modulepath_init (-1, modules_dir, converter_libdir,
                          datadir);

  str = "use Texinfo::Document;\n"
        "use Texinfo::Translations;\n"
        "use Texinfo::Convert::NodeNameNormalization;\n"
        "use Texinfo::Indices;\n";
  eval_pv (str, TRUE);

  /* should be false if DocumentXS was not loaded */
  document_loader_sv = get_sv ("Texinfo::DocumentXS::XS_package", 0);

  /* TODO add more from load_txi_modules.pl when there is code to test?
     For example loading messages for error messages translation and
     loading translated strings from LocaleData?
   */

  return SvTRUE (document_loader_sv);
}


