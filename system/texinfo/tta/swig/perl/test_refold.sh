#! /bin/sh
# test_refold.sh: compare the output of parse_refold.pl and the original
# file for all the Texinfo manuals generated based on tta/perl/t/*.t tests

# Copyright 2025-2026 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#set -e
#set -x

if [ z"$srcdir" = 'z' ]; then
  srcdir='.'
fi

mdir=check_refold_tree
mkdir -p $mdir

echo "generate t directory Texinfo files"
rm -rf $mdir/refold_texi

mkdir -p $mdir/refold_logs
(
cd ../../perl
../swig/perl/${srcdir}/../../maintain/all_tests.sh texis > ../swig/perl/$mdir/all_tests_texis.log
)

for dir in `find ../../perl/t_texis/ -type d` ; do
  bdir=`echo $dir | sed 's;\.\./\.\./perl/t_texis/;;'`
  if test z"$bdir" = 'z' ; then
    # for the t_texis/ directory
    continue
  fi
  mkdir -p $mdir/refold_texi/$bdir
  echo "doing $bdir"
  logfile=$mdir/refold_logs/$bdir.log
  (
  for file in $dir/*.texi; do
    bfile=`basename $file`
    ${srcdir}/parse_refold.pl $file > $mdir/refold_texi/$bdir/$bfile
  done
  ) > $logfile 2>&1
done

diff -u -r ../../perl/t_texis/ $mdir/refold_texi/ > $mdir/orig_refold.diff

