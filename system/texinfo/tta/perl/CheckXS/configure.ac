# configure.ac for TestXS
# Copyright 2015-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AC_INIT([GNU Texinfo], [7.3])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIRS([build-aux/m4 ../../m4])

AC_PATH_PROG([PERL], [perl])

AC_CANONICAL_HOST
txi_PERL_CONF

AC_ARG_VAR([PERL_EXT_CFLAGS], [Compiler flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_CPPFLAGS], [C preprocessor flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_LDFLAGS], [Linker flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_CC], [Compiler for a Perl extension])

if test -n "$PERL_EXT_CC" ; then
  CC=$PERL_EXT_CC
else
  # It's essential that we use the same compiler that was used to build
  # Perl.  Otherwise Perl's "config.h" will be incorrect.  This overrides
  # the check in AC_PROG_CC below.
  CC=$PERL_CONF_cc
fi

# Wipe cache values in case -C was given at the top level
ac_cv_prog_CC= ; unset ac_cv_prog_CC
ac_cv_prog_ac_ct_CC= ; unset ac_cv_prog_ac_ct_CC

CFLAGS=$PERL_EXT_CFLAGS
CPPFLAGS=$PERL_EXT_CPPFLAGS
LDFLAGS=$PERL_EXT_LDFLAGS

AC_PROG_CC

LT_INIT([disable-static dlopen])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
