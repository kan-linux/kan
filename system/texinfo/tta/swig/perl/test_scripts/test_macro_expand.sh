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

tname=test_non_ascii_in_macro

return_code=0

$PERL -w ${srcdir}/parse_refold.pl ${srcdir}/tests/${tname}/${tname}.texi out_${tname}
ret=$?
if test $ret != 0 ; then
  echo "F ${tname}: $ret"
  return_code=1
fi

diff $DIFF_OPTIONS -r ${srcdir}/tests/${tname} out_${tname}
diff_ret=$?
if test $diff_ret != 0 ; then
  return_code=1
elif test $return_code = 0 ; then
  rm -f out_${tname}/${tname}.texi
fi

if test $return_code = 0 ; then
  rmdir out_${tname}
fi

exit $return_code
