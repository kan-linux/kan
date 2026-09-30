# Makefile.am for XS modules
#
# Copyright 2015-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AUTOMAKE_OPTIONS = subdir-objects

EXTRA_DIST =

CLEANFILES =

######################## Texinfo libraries dependencies #######

txi_libs_srcdir = $(srcdir)/../../C

$(top_builddir)/C/libtexinfo-convertxs.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfo-convertxs.la

$(top_builddir)/C/libtexinfoxs.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfoxs.la

$(top_builddir)/C/libtexinfo-convert.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfo-convert.la

$(top_builddir)/C/libtexinfo.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfo.la

######################## Gnulib ################################

# first include is for config.h
GNULIB_CPPFLAGS = -I$(txi_libs_srcdir) -I$(top_srcdir)/gnulib/lib \
  -I$(top_builddir)/gnulib/lib

######################## Perl ################################

converterlibdir = $(libdir)/$(CONVERTER)

xsdir = $(converterlibdir)/XS_extension

.xs.c:
	$(XSUBPP) $(XSUBPPARGS) $< > $*.xsc && mv $*.xsc $*.c

# -------------------------------------------------------

# XS_VERSION is used in version check in the bootstrap function created
# by xsubpp in C code generated from .xs, and called in XSLoader.pm
XSLIBS_CPPFLAGS = -DVERSION=\"$(VERSION)\" -DXS_VERSION=\"$(XS_VERSION)\"
XSLIBS_CPPFLAGS += $(perl_conf_CPPFLAGS)

AM_CFLAGS = $(perl_conf_LIB_CFLAGS)

# Flags specially recognized by libtool.  For dlopened modules, here XS.
XSLIBS_LDFLAGS = -avoid-version -module

XSLIBS_LDFLAGS += $(perl_conf_LIB_LDFLAGS)

AM_LDFLAGS = $(XSLIBS_LDFLAGS)

noinst_LTLIBRARIES =

xs_LTLIBRARIES =

########################## Specific XS used in targeted override

if BUILD_C_CODE
xs_LTLIBRARIES += MiscXS.la
endif
nodist_MiscXS_la_SOURCES = MiscXS.c
CLEANFILES += MiscXS.c
MiscXS_la_SOURCES = xsmisc.c xsmisc.h ../../C/main/base_utils.c \
                    ../../C/main/base_utils.h
# Include Perl headers, do not include Gnulib/configure generated config.h
MiscXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(srcdir) $(XSLIBS_CPPFLAGS) -UHAVE_CONFIG_H
MiscXS_la_LIBADD = $(platform_PERL_LIBADD)


# C only convenience library internal for XSParagraph solely used to set
# different values than code including Perl headers to include
# configure/Gnulib headers but no Perl header.
noinst_LTLIBRARIES += libparagraph.la
libparagraph_la_SOURCES = xspara.c xspara.h \
                 ../../C/main/base_utils.c ../../C/main/base_utils.h \
                 ../../C/main/text.c ../../C/main/text.h
libparagraph_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(srcdir) $(GNULIB_CPPFLAGS)
libparagraph_la_LIBADD = $(top_builddir)/gnulib/lib/libgnu.la
libparagraph_la_LDFLAGS = $(perl_conf_LIB_LDFLAGS) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING) $(LTLIBC32CONV)

if BUILD_C_CODE
xs_LTLIBRARIES += XSParagraph.la
endif
nodist_XSParagraph_la_SOURCES = XSParagraph.c
CLEANFILES += XSParagraph.c
XSParagraph_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(srcdir) $(XSLIBS_CPPFLAGS)
XSParagraph_la_LIBADD = libparagraph.la $(platform_PERL_LIBADD)

EXTRA_DIST += XSParagraph.xs MiscXS.xs

########################## Parsetexi XS parser

converterdatadir = $(datadir)/$(CONVERTER)
modulesdir = $(converterdatadir)/XSTexinfo
dist_modules_DATA = Parsetexi.pm

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += Parsetexi.la
endif

nodist_Parsetexi_la_SOURCES = parser_document/Parsetexi.c
CLEANFILES += parser_document/Parsetexi.c

EXTRA_DIST += parser_document/Parsetexi.xs

# To locate include files under out-of-source builds.
Parsetexi_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/parsetexi $(XSLIBS_CPPFLAGS)
Parsetexi_la_LIBADD = $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)
# the Gnulib link flags are needed at least on Solaris.  They only need to
# be present for one dlopened object, once loaded in Perl, it can be used
# by other modules.
Parsetexi_la_LDFLAGS = $(XSLIBS_LDFLAGS) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)

########################## Document XS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += DocumentXS.la
endif

nodist_DocumentXS_la_SOURCES = parser_document/DocumentXS.c
CLEANFILES += parser_document/DocumentXS.c

EXTRA_DIST += parser_document/DocumentXS.xs

# locate include files under out-of-source builds.
DocumentXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main $(XSLIBS_CPPFLAGS)
DocumentXS_la_LIBADD = $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

