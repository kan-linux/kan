use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

use Test::More;

BEGIN { plan tests => 5; }

use Texinfo::Parser;
# The conversion to raw text is possibly done with XS, but the converter
# itself is the Perl version as there is no XS interface for the Perl converter
# functions even though there is a full implementation in C of a raw text
# converter that can be used from C.
use Texinfo::Convert::Text;

ok(1, 'modules loading');

my $converter = Texinfo::Convert::Text->converter({'TEST' => 1,
                                                   'ASCII_GLYPH' => 1,
                                                   'ENABLE_ENCODING' => 1});

my $texinfo_code = '@node top
@top A top


@node chap
@chapter Chap

@copyright{} @today{}.
@AA{}.

@node appendix
@appendix Conclusion
';

my $parser = Texinfo::Parser::parser();

my $document = $parser->parse_texi_text($texinfo_code);

my $result_text = $converter->convert($document);

# This also tests a situation where Texinfo::Structuring::sectioning_structure
# is not called.  There are therefore no sectioning commands numbers.
my $reference_result_text =
"A top
*****


Chap
****

(C) a sunny day.
\x{00C5}.

Conclusion
**********
";
is($result_text, $reference_result_text, 'test convert');

#print STDERR "$result_text";

my $tree = $parser->parse_texi_line('@code{@bullet{} something} ``@^a---');

my $result_line = $converter->convert_tree($tree);

is($result_line, "* something \"\x{00E2}--", 'test convert_tree');
#print STDERR "RRR '$result_line'\n";

Texinfo::Convert::Text::set_options_code($converter);
my $result_code = $converter->convert_tree($tree);
Texinfo::Convert::Text::reset_options_code($converter);

is($result_code, "* something ``\x{00E2}---",
                 'test convert_tree in code context');

my $converter_undef_outfile = Texinfo::Convert::Text->converter({'TEST' => 1,
                                                      'ASCII_GLYPH' => 1,
                                                      'ENABLE_ENCODING' => 1,
                   # for the test, OUTFILE can be explicitly undef or not set
                                                      #'OUTFILE' => undef,
                                                      'SUBDIR' => 'toto'});

my $result_undef_outfile = $converter_undef_outfile->output($document);

is($result_undef_outfile, $reference_result_text,
   'test output with unset outfile');
