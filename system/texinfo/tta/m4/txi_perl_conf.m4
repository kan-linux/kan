# Get Perl configuration variables and set derived variables
dnl Copyright 2019-2026 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.
dnl This file is offered as-is, without any warranty.

dnl Note that $host is used, therefore AC_CANONICAL_HOST should be called
dnl before.

# fetch_conf is a shell function defined in txi_PERL_CONF
AC_DEFUN([txi_LOOKUP_PERL_CONF],
         [AC_MSG_CHECKING([Perl configuration value $1])
          fetch_conf $1
          AC_MSG_RESULT([$conf_value])
          PERL_CONF_$1=$conf_value
])

AC_DEFUN([txi_LOOKUP_PERL_CONF_VALUES],
          [m4_foreach([var], [$1], [txi_LOOKUP_PERL_CONF(var)])
])

# setup variables needed to build XS modules.  PERL needs to
# be defined before calling this macro.
AC_DEFUN([txi_PERL_CONF],
[
# Get Perl configuration variables and set derived variables
b='\'
d='$'
o='@<:@' dnl quadrigraph for [ - see autoconf documentation
c='@:>@' dnl quadrigraph for ]

# This turns a string like "cc='cc';" into a string like "cc".
# Afterwards, convert \ into / in case \ is a path separator,
# so it is not interpreted as a special character by the shell.

sed_script="
s/^$o^=$c*= *//
s/^'//
s/ *; *$//
s/'$d//
s/$b$b/$b//g"
#'

# In general there is no need to remove a carriage return explicitely,
# either there is none to begin with (on Unix, with Cygwin Perl) or
# the shell (case of mingw on MSYS) does it already.  When doing a
# mingw on Cygwin 'fake' cross-compilation using native Perl, however,
# the shell is the Cygwin shell that do not remove carriage returns
# automatically, while the native Perl emits carriage returns.
# we use something complicated because \r does not work in some
# sed implementations.
subst_cr=`printf 's/\r//g'`
fetch_conf ()
{
          conf_value=`${PERL} -V:$[]1 | sed $subst_cr`
          conf_value=`echo $conf_value | sed "$sed_script"`
}

# defines PERL_CONF_cc
txi_LOOKUP_PERL_CONF([cc])

# ccflags: contains any additional C compiler flags desired by the user
# cccdlflags: compilation flags to compile modules to be used to
#             create a shared library that will be used for dynamic loading
# ldflags: contains any additional C loader flags desired by the user
# optimize: contains any optimizer/debugger flag that should be used
# ccdlflags: link flags to link with a shared library for dynamic loading.
#            for example -rpath.
txi_LOOKUP_PERL_CONF_VALUES([[ccflags], [cccdlflags], [ldflags], [optimize],
                            [ccdlflags]])

# NOTE ccflags includes -I and -D flags that are more suited for CPPFLAGS
# and other flags that belong to CFLAGS.  The Perl includes directory
# -I flag is not in ccflags.
# Similarly, ldflags includes -l and -L flags that are more suited for
# LIBS and other flags that belong to LDFLAGS.

# we do not use PERL_CONF_optimize because it often conflicts with
# PERL_EXT_CFLAGS and it is not added by ExtUtils::Embed ccopts.
perl_conf_LIB_CFLAGS="$PERL_CONF_ccflags $PERL_CONF_cccdlflags"
perl_conf_LIB_LDFLAGS="$PERL_CONF_ccdlflags $PERL_CONF_ldflags"

# also corresponds to the ccflags part of ExtUtils::Embed ccopts.
perl_conf_CFLAGS=$PERL_CONF_ccflags

# use the same for executables as for libraries to match ExtUtils::Embed
# ldopts
perl_conf_LDFLAGS=$perl_conf_LIB_LDFLAGS

# ccflags or ExtUtils::Embed ccopts do not include cccdlflags,
# which are needed for libraries
perl_conf_EMBED_LIB_CFLAGS=$PERL_CONF_cccdlflags

# perllibs: The list of libraries needed by Perl only
txi_LOOKUP_PERL_CONF_VALUES([[libperl], [perllibs]])
AC_MSG_CHECKING([libperl link flags])
# Change libperl.so into -lperl to indicate a library dependency to
# libtool.
# Special case for Cygwin to change e.g. cygperl5_22.dll into -lperl
PERL_CONF_libperl=`echo $PERL_CONF_libperl \
             | sed -e 's/^lib/-l/' \
                   -e 's/\..*//' \
                   -e 's/^cygperl.*/-lperl/' `
AC_MSG_RESULT([$PERL_CONF_libperl])

txi_LOOKUP_PERL_CONF_VALUES([[archlibexp], [privlibexp]])
# perl_inc in ExtUtils::Embed
perl_conf_CPPFLAGS="-I${PERL_CONF_archlibexp}/CORE"

# Do not use $PERL_CONF_perllibs as it may require libs that are not installed
# and does not seem to be needed, even though it is in ExtUtils::Embed ldopts.
#perl_conf_LIBS="-L${PERL_CONF_archlibexp}/CORE $PERL_CONF_libperl $PERL_CONF_perllibs"
perl_conf_LIBS="-L${PERL_CONF_archlibexp}/CORE $PERL_CONF_libperl"

# note that ExtUtils::Embed ldopts corresponds roughly to
# perl_conf_LIB_LDFLAGS + perl_conf_LIBS

AM_MISSING_PROG([XSUBPP], [xsubpp])

XSUBPPARGS="-typemap ${PERL_CONF_privlibexp}/ExtUtils/typemap"
AC_SUBST([XSUBPPARGS], [$XSUBPPARGS])

AC_MSG_CHECKING([Platform Perl link for $host])
# Use the -no-undefined flag on MS-Windows.  See info node
# `(gnulib)Libtool and Windows'.  The -L and -l options in
# platform_PERL_LIBADD show where to find the undefined symbols when
# linking against Perl.
case "$host" in *-mingw32 | *-mingw64 | *-cygwin )
  perl_conf_LIB_LDFLAGS="$perl_conf_LIB_LDFLAGS -no-undefined"
  platform_PERL_LIBADD=$perl_conf_LIBS
  # to be used for shared libraries not linked against Perl.
  platform_LDFLAGS='-no-undefined'
  ;;
esac
AC_MSG_RESULT([$perl_conf_LIB_LDFLAGS])

AC_SUBST([perl_conf_LIB_CFLAGS], [$perl_conf_LIB_CFLAGS])
AC_SUBST([perl_conf_CPPFLAGS], [$perl_conf_CPPFLAGS])
AC_SUBST([perl_conf_LDFLAGS], [$perl_conf_LDFLAGS])
AC_SUBST([perl_conf_LIB_LDFLAGS], [$perl_conf_LIB_LDFLAGS])
AC_SUBST([platform_PERL_LIBADD], [$platform_PERL_LIBADD])
AC_SUBST([perl_conf_LIBS], [$perl_conf_LIBS])
AC_SUBST([perl_conf_CFLAGS], [$perl_conf_CFLAGS])
AC_SUBST([perl_conf_EMBED_LIB_CFLAGS], [$perl_conf_EMBED_LIB_CFLAGS])

# not really related to Perl
AC_SUBST([platform_LDFLAGS], [$platform_LDFLAGS])

#PACKAGE_XS_VERSION=`${PERL} -e 'use version; print version->declare('"$PACKAGE_VERSION"')->numify;'`
# to check that Perl module loading the XS objects and XS objects versions
# match.  A hyphen is also turned to a dot for the Perl module version.
# We remove a "dev" suffix because the XS bootstrap functions choke on
# non-numeric versions.
PACKAGE_XS_VERSION=`echo $PACKAGE_VERSION | sed -e 's/-/./g' -e 's/dev$//'`

AC_SUBST([XS_VERSION], [$PACKAGE_XS_VERSION])

])

