# Makefile.am for texi2any C libraries
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

MAINTAINERCLEANFILES =

######################## Gnulib ################################

# We do not set an explicit -I to find config.h, as it is in the
# top buildir and automake knows how to add flags to find it there.

GNULIB_CPPFLAGS = -I$(top_srcdir)/gnulib/lib \
  -I$(top_builddir)/gnulib/lib

################### End Gnulib section #########################

# for ppport.h that is needed by a few source files.
AM_CPPFLAGS = -I$(srcdir)

converterlibdir = $(libdir)/$(CONVERTER)

AM_CPPFLAGS += -DDATADIR=\"$(datadir)\" -DSYSCONFDIR=\"$(sysconfdir)\"

# used for all the libraries, even those that do not compile against
# Perl, to have consistent compiling and linking flags.
AM_CFLAGS = $(perl_conf_LIB_CFLAGS)

# used for executables.  The different libraries have specific flags
# because the can have libtool version arguments and also because those
# compiled against Gnulib code may need specific flags.
# This corresponds to part of ExtUtils::Embed ldopts corresponding to LDFLAGS
AM_LDFLAGS = $(perl_conf_LDFLAGS)

librarydir = $(converterlibdir)/lib

# -------------------------------------------------------

noinst_LTLIBRARIES =

library_LTLIBRARIES =

############ Convenience library for code calling Perl from C and for XS
# interfaces, separate to use different flags to be sure that Perl headers
# are not used and configure/Gnulib/libc headers and functions are used.

noinst_LTLIBRARIES += libperlcall_utils.la

libperlcall_utils_la_SOURCES = \
		main/xs_utils.c \
		main/xs_utils.h \
		main/use_interpreter_types.h

if ! DISABLE_XS
libperlcall_utils_la_SOURCES += main/set_perl_interpreter.c
else
libperlcall_utils_la_SOURCES += main/replace_set_perl_interpreter.c
endif

libperlcall_utils_la_CPPFLAGS = -I$(srcdir)/main $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS)
libperlcall_utils_la_LIBADD = $(top_builddir)/gnulib/lib/libgnu.la

########################## shared common, parser and structure library

library_LTLIBRARIES += libtexinfo.la

