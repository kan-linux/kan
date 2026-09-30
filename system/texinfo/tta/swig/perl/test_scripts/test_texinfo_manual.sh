#! /bin/sh
#
# Copyright 2010-2026 Free Software Foundation, Inc.
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

if [ "z$testdir" = 'z' ]; then
  testdir=.
fi

if test z"$srcdir" = "z"; then
  srcdir=.
fi

# for DIFF_OPTIONS and PERL
. $testdir/../../../tta/defs || exit 1

tname=test_texinfo_manual

return_code=0

$PERL -w ${srcdir}/parse_refold.pl ${srcdir}/../../../doc/texinfo.texi out_${tname}
ret=$?
if test $ret != 0 ; then
  echo "F ${tname}: $ret"
  return_code=1
fi

diff $DIFF_OPTIONS ${srcdir}/../../../doc/texinfo.texi out_${tname}/texinfo.texi
diff_ret=$?
if test $diff_ret != 0 ; then
  return_code=1
elif test $return_code = 0 ; then
  rm -f out_${tname}/*.texi
fi

if test $return_code = 0 ; then
  rmdir out_${tname}
fi

exit $return_code
