# man-arg-cache-owner.m4 serial 3
dnl MAN_ARG_CACHE_OWNER
dnl Add an --enable-cache-owner option.

AC_DEFUN([MAN_ARG_CACHE_OWNER],
[
AC_REQUIRE([gl_IDPRIV])
AC_ARG_ENABLE([cache-owner],
[AS_HELP_STRING([--enable-cache-owner[=ARG]], [make system-wide cache files be owned by user ARG [arg=man]])
AS_HELP_STRING([--disable-cache-owner], [don't constrain ownership of system-wide cache files])],
	  [if test "$enableval" = "yes"
	   then
		enableval=man
	   fi
	   if test "$enableval" = "no"
	   then
		man_owner=
	   else
		man_owner=$enableval
	   fi],
	  [if test "$ac_cv_func_getuid" = yes
	   then
		man_owner=man
	   else
		man_owner=
	   fi])
if test "$man_owner" && test "$ac_cv_func_getuid" != yes
then
	AC_MSG_WARN([--enable-cache-owner is not implemented on this platform])
	man_owner=
fi
if test "$man_owner"
then
	cache_top_owner="$man_owner"
	AC_MSG_NOTICE([System-wide cache files will be owned by $man_owner])
	AC_DEFINE_UNQUOTED([MAN_OWNER], ["$man_owner"],
			   [Define as the owner of system-wide cache files.])
else
	cache_top_owner=root
	AC_MSG_NOTICE([System-wide cache files will have unconstrained ownership])
fi
AC_SUBST([man_owner])
AC_SUBST([cache_top_owner])
])
