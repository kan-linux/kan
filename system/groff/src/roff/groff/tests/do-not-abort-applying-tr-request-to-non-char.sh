#!/bin/sh
#
# Copyright 2026 G. Branden Robinson
#
# This file is part of groff, the GNU roff typesetting system.
#
# groff is free software; you can redistribute it and/or modify it over
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

groff="${abs_top_builddir:-.}/test-groff"

fail=

wail () {
  echo ...FAILED >&2
  fail=YES
}

# troff should not throw an assertion failure when the user attempts to
# apply the `tr` request to non-character input.  Savannah #68132.

input='.
.nf
.tr a\|
HAPAX
.tr \^b
LEGOMENON
.'

output=$(printf '%s\n' "$input" | "$groff" -a)

echo "checking that translating character to non-character does not" \
    "abort formatter" >&2
echo "$output" | grep -Fqx "HAPAX" || wail

echo "checking that translating non-character to character does not" \
    "abort formatter" >&2
echo "$output" | grep -Fqx "LEGOMENON" || wail

test -z "$fail"

# vim:set autoindent expandtab shiftwidth=4 tabstop=4 textwidth=72:
