#! /bin/sh

if test z"$1" = "z" ; then
  echo "usage: $0 auto"
  exit 1
fi

VERS=$1
if test z"$VERS" = "zauto" ; then 
  VERS=`grep '^AC_INIT' ../configure.ac | sed -e 's/^[^0-9]*//' -e 's/].*//'`
  echo vers is $VERS
  if test z"$VERS" = "z" ; then
    echo "cannot proceed"
    exit 1
  fi
fi
 

find perl/Texinfo/ -name '*.pm' -o -name '*.pm.in' | xargs \
  perl -pi -e 's/\$VERSION = '"'([0-9.]+[^']*)'"'/\$VERSION = '"'$VERS'"'/'

# change also tta/configure.ac version, it is used to set
# XS_VERSION through Makefile.am.  XS_VERSION in XS objects in turn is
# used in xsubpp generated code in XS object bootstrap function called
# by XSLoader.pm init through DynaLoader to check that the XS modules
# versions are the same than the XSLoader.pm Perl module $VERSION.
perl -pi -e "s/^(AC_INIT\(\[[^\]]+\], *)\[([0-9.]+)\]/\$1\[$VERS\]/" configure.ac
perl -pi -e "s/^(AC_INIT\(\[[^\]]+\], *)\[([0-9.]+)\]/\$1\[$VERS\]/" perl/CheckXS/configure.ac

# do the same for TEXINFO_DTD_VERSION.  It is not easy to pass information
# from the top configure to the subdirectory configure.

TEXINFO_DTD_VERS=`grep '^TEXINFO_DTD_VERSION' ../configure.ac | sed -e 's/^[^0-9]*//' -e 's/ *$//'`
echo TEXINFO_DTD_VERSION is $TEXINFO_DTD_VERS
perl -pi -e "s/^(TEXINFO_DTD_VERSION *= *)([0-9.]+).*/\${1}$TEXINFO_DTD_VERS/" configure.ac