# The files in the main directory correspond to code used both
# by the parser, by converters and by C code used for interfacing with
# Perl.  In particular, conversion of the tree to Texinfo code and to raw text
# is in the main directory.
# The files in the parsetexi directory correspond to the parser code.  They
# depend on the files in main but not the other way around.
# Files in structuring_transfo depend only on the files in main and not
# the other way around.
# No include of Perl headers for the files in C_libtexinfo_sources.
C_libtexinfo_sources = \
		      main/tree_types.h \
		      main/document_types.h \
		      main/source_mark_types.h \
		      main/tree.c \
		      main/tree.h \
		      main/text.c \
		      main/text.h \
		      main/base_utils.c \
		      main/base_utils.h \
		      main/element_types.c \
		      main/element_types.h \
		      main/command_ids.h \
		      main/builtin_commands.c \
		      main/builtin_commands.h \
		      main/types_data.h \
		      main/debug.c \
		      main/debug.h \
		      main/errors.c \
		      main/errors.h \
		      main/extra.c \
		      main/extra.h \
		      main/structure_list.c \
		      main/structure_list.h \
		      main/convert_to_texinfo.c \
		      main/convert_to_texinfo.h \
		      main/convert_to_text.c \
		      main/convert_to_text.h \
		      main/convert_utils.c \
		      main/convert_utils.h \
		      main/customization_options.c \
		      main/customization_options.h \
		      main/html_conversion_data.c \
		      main/html_conversion_data.h \
		      main/html_css_data.c \
		      main/html_css_data.h \
		      main/floats.c \
		      main/floats.h \
		      main/manipulate_tree.c \
		      main/manipulate_tree.h \
		      main/reader_types.h \
		      main/reader_api.h \
		      main/reader.c \
		      main/reader.h \
		      main/node_name_normalization.c \
		      main/node_name_normalization.h \
		      main/command_stack.c \
		      main/command_stack.h \
		      main/cmd_structuring.c \
		      main/cmd_text.c \
		      main/parser_conf.c \
		      main/parser_conf.h \
		      main/targets.c \
		      main/targets.h \
		      main/options_init_free.c \
		      main/options_defaults.c \
		      main/options_defaults.h \
		      main/option_types.h \
		      main/options_data.h \
		      main/global_commands_types.h \
		      main/utils.c \
		      main/utils.h \
		      main/system.h \
		      main/converter_types.h \
		      main/unicode.c \
		      main/unicode.h \
		      main/hashmap.c \
		      main/hashmap.h \
		      main/translations.c \
		      main/translations.h \
		      main/document.c \
		      main/document.h \
		      main/manipulate_indices.h \
		      main/manipulate_indices.c \
		      main/output_unit.c \
		      main/output_unit.h \
		      main/txi_config.c \
		      main/txi_config.h \
		      main/txi_documentlanguage_languages.c \
		      main/txi_documentlanguage_regions.c \
		      parsetexi/api.c \
		      parsetexi/api.h \
		      parsetexi/parser.c \
		      parsetexi/parser.h \
		      parsetexi/input.c \
		      parsetexi/input.h \
		      parsetexi/close.c \
		      parsetexi/conf.c \
		      parsetexi/conf.h \
		      parsetexi/context_stack.c \
		      parsetexi/context_stack.h \
		      parsetexi/debug_parser.c \
		      parsetexi/debug_parser.h \
		      parsetexi/errors_parser.c \
		      parsetexi/errors_parser.h \
		      parsetexi/end_line.c \
		      parsetexi/separator.c \
		      parsetexi/multitable.c \
		      parsetexi/indices.c \
		      parsetexi/indices.h \
		      parsetexi/commands.c \
		      parsetexi/commands.h \
		      parsetexi/macro.c \
		      parsetexi/macro.h \
		      parsetexi/handle_commands.c \
		      parsetexi/handle_commands.h \
		      parsetexi/def.c \
		      parsetexi/def.h \
		      parsetexi/menus.c \
		      parsetexi/labels.c \
		      parsetexi/labels.h \
		      parsetexi/counter.c \
		      parsetexi/counter.h \
		      parsetexi/source_marks.c \
		      parsetexi/source_marks.h \
		      structuring_transfo/structuring.c \
		      structuring_transfo/structuring.h \
		      structuring_transfo/transformations.c \
		      structuring_transfo/transformations.h

EXTRA_DIST += main/accent_tables_8bit_codepoints.c
EXTRA_DIST += main/command_data.c
EXTRA_DIST += main/cmd_unicode.c
EXTRA_DIST += main/cmd_text.c
EXTRA_DIST += main/global_multi_commands_case.c
EXTRA_DIST += main/global_unique_commands_case.c

libtexinfo_la_SOURCES = \
   $(C_libtexinfo_sources)

# convenience library separate from but only used in libtexinfo to have
# different CPPFLAGS to make sure that Gnulib header files are not used
# in compilation.
# does not actually require iconv, but it is only used as a convenience
# library for libtexinfo.la, which requires iconv
noinst_LTLIBRARIES += libcallperl_libtexinfo.la

# api_to_perl.c and call_perl_function.c functions are called in other
# parts of the libtexinfo code and need to be compiled with Perl headers
libcallperl_libtexinfo_la_SOURCES = \
		      main/api_to_perl.h \
		      main/call_perl_function.h

if ! DISABLE_XS
libcallperl_libtexinfo_la_SOURCES += \
		      ppport.h \
		      main/api_to_perl.c \
		      main/call_perl_function.c
else
libcallperl_libtexinfo_la_SOURCES += \
		      main/replace_perl_api_call.c
endif

