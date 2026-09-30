# Makefile.am for texinfo/doc/tta_api.
#
# Copyright 2012-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Without menus completed the Index appendix node in
# texi2any_internals_indices.texi does not appear in any menu.
AM_MAKEINFOFLAGS = -c INFO_SPECIAL_CHARS_WARNING=0 -c TREE_TRANSFORMATIONS=complete_tree_nodes_menus

# Use the programs built in our distribution.
MAKEINFO_ENVIRONMENT = TEXINFO_DEV_SOURCE=1 \
                       t2a_srcdir="$(top_srcdir)/tta" \
                       t2a_builddir="$(top_builddir)/tta"
MAKEINFO = $(MAKEINFO_ENVIRONMENT) $(PERL) $(top_srcdir)/tta/perl/texi2any.pl

TEXI2DVI_ENVIRONMENT = TEXINDEX=${abs_top_builddir}/texindex/texindex \
                       TEXINDEX_SCRIPT=${abs_top_srcdir}/texindex/texindex.awk
TEXI2DVI = $(TEXI2DVI_ENVIRONMENT) $(top_srcdir)/util/texi2dvi

# the pod files are formatted like man pages.  If HTML is split at node
# or section, this results in some very short sections at the beginning
# of each module, so split at chapters.
AM_MAKEINFOHTMLFLAGS = --split=chapter

# since the texi2any_internals 'manual' is referred to extensively in the
# texi2any_api, we setup the build targets.
info_TEXINFOS = texi2any_internals.texi

TEXINFO_TEX = ../texinfo.tex

# Most dependencies are in api_includes/ directory but we do not want
# to list them explicitly
texi2any_internals_TEXINFOS = texi2any_internals_indices.texi
DISTCLEANFILES = texi2any_internals.info*

# Do not create info files for distribution.
dist-info:

# texi2any_internals_preamble.texi is not included but passed on the
# standard input when building texi2any_internals.texi.
EXTRA_DIST = texi2any_internals_preamble.texi api_includes

if BUILD_PERL_API_TEXI

BUILT_SOURCES = texi2any_internals.texi

# all the modules with some interesting public interfaces.
# The order matters for the result.
texi2any_internals_dependencies = \
  $(top_srcdir)/tta/perl/Texinfo/Commands.pod \
  $(top_srcdir)/tta/perl/Texinfo/CommandsValues.pod \
  $(top_srcdir)/tta/perl/Texinfo/Common.pm \
  $(top_srcdir)/tta/perl/Texinfo/ParserNonXS.pm \
  $(top_srcdir)/tta/perl/Texinfo/Document.pm \
  $(top_srcdir)/tta/perl/Texinfo/ManipulateTree.pm \
  $(top_srcdir)/tta/perl/Texinfo/Structuring.pm \
  $(top_srcdir)/tta/perl/Texinfo/Report.pm \
  $(top_srcdir)/tta/perl/Texinfo/Translations.pm \
  $(top_srcdir)/tta/perl/Texinfo/Transformations.pm \
  $(top_srcdir)/tta/perl/Texinfo/Indices.pm \
  $(top_srcdir)/tta/perl/Texinfo/OutputUnits.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Texinfo.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Utils.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Unicode.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/NodeNameNormalization.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Text.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Converter.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Info.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/HTML.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/DocBook.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/TexinfoMarkup.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/TexinfoXML.pm \
  $(top_srcdir)/tta/perl/Texinfo/Convert/Plaintext.pm \
  $(top_srcdir)/tta/perl/Texinfo/TreeElementNonXS.pm \
  $(top_srcdir)/tta/perl/Texinfo/ReaderNonXS.pm \
  $(top_srcdir)/tta/perl/Texinfo/Example/TreeElementConverter.pm

$(srcdir)/texi2any_internals.texi: $(texi2any_internals_dependencies) $(srcdir)/texi2any_internals_indices.texi $(srcdir)/texi2any_internals_preamble.texi
	target=$(srcdir)/texi2any_internals.texi ; \
	if $(MAKEINFO_ENVIRONMENT) $(PERL) -I $(top_srcdir)/Pod-Simple-Texinfo/lib/ $(top_srcdir)/Pod-Simple-Texinfo/pod2texi.pl --base-level=section --preamble - --outdir=$(srcdir)/api_includes --subdir=api_includes $(texi2any_internals_dependencies) < $(srcdir)/texi2any_internals_preamble.texi >$${target}.tmp ; then \
	  cat $${target}.tmp  | sed -e 's/^@bye/@__bye/' | sed -e '/^@__bye/r $(srcdir)/texi2any_internals_indices.texi' | sed -e 's/^@__bye//' > $${target} ; \
	fi ; rm -f $${target}.tmp

endif

maintainerclean-local:
	rm -rf api_includes

MAINTAINERCLEANFILES = texi2any_internals.texi
