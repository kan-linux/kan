# man-gnu-nroff.m4 serial 4
dnl
dnl Check to see if nroff is GNU nroff, take nroff path as arg.
dnl
AC_DEFUN([MAN_PROG_GNU_NROFF],
[AC_MSG_CHECKING([whether nroff is GNU nroff])

AC_CACHE_VAL([man_cv_prog_gnu_nroff],
  [if test `$1 <<EOF | tr -d '\n'
\\n(.g
EOF
` = 1
   then
	man_cv_prog_gnu_nroff=yes
   else
	man_cv_prog_gnu_nroff=no
   fi])

if test "$man_cv_prog_gnu_nroff" = "yes"
then
	AC_CHECK_PROGS([preconv], [gpreconv preconv])
	if test -z "$preconv"
	then
		AC_MSG_ERROR([nroff is GNU nroff but preconv is missing; groff < 1.20 is not supported])
	fi

	AC_DEFINE([GNU_NROFF], [1], [Define if nroff is GNU nroff.])
fi
AC_MSG_RESULT([$man_cv_prog_gnu_nroff])
])
