# man-arg-snapdir.m4 serial 1
dnl MAN_ARG_SNAPDIR
dnl Add a --with-snapdir option.

AC_DEFUN([MAN_ARG_SNAPDIR],
[
AC_ARG_WITH([snapdir],
[AS_HELP_STRING([--with-snapdir=DIR], [use snap system directory DIR [DIR=/snap]])],
	[if test "$withval" = "yes" || test "$withval" = "no"
	 then
		AC_MSG_ERROR([--with-snapdir requires an argument])
	 else
		snapdir="$withval"
	 fi],
	[: ${snapdir=/snap}])
AC_SUBST([snapdir])
])
