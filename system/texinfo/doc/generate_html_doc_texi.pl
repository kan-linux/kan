#! /usr/bin/env perl
# generate_html_doc_texi.pl: use perl data, mainly manually
# generated hashes, to generate Texinfo documentation code.

# Copyright 2023-2026 Free Software Foundation, Inc.
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

use warnings;

# for file names portability
use File::Spec;
# for fileparse
use File::Basename;

BEGIN
{
  # do not load XS code, to avoid both depending on and generating
  # XS code.  Also we do not want to have to find XS object files.
  $ENV{'TEXINFO_XS'} = 'omit';
  # NOTE we do not use Texinfo::ModulePath, as we only have pure perl
  # modules to find, we do not need something as complex, and we would
  # need to find Texinfo::ModulePath anyway, which requires similar code.
  my ($real_command_name, $command_directory, $command_suffix)
   = fileparse($0, '.pl');
  my $updir = File::Spec->updir();
  # tta directory
  my $t2a_srcdir;
  if (defined($ENV{'srcdir'})) {
    # srcdir is doc/
    $t2a_srcdir = join('/', ($ENV{'srcdir'}, $updir, 'tta'));
  } else {
    $t2a_srcdir = join('/', ($command_directory, $updir, 'tta'));
  }

  # find Perl Texinfo modules in srcdir
  unshift @INC, join('/', ($t2a_srcdir, 'perl'));

  my $lib_dir = join('/', ($t2a_srcdir, 'maintain'));
  # we ignore --with-external-*
  unshift @INC, join('/', ($lib_dir, 'lib', 'libintl-perl', 'lib'));
  unshift @INC, join('/', ($lib_dir, 'lib', 'Unicode-EastAsianWidth', 'lib'));
  unshift @INC, join('/', ($lib_dir, 'lib', 'Text-Unidecode', 'lib'));
}

use Texinfo::Commands;
use Texinfo::Convert::HTML;

my $result = '';
# use a generic item instead of a line per accent command
my $accent_command_string = 'accent @@-command';
foreach my $cmdname (sort($accent_command_string, keys(
         %Texinfo::Convert::HTML::html_default_commands_args))) {
  my $args_spec;
  my $item_arg;
  if ($cmdname eq $accent_command_string) {
    $args_spec = $Texinfo::Convert::HTML::html_default_commands_args{'^'};
    $item_arg = $accent_command_string;
  } elsif (exists($Texinfo::Commands::accent_commands{$cmdname})) {
    next;
  } else {
    $item_arg = '@code{@@'.$cmdname.'}';
    $args_spec = $Texinfo::Convert::HTML::html_default_commands_args{$cmdname};
  }
  my $line = '@item '.$item_arg;
  foreach my $spec (@$args_spec) {
    $line .= ' @tab '.join(', ', @$spec);
  }
  $line .= "\n";
  $result .= $line;
}

my $html_command_args_spec_table_file = $ARGV[0];
die "Need a file for HTML arguments table\n"
   if (!defined($html_command_args_spec_table_file));

open(OUT, '>', $html_command_args_spec_table_file)
  or die "Open $html_command_args_spec_table_file: $!\n";

print OUT $result;

close(OUT);


