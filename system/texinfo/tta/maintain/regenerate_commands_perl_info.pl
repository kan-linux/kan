#! /usr/bin/env perl

# regenerate_perl_command_infos.pl: generate perl hashes based on
# commands information also used in C.
#
# Copyright 2022-2026 Free Software Foundation, Inc.
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

use File::Basename;

# need this information to fill in automatically the index commands
my %index_in_code = (
 'cp' => 0,
 'fn' => 1,
 'vr' => 1,
 'ky' => 1,
 'pg' => 1,
 'tp' => 1,
);

my %command_categories;
my %flags_hashes;
my %command_args_nr;

while (<STDIN>) {
  if (not (/^#/ or /^ *$/)) {
    my ($command, $flags, $type, $args_nr) = split;
    my @flags = split /,/, $flags;
    #print STDERR "$command, ".join('|',@flags).", $data, $args_nr\n";
    $type = 'other' if (!defined($type) or $type eq '');

    my $category = shift @flags;

    if (!defined($category)) {
      die "$command: no flags\n";
    }

    $command_categories{$category} = {} if (!$command_categories{$category});
    $command_categories{$category}->{$type} = []
        if not ($command_categories{$category}->{$type});
    push @{$command_categories{$category}->{$type}}, $command;

    foreach my $flag (@flags) {
      $flags_hashes{$flag} = [] if (!$flags_hashes{$flag});
      push @{$flags_hashes{$flag}}, $command;
    }

    if (defined($args_nr) and $args_nr ne '') {
      $command_args_nr{$command} = $args_nr;
    }
  }
}

#print STDERR "Categories: ".join('|', sort(keys(%command_categories)))."\n";

my $out_file = $ARGV[0];
die "Need an output file\n" if (!defined($out_file));

open(OUT, ">$out_file") or die "Open $out_file: $!\n";

my $program_name = basename($0);

print OUT "# Automatically generated from $program_name\n\n";

print OUT "package Texinfo::Commands;\n\n";

foreach my $category (sort(keys(%command_categories))) {
  print OUT "our %${category}_commands = (\n";
  foreach my $type (sort(keys(%{$command_categories{$category}}))) {
    foreach my $command (sort(@{$command_categories{$category}->{$type}})) {
      print OUT '  '.sprintf('%-25s', '"'.$command.'"')." => '$type',\n";

      # set no_paragraph flag for all the line and block commands
      push @{$flags_hashes{'no_paragraph'}}, $command
          if ($category eq 'line' or $category eq 'block');
    }
  }
  print OUT ");\n\n";
}

print OUT "\n";
print OUT "# flag hashes\n";

foreach my $hash_flag (sort(keys(%flags_hashes))) {
  print OUT "our %${hash_flag}_commands = (\n";
  foreach my $command (sort(@{$flags_hashes{$hash_flag}})) {
    print OUT '  '.sprintf('%-25s', '"'.$command.'"')." => 1,\n";
  }
  print OUT ");\n\n";
}

print OUT "\n";
print OUT '# @-commands max number of arguments.  Not set for all commands,
# in general it only matters if > 1, as commands with 0 args
# are in specific categories, and default handling of commands
# ignore commas as argument delimiter, which corresponds to commands
# with 1 argument.  Mostly used in Parser.
our %commands_args_number = (
';
foreach my $args_command (sort(keys(%command_args_nr))) {
  my $args_nr = $command_args_nr{$args_command};
  print OUT '  '.sprintf('%-25s', '"'.$args_command.'"')." => $args_nr,\n";
}
print OUT ");\n\n";

print OUT "\n";
print OUT "# indices\n";
print OUT "our %index_names = (\n";
foreach my $index_name (sort(keys(%index_in_code))) {
  my $in_code = $index_in_code{$index_name};
  print OUT "'$index_name' => {'in_code' => $in_code},\n";
}
print OUT ");\n\n";

# add code that sets %default_index_commands for index commands based
# on %index_names
print OUT 'foreach my $index (keys(%index_names)) {
  $index_names{$index}->{"name"} = $index;
}

our %default_index_commands;
foreach my $index_name (keys (%index_names)) {
  my $one_letter_prefix = substr($index_name, 0, 1);
  foreach my $prefix ($index_name, $one_letter_prefix) {
    $default_index_commands{$prefix."index"} = $index_name;
  }
}
';

print OUT "1;\n";