libcallperl_libtexinfo_la_CPPFLAGS = -I$(srcdir)/main $(perl_conf_CPPFLAGS)
libcallperl_libtexinfo_la_LIBADD = libperlcall_utils.la $(platform_PERL_LIBADD)
libcallperl_libtexinfo_la_LDFLAGS = $(perl_conf_LIB_LDFLAGS)

# locate include files under out-of-source builds.
libtexinfo_la_CPPFLAGS = -I$(srcdir)/main -I$(srcdir)/parsetexi $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS)
libtexinfo_la_LIBADD = libcallperl_libtexinfo.la $(platform_PERL_LIBADD)
libtexinfo_la_LDFLAGS = -version-info 1:0:0 $(perl_conf_LIB_LDFLAGS) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)
#libtexinfo_la_LDFLAGS = -version-info 1:0:0 -Wl,--no-undefined $(perl_conf_LIB_LDFLAGS) $(perl_conf_LIBS) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)

BUILT_SOURCES = main/accent_tables_8bit_codepoints.c \
                convert/cmd_converter.c \
                convert/converters_options.c \
                convert/converters_options.h \
                main/cmd_structuring.c \
                main/cmd_text.c \
                main/cmd_unicode.c \
                main/command_data.c \
                main/command_ids.h \
                main/html_conversion_data.c \
                main/html_conversion_data.h \
                main/html_css_data.c \
                main/html_css_data.h \
                main/element_types.c \
                main/element_types.h \
                main/global_commands_types.h \
                main/global_multi_commands_case.c \
                main/global_unique_commands_case.c \
                main/options_init_free.c \
                main/options_defaults.c \
                main/options_defaults.h \
                main/options_get_perl.c \
                main/options_data.h

# Need to be distributed
EXTRA_DIST += main/element_types.txt main/element_types.awk \
	       main/command_data.awk

products_element_types = $(srcdir)/main/element_types.c \
                         $(srcdir)/main/element_types.h

# See "Multiple Outputs" in the automake manual for this and following
# rules that produce multiple files from the same helper program.

$(srcdir)/stamp.element_types: main/element_types.txt main/element_types.awk
	@rm -f tmp.element_types
	@touch tmp.element_types
	$(GAWK) -v srcdir=$(srcdir)/main -f $(srcdir)/main/element_types.awk \
	     $(srcdir)/main/element_types.txt
	@mv -f tmp.element_types $@

$(products_element_types): $(srcdir)/stamp.element_types
	@test -f $@ || rm -f stamp.element_types
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) stamp.element_types
EXTRA_DIST += stamp.element_types
MAINTAINERCLEANFILES += $(products_element_types) stamp.element_types

products_command_data = $(srcdir)/main/command_data.c \
                        $(srcdir)/main/command_ids.h \
                        $(srcdir)/main/global_multi_commands_case.c \
                        $(srcdir)/main/global_unique_commands_case.c \
                        $(srcdir)/main/global_commands_types.h

$(srcdir)/stamp.command_data: ../data/command_data.txt main/command_data.awk
	@rm -f tmp.command_data
	@touch tmp.command_data
	$(GAWK) -v srcdir=$(srcdir)/main -f $(srcdir)/main/command_data.awk \
	     $(srcdir)/../data/command_data.txt
	@mv -f tmp.command_data $@

$(products_command_data): $(srcdir)/stamp.command_data
	@test -f $@ || rm -f stamp.command_data
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) stamp.command_data
EXTRA_DIST += stamp.command_data
MAINTAINERCLEANFILES += $(products_command_data) stamp.command_data

# Order matters
products_code_commands_values = $(srcdir)/main/cmd_text.c \
                                $(srcdir)/main/cmd_unicode.c \
                                $(srcdir)/main/cmd_structuring.c \
                                $(srcdir)/convert/cmd_converter.c