########################## StructuringTransfo XS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += StructuringTransfoXS.la
endif

nodist_StructuringTransfoXS_la_SOURCES = \
                    parser_document/StructuringTransfoXS.c
CLEANFILES += \
                    parser_document/StructuringTransfoXS.c

EXTRA_DIST += parser_document/StructuringTransfoXS.xs

# locate include files under out-of-source builds.
StructuringTransfoXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/structuring_transfo $(XSLIBS_CPPFLAGS)
StructuringTransfoXS_la_LIBADD = $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

########################## TreeElement XS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += TreeElementXS.la
endif

nodist_TreeElementXS_la_SOURCES = reader_element/TreeElementXS.c
CLEANFILES += reader_element/TreeElementXS.c

EXTRA_DIST += reader_element/TreeElementXS.xs

# locate include files under out-of-source builds.
TreeElementXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/tree_elements -I$(txi_libs_srcdir)/convert $(XSLIBS_CPPFLAGS)
TreeElementXS_la_LIBADD = $(top_builddir)/C/libtexinfo-convertxs.la $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo-convert.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

########################## TreeElementConverter XS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += TreeElementConverterXS.la
endif

nodist_TreeElementConverterXS_la_SOURCES = reader_element/TreeElementConverterXS.c
CLEANFILES += reader_element/TreeElementConverterXS.c

EXTRA_DIST += reader_element/TreeElementConverterXS.xs

# locate include files under out-of-source builds.
TreeElementConverterXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/tree_elements -I$(txi_libs_srcdir)/convert $(XSLIBS_CPPFLAGS)
TreeElementConverterXS_la_LIBADD = $(top_builddir)/C/libtexinfo-convertxs.la $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo-convert.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

########################## Reader XS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += ReaderXS.la
endif

nodist_ReaderXS_la_SOURCES = reader_element/ReaderXS.c
CLEANFILES += reader_element/ReaderXS.c

EXTRA_DIST += reader_element/ReaderXS.xs

# locate include files under out-of-source builds.
ReaderXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/tree_elements $(XSLIBS_CPPFLAGS)
ReaderXS_la_LIBADD = $(top_builddir)/C/libtexinfo-convertxs.la $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

########################## IndicesXS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += IndicesXS.la
endif

nodist_IndicesXS_la_SOURCES = \
                    parser_document/IndicesXS.c

CLEANFILES += \
                    parser_document/IndicesXS.c

EXTRA_DIST += parser_document/IndicesXS.xs

# locate include files under out-of-source builds.
IndicesXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/convert $(XSLIBS_CPPFLAGS)
IndicesXS_la_LIBADD = $(top_builddir)/C/libtexinfo-convertxs.la $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo-convert.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)
#IndicesXS_la_LDFLAGS = -Wl,--no-undefined $(XSLIBS_LDFLAGS) $(perl_conf_LIBS)

########################## ConvertToTexinfoXS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += ConvertToTexinfoXS.la
endif

nodist_ConvertToTexinfoXS_la_SOURCES = convert/ConvertToTexinfoXS.c
CLEANFILES += convert/ConvertToTexinfoXS.c

EXTRA_DIST += convert/ConvertToTexinfoXS.xs

# To locate include files under out-of-source builds.
ConvertToTexinfoXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main $(XSLIBS_CPPFLAGS)
ConvertToTexinfoXS_la_LIBADD = $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)
ConvertToTexinfoXS_la_LDFLAGS = $(XSLIBS_LDFLAGS)

########################## ConvertXS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += ConvertXS.la
endif

nodist_ConvertXS_la_SOURCES = convert/ConvertXS.c
CLEANFILES += convert/ConvertXS.c

ConvertXS_la_SOURCES = \
                       convert/get_html_perl_info.c \
                       convert/get_html_perl_info.h

EXTRA_DIST += convert/ConvertXS.xs

# To locate include files under out-of-source builds.
ConvertXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/structuring_transfo -I$(txi_libs_srcdir)/convert -I$(srcdir)/convert $(XSLIBS_CPPFLAGS)
ConvertXS_la_LIBADD = $(top_builddir)/C/libtexinfo-convertxs.la $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo-convert.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)
ConvertXS_la_LDFLAGS = $(XSLIBS_LDFLAGS) $(EUIDACCESS_LIBGEN)

########################## ConfigXS

if USE_SHARED_TXI_LIBRARIES
xs_LTLIBRARIES += ConfigXS.la
endif

nodist_ConfigXS_la_SOURCES = parser_document/ConfigXS.c
CLEANFILES += parser_document/ConfigXS.c

ConfigXS_la_SOURCES =

EXTRA_DIST += parser_document/ConfigXS.xs

# To locate include files under out-of-source builds.
ConfigXS_la_CPPFLAGS = -I$(txi_libs_srcdir)/main $(XSLIBS_CPPFLAGS)
ConfigXS_la_LIBADD = $(top_builddir)/C/libtexinfoxs.la $(top_builddir)/C/libtexinfo.la $(platform_PERL_LIBADD)

