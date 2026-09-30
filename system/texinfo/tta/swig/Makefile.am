# Copyright 2024-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SUBDIRS =

if ! DISABLE_XS
SUBDIRS += perl
endif

if SWIG_PYTHON_INTERFACE
if DISABLE_XS
SUBDIRS += python
else
# linking with libperl is needed if there is C Perl code in Texinfo libraries
if LIBPERL_LINK
SUBDIRS += python
endif
endif
endif

DIST_SUBDIRS = perl python

EXTRA_DIST = README texinfo.i TODO