$(srcdir)/stamp.code_commands_values: ../data/commands_values.txt main/command_data.c $(srcdir)/../maintain/generate_code_commands_values.pl
	@rm -f tmp.code_commands_values
	@touch -f tmp.code_commands_values
	$(PERL) $(srcdir)/../maintain/generate_code_commands_values.pl \
	      $(srcdir)/../data/commands_values.txt C \
	      $(products_code_commands_values) \
	      $(srcdir)/main/command_data.c
	@mv -f tmp.code_commands_values $@

$(products_code_commands_values): $(srcdir)/stamp.code_commands_values
	@test -f $@ || rm -f stamp.code_commands_values
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) stamp.code_commands_values
EXTRA_DIST += stamp.code_commands_values
MAINTAINERCLEANFILES += $(products_code_commands_values) stamp.code_commands_values

TXI_MODULES_ENV = srcdir="$(srcdir)"; export srcdir;

$(srcdir)/main/accent_tables_8bit_codepoints.c: $(srcdir)/../perl/Texinfo/UnicodeData.pm $(srcdir)/../maintain/setup_accent_tables.pl
	$(TXI_MODULES_ENV) $(PERL) $(srcdir)/../maintain/setup_accent_tables.pl $@

MAINTAINERCLEANFILES += main/accent_tables_8bit_codepoints.c

# Order matters
products_C_options_info = $(srcdir)/main/options_init_free.c \
                          $(srcdir)/main/options_data.h \
                          $(srcdir)/main/options_defaults.c \
                          $(srcdir)/main/options_defaults.h \
                          $(srcdir)/convert/converters_options.c \
                          $(srcdir)/convert/converters_options.h \
                          $(srcdir)/main/options_get_perl.c

$(srcdir)/stamp.regenerate_C_options_info: ../data/options_data.txt ../data/converters_defaults.txt main/command_data.c $(srcdir)/../maintain/regenerate_C_options_info.pl
	@rm -f tmp.regenerate_C_options_info
	@touch tmp.regenerate_C_options_info
	$(PERL) $(srcdir)/../maintain/regenerate_C_options_info.pl \
	        < $(srcdir)/../data/options_data.txt \
	              $(srcdir)/main/command_data.c \
	              $(srcdir)/../data/converters_defaults.txt \
	              $(products_C_options_info)
	@mv -f tmp.regenerate_C_options_info $@

$(products_C_options_info): $(srcdir)/stamp.regenerate_C_options_info
	@test -f $@ || rm -f $(srcdir)/stamp.regenerate_C_options_info
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) $(srcdir)/stamp.regenerate_C_options_info
EXTRA_DIST += stamp.regenerate_C_options_info
MAINTAINERCLEANFILES += $(products_C_options_info) stamp.regenerate_C_options_info

# target that can be built upon cd'ing to the build directory, as needed
# when building translated source files from the top level directory to
# avoid make failing in po* directories.
translated_source_files: $(srcdir)/main/html_conversion_data.c

# Order matters
products_code_convert_data = $(srcdir)/main/html_conversion_data.c \
                             $(srcdir)/main/html_conversion_data.h

$(srcdir)/stamp.code_convert_data: main/command_data.c $(srcdir)/../data/default_direction_strings.csv $(srcdir)/../data/default_special_unit_info.csv $(srcdir)/../data/html_style_commands_element.csv $(srcdir)/../maintain/generate_code_convert_data.pl
	@rm -f tmp.code_convert_data
	@touch tmp.code_convert_data
	$(PERL) $(srcdir)/../maintain/generate_code_convert_data.pl \
	        < $(srcdir)/main/command_data.c \
	            $(srcdir)/../data/default_direction_strings.csv \
	            $(srcdir)/../data/default_special_unit_info.csv \
	            $(srcdir)/../data/html_style_commands_element.csv \
	            C $(products_code_convert_data)
	@mv -f tmp.code_convert_data $@

$(products_code_convert_data): $(srcdir)/stamp.code_convert_data
	@test -f $@ || rm -f $(srcdir)/stamp.code_convert_data
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) $(srcdir)/stamp.code_convert_data
EXTRA_DIST += stamp.code_convert_data
MAINTAINERCLEANFILES += $(products_code_convert_data) stamp.code_convert_data

# Order matters
products_css_data = $(srcdir)/main/html_css_data.c \
                    $(srcdir)/main/html_css_data.h

$(srcdir)/stamp.css_data: $(srcdir)/../data/default_css_element_class_styles.csv $(srcdir)/../maintain/generate_css_data.pl
	@rm -f tmp.css_data
	@touch tmp.css_data
	$(PERL) $(srcdir)/../maintain/generate_css_data.pl \
	            $(srcdir)/../data/default_css_element_class_styles.csv \
	            C $(products_css_data)
	@mv -f tmp.css_data $@

$(products_css_data): $(srcdir)/stamp.css_data
	@test -f $@ || rm -f $(srcdir)/stamp.css_data
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) $(srcdir)/stamp.css_data
EXTRA_DIST += stamp.css_data
MAINTAINERCLEANFILES += $(products_css_data) stamp.css_data


################################# common Perl C code shared library used
# to call libtexinfo from Perl XS .xs interfaces and other Perl C codes

if ! DISABLE_XS
library_LTLIBRARIES += libtexinfoxs.la
libtexinfoxs_la_as_dependency = libtexinfoxs.la
endif

libtexinfoxs_la_SOURCES= \
		      main/build_perl_info.c \
		      main/build_perl_info.h \
		      main/get_perl_info.c \
		      main/get_perl_info.h \
		      main/options_get_perl.c

# locate include files under out-of-source builds.
libtexinfoxs_la_CPPFLAGS = -I$(srcdir)/main $(AM_CPPFLAGS) $(perl_conf_CPPFLAGS)
libtexinfoxs_la_LIBADD = libtexinfo.la libperlcall_utils.la $(platform_PERL_LIBADD)
libtexinfoxs_la_LDFLAGS = -version-info 1:0:0 $(perl_conf_LIB_LDFLAGS)
# example to trigger errors associated with no undefined
#libtexinfoxs_la_LDFLAGS = -version-info 1:0:0 -Wl,--no-undefined $(perl_conf_LIB_LDFLAGS) $(perl_conf_LIBS)

########################## shared C library for conversion
# Conversion to raw text and to Texinfo code is in the libtexinfo library.
# Note that having a library and not reusing source files is important to
# share converter data among the XS objects used for conversion.

library_LTLIBRARIES += libtexinfo-convert.la

C_libtexinfo_convert_sources = \
                       convert/converter.c \
                       convert/converter.h \
                       convert/cmd_converter.c \
                       convert/converters_options.c \
                       convert/converters_options.h \
                       convert/convert_html.h \
                       convert/convert_html.c \
                       convert/format_html.h \
                       convert/format_html.c \
                       convert/html_converter_types.h \
                       convert/html_converter_init_options.c \
                       convert/html_converter_finish.c \
                       convert/html_conversion_state.c \
                       convert/html_conversion_state.h \
                       convert/html_prepare_converter.c \
                       convert/html_prepare_converter.h \
                       convert/html_conversion_api.h \
                       convert/html_converter_api.c \
                       convert/html_converter_api.h \
                       convert/plaintexinfo_converter_api.c \
                       convert/plaintexinfo_converter_api.h \
                       convert/rawtext_converter_api.c \
                       convert/rawtext_converter_api.h

# convenience library compiled with Perl headers, separate to be able to
# have different flags from libtexinfo-convert, to avoid Gnulib flags.
# Internal for libtexinfo-convert.
# call_html_perl_function.c code is called from libtexinfo-convert C code.
# build_html_perl_state.c functions are called from call_html_perl_function.c.
# call_conversion_perl.c is also included although it is not directly used,
# to have it in a library different from libtexinfo-main where different flags
# (for embedding Perl) are used for the Perl part.
noinst_LTLIBRARIES += libcallperl_libtexinfo_convert.la

libcallperl_libtexinfo_convert_la_SOURCES = \
                       convert/call_html_perl_function.h \
                       convert/call_conversion_perl.h
