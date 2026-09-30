# Makefile.am for texinfo.
# Process this file with automake to produce Makefile.in in all directories.
#
# Copyright 2002-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Find our headers and gnulib headers.
ACLOCAL_AMFLAGS = -I build-aux/m4 -I gnulib/m4 -I m4

# Wrapper for the build environment.
noinst_SCRIPTS = pre-inst-env

# Additional files to distribute.
EXTRA_DIST = ChangeLog.46 ChangeLog.65 ChangeLog.70 ChangeLog.72 \
  INSTALL.generic README-hacking \
  system.h gnulib/m4/gnulib-cache.m4

# This is to prevent texinfo.tex from being included in the top-level
# distribution directory.
TEXINFO_TEX = doc/texinfo.tex

# Ensure that this file is built early, as it is needed to run texi2any
# and pod2texi in rules under "man" and "doc".  This helps in running
# "make dist" without running "make" first.
BUILT_SOURCES = tta/perl/Texinfo/ModulePath.pm
tta/perl/Texinfo/ModulePath.pm:
	cd tta/perl && $(MAKE) $(AM_MAKEFLAGS) Texinfo/ModulePath.pm

# Ensure that those files are built early, as they are needed in po*
# directories.  This allows to run configure and make after make distclean
BUILT_SOURCES += $(top_srcdir)/tta/perl/Texinfo/HTMLData.pm \
                 $(top_srcdir)/tta/C/main/html_conversion_data.c
$(top_srcdir)/tta/perl/Texinfo/HTMLData.pm:
	cd tta/perl && $(MAKE) $(AM_MAKEFLAGS) translated_source_files

$(top_srcdir)/tta/C/main/html_conversion_data.c:
	cd tta/C && $(MAKE) $(AM_MAKEFLAGS) translated_source_files

# One special target for installers to use by hand if desired.
install-tex:
	cd doc && $(MAKE) TEXMF=$(TEXMF) install-tex

# painful separate build for cross-compiling.
SUBDIRS =
if TOOLS_ONLY
  # Build native tools only.
  SUBDIRS += gnulib/lib install-info tta util
if HAVE_TERMLIBS
    SUBDIRS += info
else
# DOS/Windows don't need TERMLIBS to build Info
if HOST_IS_WINDOWS
  SUBDIRS += info
endif
endif
else
  # All subdirectories.
  # Do libs first since the C programs depend on it.
  # Do doc and man last so things will be built when we get there.
  # Others are alphabetical.
  SUBDIRS += $(native_tools) gnulib/lib
if HAVE_TERMLIBS
  SUBDIRS += info
else
# DOS/Windows don't need TERMLIBS to build Info
if HOST_IS_WINDOWS
  SUBDIRS += info
endif
endif
  SUBDIRS += install-info po po_document tta Pod-Simple-Texinfo \
             texindex util doc man
  SUBDIRS += js
endif

distclean-local:
	-test -d "$(native_tools)" && rm -rf "$(native_tools)"

# Don't install native tools for cross compile.
if TOOLS_ONLY
install:

endif

# to be run before making a distribution: ensure that the texinfo.dtd on
# the web is what we will be releasing.  See README-hacking.
wget = wget
dtd_url = http://www.gnu.org/software/texinfo/dtd/$(TEXINFO_DTD_VERSION)/texinfo.dtd
dtd-check:
	$(wget) -nv $(dtd_url) -O $@-1 \
	&& diff $@-1 $(srcdir)/util/texinfo.dtd \
	&& rm -f $@-1

# For updating version number
update-version:
	./update-version.sh $(srcdir)

# For updating copyright years
grand-replace:
	./grand-replace.sh $(srcdir)

# run update-po in both gettext directories
update-po:
	cd po && $(MAKE) update-po
	cd po_document && $(MAKE) update-po

# From coreutils.  Use when making a release.
# Verify that all source files using _() are listed in po/POTFILES.in.
# Run this before making pretests, as well as official releases, so that
# translators will see changed strings.  See README-hacking.
# Regexp passed to grep to be kept in sync with po/Makevars.
# Note that pgettext is not matched to avoid a false positive in
# tta/perl/Texinfo/Translations.pm, but it is not problematic as it appears
# only in errors.c, which matches other function names.
# False positive in ConvertXS.c with function definition but no
# translated strings
po-check:
	@if test -f po/POTFILES.in; then				\
	  grep -E -v '^(#|$$)' po/POTFILES.in				\
	    | grep -v '^src/false\.c$$' | sort > $@-1;			\
	  files=;							\
	  for file in `find [a-zA-Z]* -name '*.[ch]' 			\
		                   -o -name '*.p[lm]'` ; do             \
	    # don't look at sources from some subdirs.			\
	    case $$file in						\
	      contrib/* ) continue;;					\
	      man/* ) continue;;	\
	      gnulib/lib/*) continue;;					\
	      texinfo-*/*) continue;;					\
              tta/maintain/* ) continue;;				\
              tta/t/results* ) continue;;				\
	      tta/gnulib/lib/*) continue;;			\
	      tta/perl/XSTexinfo/convert/ConvertXS.c) continue;;	\
	    esac;							\
	    files="$$files $$file";					\
	  done;								\
	  grep -E -l							\
	    '\b(N?__?p?|ngettext|line_error|line_error_ext|line_warn|command_error|command_warn|message_list_document_warn|message_list_document_error|p?message_list_command_warn|message_list_command_error|message_list_line_error_ext) *\([^)"]*("|$$)'	\
	    $$files | sort -u > $@-2;					\
	  diff -u $@-1 $@-2 || exit 1;					\
	  rm -f $@-1 $@-2;						\
	fi

# false positive in DocumentXS.c with function definition
# but no translated strings.  exclude *.c file generated
# from *.xs.
po_document-check:
	@if test -f po_document/POTFILES.in; then			\
	  grep -E -v '^(#|$$)' po_document/POTFILES.in | sort > $@-1;	\
	  files=;							\
	  for file in `find [a-z]* -name '*.c' \
	                           -o -name '*.p[lm]'`; do 		\
	    # don't look at sources from some subdirs.			\
	    case $$file in						\
	      contrib/* ) continue;;					\
	      man/* ) continue;;	\
	      texinfo-*/*) continue;;					\
	      tta/maintain/*) continue;;				\
	      tta/perl/init/documentation_examples.pm) continue;;	\
	      tta/perl/XSTexinfo/parser_document/DocumentXS.c) continue;;		\
	      tta/perl/XSTexinfo/reader_element/TreeElementConverterXS.c) continue;;	\
	    esac;							\
	    files="$$files $$file";					\
	  done;								\
	  grep -E -l							\
	    '\b((html_)?p?[cg]dt(_string|_tree|_noop)?|pgdt_context_noop|translate_convert_to_html_internal) *\([^)$$]*("|'"'"'|$$)'	\
	    $$files | sort -u > $@-2;					\
	  diff -u $@-1 $@-2 || exit 1;					\
	  rm -f $@-1 $@-2;						\
	fi

EXTRA_DIST += po/texinfo.pot-header \
              po_document/texinfo_document.pot-header
