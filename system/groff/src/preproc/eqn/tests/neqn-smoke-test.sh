#!/bin/sh
#
# Copyright 2026 G. Branden Robinson
#
# This file is part of groff, the GNU roff typesetting system.
#
# groff is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# groff is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

neqn="${abs_top_builddir:-.}/neqn"

# Unit-test basic neqn execution.  Regression-test Savannah #68115.

input='.
.EQ
P V mark = n R T
.EN
.sp
.EQ
E lineup = m c sup 2
.EN
.'

output=$(echo "$input" | "$neqn")
printf "%s\n" "$output"
# At the time of this writing, GNU eqn initializes the `MK` register
# even if a mark isn't used.  Our input ensures that it is.
#
# There is a space and a tab between the brackets.
printf "%s\n" "$output" | grep -q '^\.[ 	]*nr MK'

# vim:set autoindent expandtab shiftwidth=4 tabstop=4 textwidth=72:
