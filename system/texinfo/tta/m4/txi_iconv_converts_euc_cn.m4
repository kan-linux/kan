dnl Copyright 2025-2026 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.
dnl This file is offered as-is, without any warranty.

dnl check whether iconv converts EUC-CN to UTF-8 and set ICONV_CONVERTS_EUC_CN
dnl output variable.

AC_DEFUN([txi_ICONV_CONVERTS_EUC_CN],
[
ICONV_CONVERTS_EUC_CN=no
# partly based on gnulib/m4/iconv.m4
if test "x$am_func_iconv" = "xyes" ; then
   AC_CACHE_CHECK([whether iconv converts EUC-CN to UTF-8], [texinfo_cv_sys_iconv_converts_euc_cn], [
      euc_cn_save_LIBS="$LIBS"
      #if test $am_cv_lib_iconv = yes; then
        LIBS="$LIBS $LIBICONV"
      #fi
      texinfo_cv_sys_iconv_converts_euc_cn=no
      for euc_cn_iconv_const in '' 'const'; do
  AC_RUN_IFELSE(
   [AC_LANG_PROGRAM(
                  [[
#include <iconv.h>
#include <string.h>

#ifndef ICONV_CONST
# define ICONV_CONST $euc_cn_iconv_const
#endif
             ]],
             [[int result = 0;
  {
    iconv_t cd_euc_cn_to_utf8 = iconv_open ("UTF-8", "EUC-CN");
    if (cd_euc_cn_to_utf8 != (iconv_t)(-1))
      {
        static ICONV_CONST char input[] = "abc";
        char buf[10];
        ICONV_CONST char *inptr = input;
        size_t inbytesleft = strlen (input);
        char *outptr = buf;
        size_t outputbytesstart = sizeof (buf)-1;
        size_t outbytesleft = outputbytesstart;
        size_t res = iconv (cd_euc_cn_to_utf8,
                            &inptr, &inbytesleft,
                            &outptr, &outbytesleft);
        if (inbytesleft != 0)
          result += 2;
        if (res != 0)
          result += 4;
        buf[outputbytesstart - outbytesleft] = '\0';
        if (strcmp(buf, input))
          result += 8;
        iconv_close (cd_euc_cn_to_utf8);
      }
    else
      result += 1;
  }
  return result;
]])],
          [texinfo_cv_sys_iconv_converts_euc_cn=yes], ,
          [texinfo_cv_sys_iconv_converts_euc_cn="cross compile guess no"])
        test "$texinfo_cv_sys_iconv_converts_euc_cn" = no || break
      done
      LIBS="$euc_cn_save_LIBS"
   ])
  if test "$texinfo_cv_sys_iconv_converts_euc_cn" = yes; then
    ICONV_CONVERTS_EUC_CN=yes
    # We exclude explicitely Solaris even when there is a conversion.
    # Indeed, the conversion is not the same as with GNU libiconv, at least
    # for some minus sign, which becomes "Fullwidth Hyphen-Minus" U+FF0D with
    # GNU libiconv and "Minus Sign" U+2212 on Solaris.
    # The host can be like solaris2.11.
    case "$host" in
      *-solaris* ) ICONV_CONVERTS_EUC_CN=no ;;
    esac
  fi
fi

AC_SUBST([ICONV_CONVERTS_EUC_CN])

])
