use strict;

use Test::More;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

BEGIN { plan tests => 40; }

use Texinfo::Parser;
use Texinfo::Transformations;
use Texinfo::Convert::Texinfo;
use Texinfo::Document;
use Texinfo::Structuring;
use Texinfo::XSLoader;

#use Data::Dumper;

ok(1, 'modules loading');


my $XS_structuring = Texinfo::XSLoader::XS_structuring_enabled();

# No real test of XS for the tests based on test_new_node.

sub test_new_node($$$$;$)
{
  my $in = shift;
  my $normalized_ref = shift;
  my $out = shift;
  my $name = shift;
  my $errors_references = shift;

  my $parser = Texinfo::Parser::parser();
  # _new_node transformations are only for a Perl tree, therefore the link
  # to C data need to be removed such that the conversion back to Texinfo
  # uses the Perl tree and not the C tree, which has not been built nor
  # modified.
  my $node_tree = $parser->parse_texi_line($in, undef, 1);
  # setup a reference to the added node to test that
  # associate_internal_references takes into account the new node.  Since
  # $in has no protection of node special constructs, such as comma...
  # the reference may be bogus without meaning that the test is
  # failed.
  # The end of line is there in case $in ends with a @c comment.
  my $document = $parser->parse_texi_text("\@ref{$in\n}");

  my $node = Texinfo::Transformations::_new_node($node_tree, $document);

  my ($texi_result, $normalized);
  if (defined($node)) {
    # The XS interface is used, but since there is no change in the C data,
    # the cached Perl data, which has been sneakily modified by _new_node
    # is returned.  Not robust, but works.
    my $identifier_target = $document->labels_information();
    $normalized = $node->{'extra'}->{'normalized'};
    my @identifiers = sort(keys(%$identifier_target));
    if (scalar(@identifiers) != 1) {
      print STDERR " $name identifiers: !! ".join('|', @identifiers)."\n";
    }
    ok((scalar(@identifiers) == 1 and $identifiers[0] eq $normalized),
       "$name label");

    Texinfo::Structuring::associate_internal_referencesNonXS($document);

    $texi_result = Texinfo::Convert::Texinfo::convert_to_texinfo($node);

    my $reference_error_nrs = 0;
    if (defined($errors_references)) {
      $reference_error_nrs = scalar(@$errors_references);
    }

    my ($document_errors, $document_errors_count)
      = $document->errors();

    is(scalar(@$document_errors), $reference_error_nrs,
       "error nr $name");

    my $error_idx = 0;
    foreach my $error_message (@$document_errors) {
      if (defined($errors_references)
          and $error_idx < scalar(@$errors_references)) {
        my $error_line_reference
          = $errors_references->[$error_idx];
        is($error_message->{'error_line'}, $error_line_reference."\n",
           "$name error message $error_idx");
      } else {
        my $line = $error_message->{'error_line'};
        chomp($line);
        warn "not caught: $error_idx: '$line'\n";
      }
      $error_idx++;
    }
  }
  if (!defined($normalized_ref) and defined($normalized)) {
    print STDERR " --> $name($normalized): $texi_result";
  } else {
    is($normalized, $normalized_ref, "$name normalized");
    is($texi_result, $out, $name);
  }
}