if ! DISABLE_XS
libcallperl_libtexinfo_convert_la_SOURCES += \
                       main/call_document_perl_functions.h \
                       main/call_document_perl_functions.c \
                       convert/build_html_perl_state.h \
                       convert/build_html_perl_state.c \
                       convert/call_html_perl_function.c \
                       convert/call_conversion_perl.c
else
libcallperl_libtexinfo_convert_la_SOURCES += \
                       convert/replace_perl_call_html_function.c \
                       convert/replace_call_conversion_perl.c
endif

libcallperl_libtexinfo_convert_la_CPPFLAGS = -I$(srcdir)/main -I$(srcdir)/convert $(perl_conf_CPPFLAGS)
libcallperl_libtexinfo_convert_la_LIBADD = $(libtexinfoxs_la_as_dependency) libtexinfo.la $(platform_PERL_LIBADD)
libcallperl_libtexinfo_convert_la_LDFLAGS = $(perl_conf_LIB_LDFLAGS)

libtexinfo_convert_la_SOURCES = \
   $(C_libtexinfo_convert_sources)

# locate include files under out-of-source builds.
libtexinfo_convert_la_CPPFLAGS = -I$(srcdir)/main -I$(srcdir)/parsetexi -I$(srcdir)/convert -I$(srcdir)/structuring_transfo $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS)
libtexinfo_convert_la_LIBADD = $(libtexinfoxs_la_as_dependency) libtexinfo.la libcallperl_libtexinfo_convert.la $(top_builddir)/gnulib/lib/libgnu.la $(platform_PERL_LIBADD)
libtexinfo_convert_la_LDFLAGS = -version-info 1:0:0 $(perl_conf_LIB_LDFLAGS) $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)
# example to trigger errors associated with no undefined
#libtexinfo_convert_la_LDFLAGS = -version-info 1:0:0 -Wl,--no-undefined $(perl_conf_LIB_LDFLAGS) $(perl_conf_LIBS) $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)

################################# common Perl C code shared library used
# to call libtexinfo-convert from Perl XS *.xs interfaces

if ! DISABLE_XS
library_LTLIBRARIES += libtexinfo-convertxs.la
endif

libtexinfo_convertxs_la_SOURCES = \
                       convert/build_html_perl_info.h \
                       convert/build_html_perl_info.c \
                       convert/get_converter_perl_info.c \
                       convert/get_converter_perl_info.h \
                       tree_elements/build_perl_tree_elements.h \
                       tree_elements/build_perl_tree_elements.c \
                       tree_elements/get_perl_tree_elements.h \
                       tree_elements/get_perl_tree_elements.c

# locate include files under out-of-source builds.
libtexinfo_convertxs_la_CPPFLAGS = -I$(srcdir)/main -I$(srcdir)/convert $(AM_CPPFLAGS) $(perl_conf_CPPFLAGS)
libtexinfo_convertxs_la_LIBADD = libtexinfo-convert.la libtexinfoxs.la libtexinfo.la $(platform_PERL_LIBADD)
libtexinfo_convertxs_la_LDFLAGS = -version-info 1:0:0 $(perl_conf_LIB_LDFLAGS)
# example to trigger errors associated with no undefined
#libtexinfo_convertxs_la_LDFLAGS = -version-info 1:0:0 -Wl,--no-undefined $(perl_conf_LIB_LDFLAGS) $(perl_conf_LIBS)


################################ main program and swig interface library
# loads interpreter and provides a high level API for the main program
# and SWIG interface.

# NOTE we build libtexinfo-main.la even if PERL_EMBEDDED is not set as some
# code in libtexinfo-main does not directly need a Perl interpreter.
# In that case, the library does not load an interpreter and will lack
# all the features involving the interpreter, may not load if libperl is
# not already loaded in memory when the library is loaded (and could
# crash?).  Testing this configuration is not easy as
# ctexi2any cannot be built in that situation.

library_LTLIBRARIES += libtexinfo-main.la

