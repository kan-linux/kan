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

# follow-remain.sh test.  See also follow-path.sh.

srcdir=${srcdir:-.}
. $srcdir/t/Init-test.inc

INFOPATH=$srcdir/t/infodir/b:$srcdir/t/infodir/a
run_ginfo -f file1 -v follow-strategy=remain

# Follow cross-reference in a/file1.info to file2.info.  As
# follow-strategy is 'remain', this should lead to a/file2.info
# even though b/file2.info is earlier in the path.

printf '\t\r' >&7

printf 'Dq' >&7

timeout_test

if test ! -f $ginfo_output; then
  retval=1
else
  # Return non-zero (test failure) if files differ
  grep "the A hierarchy" $ginfo_output
  retval=$?
fi

cleanup
