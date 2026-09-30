# Copyright 2024-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# We do not include the config.h file in the C wrapper, since it may
# cause errors when mixed with the language specific headers.
# NOTE a disadvantage of passing defines through flags and not through a file
# is that a change in value does not trigger remaking the output file.
AM_CPPFLAGS = -DDATADIR=\"$(datadir)\" -DLIBDIR=\"$(libdir)\" \
       -DCONVERTER_CONFIG=\"$(CONVERTER)\" \
       -DPACKAGE_VERSION_CONFIG=\"$(PACKAGE_VERSION)\"

if PERL_EMBEDDED
AM_CPPFLAGS += -DEMBED_PERL
endif

txi_libs_srcdir = $(srcdir)/../../C

$(top_builddir)/../tta/C/libtexinfo.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfo.la

$(top_builddir)/../tta/C/libtexinfo-main.la:
	cd $(top_builddir)/C/ && $(MAKE) $(AM_MAKEFLAGS) libtexinfo-main.la

if SWIG_INTERFACES

BUILT_SOURCES = python_texinfo_wrap.c Texinfo.py

SWIG_include_directories = -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/api_for_swig
SWIG_header_dependencies = \
                 $(txi_libs_srcdir)/main/use_interpreter_types.h \
                 $(txi_libs_srcdir)/main/source_mark_types.h \
                 $(txi_libs_srcdir)/api_for_swig/swig_element_data.h \
                 $(txi_libs_srcdir)/api_for_swig/swig_text_options.h \
                 $(txi_libs_srcdir)/api_for_swig/swig_error_messages_types.h

python_texinfo_wrap.c Texinfo.py: $(srcdir)/../texinfo.i $(SWIG_header_dependencies)
	$(SWIG) $(AX_SWIG_PYTHON_OPT) $(SWIG_include_directories) -o python_texinfo_wrap.c $(srcdir)/../texinfo.i

endif

# Ask autotools to install the generated Python file
nodist_python_PYTHON = Texinfo.py
# This is the Python module
pyexec_LTLIBRARIES = _Texinfo.la

nodist__Texinfo_la_SOURCES = python_texinfo_wrap.c

_Texinfo_la_LDFLAGS = -module ${PYTHON_LDFLAGS}
_Texinfo_la_LIBADD = $(top_builddir)/C/libtexinfo.la $(top_builddir)/C/libtexinfo-main.la
if PERL_EMBEDDED
# part of ExtUtils::Embed ldopts corresponding to LIBADD
_Texinfo_la_LIBADD += $(perl_conf_LIBS)
else
# We need an explicit link against libperl as there is no Perl process involved
# (Perl C code used through XS extensions can use the Perl interpreter
# libperl).  This is needed for linking, even if no C Perl code is run.  Note
# that this case is unlikely, as in general, if liberl is present,
# PERL_EMBEDDED is set.
# Note that this case corresponds to LIBPERL_LINK set, as checked in the
# parent directory.
if ! DISABLE_XS
_Texinfo_la_LIBADD += $(perl_conf_LIBS)
endif
endif
# Same as ctexi2any, not sure whether it is needed or not
_Texinfo_la_LIBADD += $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)
_Texinfo_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(txi_libs_srcdir)/main -I$(txi_libs_srcdir)/parsetexi -I$(txi_libs_srcdir)/convert -I$(txi_libs_srcdir)/api_for_swig ${PYTHON_CPPFLAGS}

clean-local:
	rm -rf __pycache__

EXTRA_DIST = test_Texinfo.py

CLEANFILES = Texinfo.py python_texinfo_wrap.c
