# Set path to find modules and utility functions for tests

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

package Texinfo_SWIG_Interface_Tests;

use strict;

# for fileparse
use File::Basename;
use File::Spec;
use Test::More;

my ($real_command_name, $command_directory, $command_suffix)
              = fileparse($0, '.pl');
my $updir = File::Spec->updir();

# Nothing needed in source directory for now, but keep the include there
# nonetheless
my $srcdir = $ENV{'srcdir'};
if (!defined($srcdir)) {
  $command_directory = File::Spec->curdir()
    if (!defined($command_directory) or $command_directory eq '');
  $srcdir = join('/', ($command_directory, $updir));
}
unshift @INC, $srcdir;

# To find the Perl module and the XS module
my $t2a_builddir = $ENV{'t2a_builddir'};
if (!defined($t2a_builddir) and defined($srcdir)) {
  # this is correct for in-source builds only.
  $t2a_builddir = join('/', ($srcdir, $updir, $updir));
}
if (defined($t2a_builddir)) {
  my $xsdir = join('/', ($t2a_builddir, 'swig', 'perl', '.libs'));
  if (-d $xsdir) {
    # for Texinfo.pm
    unshift @INC, join('/', ($t2a_builddir, 'swig', 'perl'));
    unshift @INC, $xsdir;
  } # if the directory is not present, we assume a MakeMaker build
}

eval { require Text::Diff; Text::Diff->import('diff'); };

my $text_diff_loading_error = $@;

sub is_diff($$$) {
  my ($result, $reference, $test_name) = @_;

  #if (!$test_differences_loading_error) {
  #  eq_or_diff_text($result, $reference, $test_name);
  #} elsif ($text_diff_loading_error) {
  if ($text_diff_loading_error or !defined($reference)
      or ref($reference) ne '' or !defined($result)) {
    is($result, $reference, $test_name);
  } else {
    ok($result eq $reference, $test_name)
       or note((diff(\$result, \$reference)));
    #is($result, $reference, $test_name) or note(diff(\$result, \$reference));
  }
}

# also in tta/perl/t/test_utils.pl
sub protect_perl_string($) {
  my $string = shift;

  #if (!defined($string)) {
  #  cluck();
  #}
  $string =~ s/\\/\\\\/g;
  $string =~ s/'/\\'/g;
  # \r can be mangled upon reading if at end of line
  $string =~ s/\r/'."\\r".'/g;
  return $string;
}

sub get_parser_error_messages($) {
  my $document = shift;

  my @error_messages;
  my ($parser_error_msgs, $error_nr)
     = Texinfo::get_parser_error_messages($document);
  if (defined($parser_error_msgs)) {
    my $msgs_nr = Texinfo::messages_list_messages_number($parser_error_msgs);
    for (my $i = 0; $i < $msgs_nr; $i++) {
      my $error_msg
         = Texinfo::messages_list_message_by_index($parser_error_msgs, $i);
      push @error_messages, $error_msg->swig_formatted_get();
    }
  }
  return \@error_messages;
}

1;
