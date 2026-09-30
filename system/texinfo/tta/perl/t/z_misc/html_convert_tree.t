use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

use Test::More;

BEGIN { plan tests => 6; }

use Texinfo::XSLoader;
use Texinfo::Parser;
use Texinfo::Config;
use Texinfo::Convert::HTML;

my $XS_parser = Texinfo::XSLoader::XS_parser_enabled();

# Test convert_tree from HTML without converter options nor document.
# conversion_initialization needs to be called, otherwise there
# are many structures that are not set for conversion.  This is expected
# for convert_tree, which needs a converter already initialized for
# conversion.

ok(1, 'modules loading');

my $parser = Texinfo::Parser::parser();
my $tree = $parser->parse_texi_line('Some @code{item}');

my $converter = Texinfo::Convert::HTML->converter();
# undef corresponds to the document argument
$converter->conversion_initialization('_no_doc', undef);

my $result = $converter->convert_tree($tree);

is($result, 'Some <code class="code">item</code>',
   'convert tree undef document');

# test with customization
Texinfo::Config::texinfo_register_style_command_formatting('code', 'toto');

$converter = Texinfo::Convert::HTML->converter();
$converter->conversion_initialization('_no_doc_config', undef);

my $result_with_config = $converter->convert_tree($tree);

is($result_with_config, 'Some <toto class="code">item</toto>',
   'config convert tree undef document');

# test diverse possibilities for rebuilt tree

my $document = $parser->parse_texi_piece('N @code{M}');
my $tree_handle = $document->tree(1);

my $result_from_handle = $converter->convert_tree($tree_handle);

my $reference_output = '<p>N <toto class="code">M</toto></p>';
my $reference_from_handle;

SKIP: {
  # Even if $XS_parser is set, if iconv is not functional the Parser XS
  # won't be built, so we cannot be sure that the XS function is called,
  # therefore we skip the test if $XS_parser.
  skip 'Parser may not be XS even with XS_parser set', 1 if ($XS_parser);

if ($XS_parser) {
  # there is no Perl tree, as there is only a handle, convert_tree
  # returns an empty string.
  $reference_from_handle = '';
} else {
  $reference_from_handle = $reference_output;
}

is($result_from_handle, $reference_from_handle,
   'convert tree with tree handle');
}

my $tree_rebuilt = Texinfo::Document::build_tree($tree_handle, 0);
my $result_from_rebuilt = $converter->convert_tree($tree_rebuilt);

is($result_from_rebuilt, $reference_output,
   'convert tree with rebuilt tree handle');

my $other_document = $parser->parse_texi_piece('AA @emph{bb}');
my $other_tree_handle = $other_document->tree(1);

my $other_tree_rebuilt_to_perl_only
  = Texinfo::Document::build_tree($other_tree_handle, 1);
my $result_from_rebuild_perl_only
  = $converter->convert_tree($other_tree_rebuilt_to_perl_only);

is($result_from_rebuild_perl_only, '<p>AA <em class="emph">bb</em></p>',
    'convert tree with tree handle rebuilt to perl');