# convenience library for embedded Perl called from libtexinfo-main C code,
# to be able to use specific flags for compilation and linking different from
# other libraries with code including Perl headers, and without Gnulib.
# Internal for libtexinfo-main.
noinst_LTLIBRARIES += libperlembed_libtexinfo_main.la

libperlembed_libtexinfo_main_la_SOURCES = \
                       convert/call_embed_perl.h

if PERL_EMBEDDED
libperlembed_libtexinfo_main_la_SOURCES += convert/call_embed_perl.c
else
# replace by functions doing nothing, needed for linking
libperlembed_libtexinfo_main_la_SOURCES += convert/replace_call_embed_perl.c
endif

if PERL_EMBEDDED
# contains part of ExtUtils::Embed ldopts corresponding to LIBADD
libperlembed_libtexinfo_main_la_LIBADD = $(perl_conf_LIBS)
else
libperlembed_libtexinfo_main_la_LIBADD = $(platform_PERL_LIBADD)
endif
libperlembed_libtexinfo_main_la_LDFLAGS = $(perl_conf_LIB_LDFLAGS)
# ExtUtils::Embed does not distinguish CPPFLAGS from CFLAGS, but
# we do as much as possible.
# This part corresponds to perl_inc in ExtUtils::Embed ccopts, and
# is better in CPPFLAGS.
libperlembed_libtexinfo_main_la_CPPFLAGS = $(perl_conf_CPPFLAGS)
# The flags that are used through AM_CFLAGS contain
# flags part of ExtUtils::Embed ccopts corresponding to
# Perl config ccflags.  May contain flags that would have better been
# in CPPFLAGS.  Also flags for compilation as part of a library
# from Perl, not in ExtUtils::Embed ccopts.

C_libtexinfo_main_sources = \
                       api_for_swig/swig_element_data.h \
                       api_for_swig/swig_element_types.h \
                       api_for_swig/swig_text_options.h \
                       api_for_swig/swig_text_options_types.h \
                       api_for_swig/swig_error_messages_types.h \
                       api_for_swig/swig_interface.c \
                       api_for_swig/swig_interface.h \
                       api_for_swig/swig_parser_api.c \
                       api_for_swig/swig_parser_api.h \
                       convert/texinfo.c \
                       convert/texinfo.h

libtexinfo_main_la_SOURCES = \
   $(C_libtexinfo_main_sources)

# locate include files under out-of-source builds.
# NOTE not sure that Gnulib is directly used, but it could.
libtexinfo_main_la_CPPFLAGS = -I$(srcdir)/main -I$(srcdir)/convert -I$(srcdir)/structuring_transfo -I$(srcdir)/parsetexi $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS)
libtexinfo_main_la_LIBADD = $(libtexinfoxs_la_as_dependency) libtexinfo.la libtexinfo-convert.la libperlembed_libtexinfo_main.la $(top_builddir)/gnulib/lib/libgnu.la
if PERL_EMBEDDED
# contains part of ExtUtils::Embed ldopts corresponding to LIBADD
libtexinfo_main_la_LIBADD += $(perl_conf_LIBS)
endif
# contains part of ExtUtils::Embed ldopts corresponding to LDFLAGS
libtexinfo_main_la_LDFLAGS = -version-info 0:0:0 $(perl_conf_LIB_LDFLAGS)
# example to trigger errors associated with no undefined
#libtexinfo_main_la_LDFLAGS = -version-info 0:0:0 -Wl,--no-undefined $(perl_conf_LIB_LDFLAGS) $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)


############################################### main program in C

noinst_PROGRAMS =

# if PERL_EMBEDDED is not set, it is possible that libperl.so is not there and
# -lperl is not resolved.  The libperl symbols are needed at link time for the
# libraries linked against ctexi2any that are compiled against the Perl
# headers, as they need symbols defined in libperl. Therefore, we only build
# ctexi2any if PERL_EMBEDDED is true.

