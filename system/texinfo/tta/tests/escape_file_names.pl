#! /usr/bin/env perl

# escape_file_name.pl: read list of file names from stdin and rename
# any with non-ASCII characters
#
# Copyright 2024-2026 Free Software Foundation, Inc.
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

use strict;
use utf8;

use File::Copy;
use File::Basename;
use File::Path;

use Encode;
use Unicode::Normalize;

my @files;

my $utf8_argument = 0;
if (defined($ARGV[0]) and $ARGV[0] eq '--utf8-argument') {
  $utf8_argument = 1;
  shift;
}

# Read all of input first
while (<>) {
  chomp;
  push @files, $_;
}

# Sort files in forward order.  This should mean we create directories
# before any files they contain.
@files = sort @files;

my @moved_files;

for my $in_file (@files) {
  if ($in_file =~ /[^[:ascii:]]/) {
    my $file_name;
    if ($utf8_argument) {
      # normalize to get a file name independent of the platform normalization
      my $decoded_file_name = Encode::decode('UTF-8', $in_file);
      my $normalized_file_name = Unicode::Normalize::NFC($decoded_file_name);
      $file_name = Encode::encode('UTF-8', $normalized_file_name);
    } else {
      $file_name = $in_file;
    }
    unshift @moved_files, $in_file;

    my $ascii_name = '';
    for my $char (split('', $file_name)) {
        if (ord($char) < 0x80) {
          $ascii_name .= $char;
        } else {
          $ascii_name .= sprintf("%%%x", ord($char));
        }
    }

    my $dest_path = $ascii_name;

    if (-d $in_file) {
        mkdir $dest_path;
    } else {
        my $copy_succeeded = copy($in_file, $dest_path);
        if (not $copy_succeeded) {
          warn "could not move $in_file: $!\n";
          exit(1);
        }
    }
  }
}

# After copying the files, remove the files from the original locations
# in reverse order.
for my $delete (@moved_files) {
    if (-d $delete) {
      File::Path::rmtree($delete);
    } else {
      unlink $delete;
    }
}

exit(0);