test_new_node ('a node', 'a-node', '@node a node
', 'simple');
test_new_node ('a node @code{in code} @c comment
', 'a-node-in-code', '@node a node @code{in code} @c comment
', 'complex');
test_new_node ('a ,, node @code{a,b,}', 'a-_002c_002c-node-a_002cb_002c',
'@node a @comma{}@comma{} node @code{a@comma{}b@comma{}}
', 'with comma',
# the unescaped comma in the tested reference starts a new argument
# therefore the node name is not the added node protected node name
['@ref reference to nonexistent node `a\'']);
test_new_node ('(in paren(too  aaa', '_0028in-paren_0028too-aaa',
'@node @asis{(}in paren(too  aaa
', 'with parenthesis',
['warning: @ref to `(in paren(too  aaa\', different from node name `@asis{(}in paren(too  aaa\'']);
test_new_node ('changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})',
'changed-node-and-_0028file_0029',
'@node changed @code{node} and (@samp{file})
',
'ref in new node',
['@ref reference to nonexistent node `@code{node}\'',
 'warning: @ref to `changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})\', different from node name `changed @code{node} and (@samp{file})\'']);
test_new_node ('@asis{}', '-1', '@node @asis{} 1
', 'empty node',
['@ref reference to nonexistent node `@asis{}\'']);
test_new_node ('a::b	 c', 'a_003a_003ab-c', '@node a@asis{::}b@asis{	} c
', 'with colon and tab',
['warning: @ref to `a::b	 c\', different from node name `a@asis{::}b@asis{	} c\'']);

my $parser = Texinfo::Parser::parser();
my $document = $parser->parse_texi_text('@node a node
');
my $tree = $document->tree();
my $line_parser = Texinfo::Parser::parser();
my $line_tree = $line_parser->parse_texi_line('a node', undef, 1);

# No real test of XS
my $new_node = Texinfo::Transformations::_new_node($line_tree, $document);
is('@node a node 1
',  Texinfo::Convert::Texinfo::convert_to_texinfo($new_node),
    'duplicate node added');

#print STDERR Texinfo::Convert::Texinfo::convert_to_texinfo($new_node);

# Following tests test the XS code

my $sections_text =
'@top top section

@part part

@chapter chap, @code{a chap}

@node a node
@section section

@section truc
@subsection sub1

Text.

@subsection sub2 @c comment

@section section

@section section

@unnumbered

@section @asis{}

@bye';

my $reference =
'@node Top
@top top section

@part part

@node chap@comma{} @code{a chap}
@chapter chap, @code{a chap}

@node a node
@section section

@node truc
@section truc
@node sub1
@subsection sub1

Text.

@node sub2
@subsection sub2 @c comment

@node section
@section section

@node section 1
@section section

@node  1
@unnumbered

@node @asis{} 2
@section @asis{}

@bye';

$parser = Texinfo::Parser::parser();
$document = $parser->parse_texi_text($sections_text);

Texinfo::Structuring::associate_internal_references($document);
Texinfo::Transformations::insert_nodes_for_sectioning_commands($document);

$tree = $document->tree();
my $result = Texinfo::Convert::Texinfo::convert_to_texinfo($tree);
is($result, $reference, 'add nodes');
#print STDERR "$result";

$parser = Texinfo::Parser::parser();
$document = $parser->parse_texi_text('@node Top
@top top

@chapter chap

@cindex index entry

@menu
* (some_manual)::
@end menu
');
Texinfo::Structuring::associate_internal_references($document);
Texinfo::Transformations::insert_nodes_for_sectioning_commands($document);

my $identifier_target = $document->labels_information();
my $indices_information = $document->indices_information();
my $nodes_list = $document->nodes_list();
my $chap_node = $identifier_target->{'chap'};
my $top_node = $identifier_target->{'Top'};
my $chap_structure = $nodes_list->[$chap_node->{'extra'}->{'node_number'} -1];
my $top_structure = $nodes_list->[$top_node->{'extra'}->{'node_number'} -1];
ok(($chap_structure->{'menus'}
    and scalar(@{$chap_structure->{'menus'}}) == 1
    and !exists($top_structure->{'menus'})),
   'new node has a menu');
is(Texinfo::Convert::Texinfo::convert_to_texinfo(
            $chap_structure->{'menus'}->[0]),
'@menu
* (some_manual)::
@end menu
', 'reassociated menu is correct');
#print STDERR join('|',
#               keys(%{$indices_information->{'cp'}->{'index_entries'}}))."\n";
is('chap',
   $indices_information->{'cp'}->{'index_entries'}->[0]
                              ->{'entry_element'}->{'extra'}->{'element_node'},
  'index entry reassociated');
#$tree = $document->tree();
#print STDERR Texinfo::Convert::Texinfo::convert_to_texinfo($tree);

