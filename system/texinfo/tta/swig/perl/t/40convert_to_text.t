use strict;

use Test::More;
use Encode;

BEGIN { plan tests => 1; }

# to find Texinfo_SWIG_Interface_Tests in source
use lib '.';

BEGIN {
  # to find Texinfo_SWIG_Interface_Tests in out of source builds
  my $srcdir = $ENV{'srcdir'};
  if (defined($srcdir)) {
    unshift @INC, $srcdir;
  }
}

use Texinfo_SWIG_Interface_Tests;

use Texinfo;

sub _decode($) {
  my $text = shift;
  return Encode::decode('UTF-8', $text);
}

Texinfo::setup(1);

# Same text as in t/z_misc/raw_text_converter.t

my $texinfo_code = '@node top
@top A top


@node chap
@chapter Chap

@copyright{} @today{}.
@AA{}.

@node appendix
@appendix Conclusion
';

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

my $parser = Texinfo::parser();
my $document = Texinfo::parse_text($parser, $texinfo_code);

Texinfo::destroy_parser($parser);

Texinfo::output_parser_error_messages($document);

my $tree = Texinfo::document_tree($document);

Texinfo::set_document_options($document);

my $text_options = Texinfo::document_text_options($document);
Texinfo::text_options_set_ASCII_GLYPH($text_options, 1);
Texinfo::text_options_set_TEST($text_options, 1);
# In regular converters, the ENABLE_ENCODING value comes from default
# converter options or from the main program, and OUTPUT_ENCODING_NAME
# comes from set_document set_output_encoding call on converter and document
# and both are used to set the text options encoding/enables_encoding.

# In the raw_text_converter.t test, ENABLE_ENCODING is set to 1, here we
# simply consider that it is set.
# For OUTPUT_ENCODING_NAME, getting it from document global information
# as we do here corresponds well to the set_output_encoding call used in general.
my $global_info = Texinfo::document_global_information($document);
my $encoding = $global_info->swig_input_encoding_name_get();
Texinfo::text_options_set_encoding($text_options, $encoding);

my $text = Texinfo::convert_to_text($tree, $text_options);
my $result_text = _decode($text);

Texinfo_SWIG_Interface_Tests::is_diff($result_text, $reference_result_text,
                                     'convert to text');

