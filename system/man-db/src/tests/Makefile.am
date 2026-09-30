## Process this file with automake to produce Makefile.in
##
## Copyright (C) 2009-2019 Colin Watson.
##
## This file is part of man-db.
##
## man-db is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## man-db is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with man-db; if not, write to the Free Software Foundation,
## Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

TESTS_ENVIRONMENT = DBTYPE=$(DBTYPE); export DBTYPE; \
		    HAVE_ICONV=$(HAVE_ICONV); export HAVE_ICONV; \
		    MANDIR_LAYOUT=$(MANDIR_LAYOUT); export MANDIR_LAYOUT; \
		    OVERRIDE_DIR="$(override_dir)"; export OVERRIDE_DIR; \
		    abs_top_builddir=$(abs_top_builddir); export abs_top_builddir; \
		    pkglibexecdir=$(pkglibexecdir); export pkglibexecdir; \
		    sbindir=$(sbindir); export sbindir; \
		    troff_is_groff=$(troff_is_groff); export troff_is_groff;
# Each test must use the configure-detected shell, not necessarily /bin/sh.
AM_LOG_FLAGS = $(SHELL)
ALL_TESTS = \
	lexgrog-backslash-dash-rhs \
	lexgrog-basic \
	lexgrog-multiple-whatis \
	man-deleted-directory \
	man-exact-section-matches \
	man-executable-page-on-path \
	man-invalid-db-entry \
	man-language-specific-requests \
	man-mandatory-manpath \
	man-missing-locales \
	man-override-dir \
	man-recode-in-place \
	man-recode-suffix \
	man-so-links-same-section \
	man-suffixed-extension \
	man-symlinks-with-matching-names \
	manconv-coding-tags \
	manconv-guess-from-encoding \
	manconv-incomplete-char-at-eof \
	manconv-odd-combinations \
	mandb-basic \
	mandb-bogus-symlink \
	mandb-cachedir-tag \
	mandb-empty-page \
	mandb-purge-updates-timestamp \
	mandb-regular-file-symlink-changes \
	mandb-symlink-beats-whatis-ref \
	mandb-symlink-target-timestamp \
	mandb-whatis-broken-link-changes \
	manpath-slash \
	whatis-path-to-executable \
	zsoelim-so-includes
if !CROSS_COMPILING
TESTS = $(ALL_TESTS)
endif

AM_CPPFLAGS = \
	-I$(top_srcdir)/include \
	-I$(top_builddir)/gl/lib \
	-I$(top_srcdir)/gl/lib \
	-I$(top_srcdir)/lib
AM_CFLAGS = $(WARN_CFLAGS)
check_PROGRAMS = fspause get-mtime

fspause_SOURCES = fspause.c
fspause_LDADD = \
	$(top_builddir)/gl/lib/libgnu.la \
	$(NANOSLEEP_LIB)
get_mtime_SOURCES = get-mtime.c
get_mtime_LDADD = $(top_builddir)/lib/libman.la

dist_check_SCRIPTS = testlib.sh $(ALL_TESTS)
