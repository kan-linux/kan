# man-bdb.m4 serial 6
dnl MAN_CHECK_BDB(WITH-DB, HEADERS, LIBS, [ACTION-IF-FOUND])
dnl Helper to check Berkeley DB linkage when particular header files and
dnl libraries are included.
dnl Contributed by Duncan Simpson <dps@io.stargate.co.uk> and hacked into a
dnl macro by Colin Watson.

AC_DEFUN([_MAN_CHECK_BDB_HEADER_LIB], [dnl
  if test "$db" != yes
  then
    AS_VAR_PUSHDEF([man_tr_bdb], [man_cv_bdb_header_$1_lib_$2])dnl
    man_saved_LIBS="$LIBS"
    LIBS="$LIBS -l$2"
    AC_CACHE_CHECK([for dbopen from <$1> in -l$2], man_tr_bdb,
       [AC_LINK_IFELSE(
          [AC_LANG_PROGRAM(
             [[#include <$1>]],
             [[dbopen("foo", 0, 0, 0, (void *) 0)]])],
          [AS_VAR_SET([man_tr_bdb], [yes])],
          [AS_VAR_SET([man_tr_bdb], [no])])
       ])
    AS_VAR_IF([man_tr_bdb], [yes],
              [$3
               AC_DEFINE_UNQUOTED([BDB_H], [<$1>],
                                  [Define if you have, and want to use, Berkeley database header files.])
               AC_DEFINE_UNQUOTED([BTREE], [1],
                                  [Define if you have, and want to use, the Berkeley database library.])
               AC_SUBST([DBTYPE], [btree])
               DBLIBS="-l$2"
               db=yes],
              [db=no])
    LIBS="$man_saved_LIBS"
    AS_VAR_POPDEF([man_tr_bdb])dnl
  fi
])

AC_DEFUN([_MAN_CHECK_BDB_HEADER], [dnl
  if test "$db" != yes
  then
    AC_CHECK_HEADERS([$1], [got=yes], [got=no])
    if test "$got" = "yes"
    then
      m4_map_args_w([$2], [_MAN_CHECK_BDB_HEADER_LIB([$1], ], [, [$3])])
    fi
  fi
])

AC_DEFUN([MAN_CHECK_BDB], [dnl
  man_bdb_requested=no
  for trydb in $1
  do
    if test "$db" = "$trydb"
    then
      man_bdb_requested=yes
    fi
  done
  if test "$db" = no || test "$man_bdb_requested" = yes
  then
    m4_map_args_w([$2], [_MAN_CHECK_BDB_HEADER(], [, [$3], [$4])])
  fi[]dnl
])# MAN_CHECK_BDB
