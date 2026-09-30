#! /usr/bin/env perl

# regenerate_documentlanguages-loc.pl: download the ISO 639-2 files language
# and ISO 3166-1 alpha-2 codes and regenerate perl/Texinfo/Documentlanguages.pm
# list of languages and regions
#
# Copyright 2022-2026 Free Software Foundation, Inc.
# 
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
#
# Original author: Patrice Dumas <pertusus@free.fr>
#
# Call that script from the tta directory for each release to keep
# the lists updated.

use strict;

use warnings;

use File::Basename;

use List::Util qw(first);
# not in Perl core standard modules
use Text::CSV;

my $dir = 'maintain/documentlanguage';
system("cd $dir && wget -N https://www.loc.gov/standards/iso639-2/ISO-639-2_utf-8.txt");
# the ISO 3166-1 alpha-2 codes are not easily accessible from the ISO website, there is
# an interface not a raw download (seems incredible, but true...).
# Use the country code project data from https://github.com/datasets/country-codes
system("cd $dir && wget -N https://raw.githubusercontent.com/datasets/country-codes/refs/heads/main/data/country-codes.csv");

open(TXT, "$dir/ISO-639-2_utf-8.txt") or die "Open $dir/ISO-639-2_utf-8.txt: $!\n";
binmode(TXT, ":utf8");

my @entries;
while (<TXT>) {
  my @entry = split /\|/;
  if ($entry[2] ne '') {
    push @entries, $entry[2];
  # only individual languages
  } elsif ($entry[3] !~ /languages$/) {
    # there are 4 special codes
    # mis Uncoded languages
    # mul Multiple languages
    # und Undetermined
    # zxx No linguistic content; Not applicable
    # This is not very useful, but we accept mis and und, but not mul,
    # as multiple @documentlanguage are valid, nor zxx
    push @entries, $entry[0] unless ($entry[0] eq 'zxx' or $entry[0] eq 'mul');
  }
}

my $fh;
open($fh, "$dir/country-codes.csv") or die "Open $dir/country-codes.csv: $!\n";
binmode($fh, ":utf8");

my $csv = Text::CSV->new();

my @region_codes;
my $row = $csv->getline($fh);
my $code_header_index = first { $row->[$_] eq 'ISO3166-1-Alpha-2' } 0..scalar(@$row);

if (not defined($code_header_index)) {
  print STDERR "regions_header: ".join('|', @$row)."\n";
  die;
}

my %regions;
while (my $row = $csv->getline ($fh)) {
  if ($row->[$code_header_index] ne '') {
    $regions{$row->[$code_header_index]} = 1;
  }
}
# Namibia NA ISO3166-1-Alpha-2 code is missing in 2025, add it
# https://www.iso.org/obp/ui/#iso:code:3166:NA
$regions{'NA'} = 1;

my $program_name = basename($0);

my $perl_out_file_name = 'perl/Texinfo/Documentlanguages.pm';

open(OUT, ">$perl_out_file_name") or die "Open $perl_out_file_name: $!\n";

my $declarations = "%{\n#include <config.h>\n%}\n"
                   ."%includes\n%%\n";
open(LANGUAGES, ">$dir/languages.gperf") or die "Open $dir/languages.gperf: $!\n";
print LANGUAGES $declarations;

open(REGIONS, ">$dir/regions.gperf") or die "Open $dir/regions.gperf: $!\n";
print REGIONS $declarations;

print OUT "# This file was automatically generated from $program_name\n\n";

print OUT "package Texinfo::Documentlanguages;\n\n";

print OUT 'our %language_codes = ('."\n";
foreach my $entry (sort @entries) {
  print OUT "'$entry' => 1,\n";
  print LANGUAGES "$entry\n";
}
print OUT ");\n\n";

print OUT 'our %region_codes = ('."\n";
foreach my $region (sort keys %regions) {
  print OUT "'$region' => 1,\n";
  print REGIONS "$region\n";
}
print OUT ");\n\n1;\n";

system ("gperf --output-file=C/main/txi_documentlanguage_languages.c -N txi_in_language_codes $dir/languages.gperf");
system ("gperf --output-file=C/main/txi_documentlanguage_regions.c -N txi_in_language_regions $dir/regions.gperf");

1;
