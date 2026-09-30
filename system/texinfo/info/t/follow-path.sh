#!/bin/sh
# Copyright (C) 2015-2026 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# follow-path.sh test.  See also follow-remain.sh.

srcdir=${srcdir:-.}
. $srcdir/t/Init-test.inc

INFOPATH=$srcdir/t/infodir/b:$srcdir/t/infodir/a
run_ginfo -f file1 -v follow-strategy=path

# Follow cross-reference in a/file1.info to file2.info.  As
# follow-strategy is 'path', this should lead to b/file2.info
# which is earlier in the path, even though it's in a different
# subdirectory.

printf '\t\r' >&7

printf 'Dq' >&7

timeout_test

if test ! -f $ginfo_output; then
  retval=1
else
  grep "the B hierarchy" $ginfo_output
  retval=$?
fi

cleanup
