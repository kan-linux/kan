# Copyright 2010-2026 Free Software Foundation, Inc.
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

# Compare index sorting obtained with the Perl texi2any modules and the
# SWIG Perl interface.

use strict;

# for cmp_deeply
use Test::Deep;

use Data::Compare ();
use Test::More;

plan tests => 2;

# to find Texinfo_SWIG_Interface_Tests in source
use lib '.';

BEGIN {
  # to find Texinfo_SWIG_Interface_Tests in out of source builds
  my $srcdir = $ENV{'srcdir'};
  if (defined($srcdir)) {
    unshift @INC, $srcdir;
  }
}

# Load texi2any Perl modules
# to find Texinfo::ModulePath in build directory
use lib '../../perl/';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);
use Texinfo::Parser;
use Texinfo::Document;
use Texinfo::Convert::Texinfo;
use Texinfo::Common;

# load SWIG interface Perl module
use Texinfo_SWIG_Interface_Tests;
use Texinfo;

Texinfo::setup(1);

# first two blocks based on t/z_misc/test_sort.t
my $index_entries = '

@cindex !
@cindex e
@cindex E
@cindex ``
@cindex @~e
@cindex
@cindex aaaaaaaaaaaa
@cindex @l{}

@cindex hhh @subentry jjj @subentry lll
@cindex hhh @subentry jjj
@cindex hhh jjj
@cindex hhh @subentry k
@cindex hhh @subentry 
@cindex hhh 
@cindex hhh @subentry jjj @subentry lll
@cindex hhh 
@cindex @samp{hhh} @subentry jjj
@cindex @kbd{hhh} @subentry @sc{jjj} @subentry @email{jjj,mymail}
@cindex @subentry aa
@cindex hhh @subentry jjj @subentry lll @sortas{A}

@cindex a-b
@cindex a b
@cindex a,b
@cindex a^b
@cindex ab

';

my $texi = '@node Top

'.$index_entries;

my $index_name = 'cp';

#print $texi . "\n\@printindex cp\n" ;


# First determine the reference index entries sorting order by using
# texi2any Perl code
my $parser = Texinfo::Parser::parser();

my $doc = $parser->parse_texi_text($texi);
my $sorted_indices
   = Texinfo::Document::sorted_indices_by_index($doc, undef, 1, undef);
my $sorted_entries = $sorted_indices->{$index_name};
my @reference_index_entries_texi;
foreach my $index_entry (@$sorted_entries) {
  #print STDERR join('|', sort(keys(%{$index_entry})))."\n";
  my $main_entry_element = $index_entry->{'entry_element'};
  my $entry_content_element
     = Texinfo::Common::index_content_element($main_entry_element);
  push @reference_index_entries_texi,
         Texinfo::Convert::Texinfo::convert_to_texinfo($entry_content_element);
}

#print STDERR @reference_index_entries_texi;


# Now determine the order based on the SWIG interface
my $swig_parser = Texinfo::parser();
my $document = Texinfo::parse_text($swig_parser, $texi);

Texinfo::destroy_parser($swig_parser);

#Texinfo::output_parser_error_messages($document);

my $error_messages
  = Texinfo_SWIG_Interface_Tests::get_parser_error_messages($document);

#foreach my $message (@$error_messages) {
#  print STDERR "'"
#       .Texinfo_SWIG_Interface_Tests::protect_perl_string($message)."',\n";
#}

my @reference_messages = ('10: warning: @cindex missing argument
',
'18: warning: @subentry missing argument
',
);
ok(Data::Compare::Compare($error_messages, \@reference_messages), 'errors');


my $sorted_index = Texinfo::get_index_sorted_by_index($document, $index_name);

#my $result = "SORTED ${index_name}:\n";

my @interface_index_entries_texi;
my $sorted_index_entries_nr
   = Texinfo::sorted_index_entries_number($sorted_index);
for (my $i  = 0; $i < $sorted_index_entries_nr; $i++) {
  my $index_entry = Texinfo::sorted_index_entries_by_index($sorted_index, $i);
  my $main_entry_element = $index_entry->swig_entry_element_get();
  my $entry_content_element = Texinfo::index_content_element($main_entry_element);
  push @interface_index_entries_texi,
         Texinfo::convert_to_texinfo($entry_content_element);
}

#print STDERR @interface_index_entries_texi;

cmp_deeply(\@interface_index_entries_texi,
           \@reference_index_entries_texi, 'sorted');


1;
