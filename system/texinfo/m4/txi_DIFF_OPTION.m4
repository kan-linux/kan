dnl Copyright 2002-2025 Free Software Foundation, Inc.
dnl
dnl This file is free software; as a special exception the author gives
dnl unlimited permission to copy and/or distribute it, with or without
dnl modifications, as long as this notice is preserved.
dnl
dnl This program is distributed in the hope that it will be useful, but
dnl WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
dnl implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AC_DEFUN([txi_DIFF_OPTIONS],
[
# check whether diff accepts the -u option (not on HP-UX).
AC_MSG_CHECKING(whether diff accepts -u)
diff_accepts_u_option=no
echo foo >conftest.dtx
echo foo | diff -u - conftest.dtx >/dev/null 2>&1
error_status_diff_u=$?
if test $error_status_diff_u = 0; then
  diff_accepts_u_option=yes
fi
AC_MSG_RESULT($diff_accepts_u_option)
rm -f conftest.dtx

DIFF_U_OPTION=
if test "z$diff_accepts_u_option" = 'zyes' ; then
  DIFF_U_OPTION=-u
fi

# check whether diff accepts the -a option (only needed for GNU diff).
AC_MSG_CHECKING(whether diff accepts -a)
diff_accepts_a_option=no
echo foo >conftest.dtx
echo foo | diff -a - conftest.dtx >/dev/null 2>&1
error_status_diff_a=$?
if test $error_status_diff_a = 0; then
  diff_accepts_a_option=yes
fi
AC_MSG_RESULT($diff_accepts_a_option)
rm -f conftest.dtx

DIFF_A_OPTION=
if test "z$diff_accepts_a_option" = 'zyes' ; then
  DIFF_A_OPTION=-a
fi

# check whether diff should have --strip-trailing-cr (may be needed on MinGW)
diff_accepts_cr_option=no
if echo $host_os | grep mingw >/dev/null ; then
  AC_MSG_CHECKING(whether diff accepts --strip-trailing-cr)
  echo foo >conftest.dtx
  echo foo | diff --strip-trailing-cr - conftest.dtx >/dev/null 2>&1
  error_status_diff_cr=$?
  if test $error_status_diff_cr = 0; then
    diff_accepts_cr_option=yes
  fi
  AC_MSG_RESULT($diff_accepts_cr_option)
  rm -f conftest.dtx
fi

DIFF_CR_OPTION=
if test "z$diff_accepts_cr_option" = 'zyes' ; then
  DIFF_CR_OPTION='--strip-trailing-cr'
fi

DIFF_OPTIONS="$DIFF_A_OPTION $DIFF_U_OPTION $DIFF_CR_OPTION"
AC_SUBST([DIFF_OPTIONS])
])