# The libraries themselves do not need -lperl because they can have undefined
# symbols at link time (if not linked with -no-undefined), in contrast with
# programs such as ctexi2any.  At run time, when the libraries are dlopened
# by XSLoader.pm from a Perl interpreter they will resolve the undefined
# symbols using the libperl integrated in the Perl interpreter, even though
# the symbols were undefined at link time.

if PERL_EMBEDDED
noinst_PROGRAMS += ctexi2any
endif

ctexi2any_SOURCES = \
                       texi2any.c

# perl_conf_LIBS contains part of ExtUtils::Embed ldopts corresponding to LDADD
# Gnulib is directly needed on some platforms for getopt-gnu.
# The Gnulib link variables are needed at least on Solaris and not added
# by libtool.
ctexi2any_LDADD = libtexinfo-main.la libtexinfoxs.la libtexinfo-convert.la libtexinfo.la $(top_builddir)/gnulib/lib/libgnu.la $(perl_conf_LIBS) $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)

# NOTE it is important to use perl_conf_CFLAGS here to match
# with perl_conf_LDFLAGS used for linking, or in some platforms where
# the compiling and linking flags must match there will be a failure to
# build (for example AlmaLinux).
ctexi2any_CFLAGS = $(perl_conf_CFLAGS)
ctexi2any_CPPFLAGS = -I$(srcdir)/parsetexi -I$(srcdir)/convert -I$(srcdir)/main -I$(srcdir)/structuring_transfo $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS) -DEMBED_PERL

# in configure.ac, it is checked that Perl is embedded and iconv is available
if PREFER_C_TEXI2ANY
bin_PROGRAMS = texi2any
endif

texi2any_SOURCES = $(ctexi2any_SOURCES)
texi2any_LDADD = $(ctexi2any_LDADD)
texi2any_CPPFLAGS = $(ctexi2any_CPPFLAGS)
texi2any_CFLAGS = $(ctexi2any_CFLAGS)

if PREFER_C_TEXI2ANY
install-exec-hook:
	makeinfo_f=`echo makeinfo$(EXEEXT) | sed -e '$(transform)'`; rm -f $(DESTDIR)$(bindir)/$$makeinfo_f
	-makeinfo_f=`echo makeinfo$(EXEEXT) | sed -e '$(transform)'`; texi2any_f=`echo texi2any$(EXEEXT)| sed -e '$(transform)'`; (cd $(DESTDIR)$(bindir)/ && $(LN_S) $$texi2any_f $$makeinfo_f)
endif

################################# C only static main program demonstrator
# The same effect can be obtained with the main program in C with
# XS disabled at configure time or the interpreter disabled at runtime.
# Not really useful nowadays besides making sure that the replacement functions
# required for linking are provided.

if ! DISABLE_ADDITIONAL_CHECKS
noinst_PROGRAMS += teximakehtml
endif

teximakehtml_SOURCES = \
                       $(C_libtexinfo_sources) \
                       $(C_libtexinfo_convert_sources) \
                       $(C_libtexinfo_main_sources) \
                       texi2any.c \
                       main/replace_set_perl_interpreter.c \
                       main/replace_perl_api_call.c \
                       convert/replace_perl_call_html_function.c \
                       convert/replace_call_conversion_perl.c \
                       convert/replace_call_embed_perl.c

# Perl flags are not useful, but we use the same flags as for
# configure checks, such that they are consistent for detected
# libraries flags such as LTLIBINTL.
teximakehtml_CFLAGS = $(perl_conf_CFLAGS)
teximakehtml_LDADD = $(top_builddir)/gnulib/lib/libgnu.la $(EUIDACCESS_LIBGEN) $(LTLIBINTL) $(LTLIBICONV) $(LTLIBUNISTRING)

teximakehtml_CPPFLAGS = -I$(srcdir)/parsetexi -I$(srcdir)/convert -I$(srcdir)/main -I$(srcdir)/structuring_transfo $(AM_CPPFLAGS) $(GNULIB_CPPFLAGS)


