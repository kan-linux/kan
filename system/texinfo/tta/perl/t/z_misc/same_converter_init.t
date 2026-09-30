use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

use Test::More;

# Verify that calling a converter twice does not break.  Can also
# be used to check that there are no memory leaks with valgrind.
  
BEGIN { plan tests => 2; }

# For consistent test results, use the C locale.
$ENV{LC_ALL} = 'C';
$ENV{LANGUAGE} = 'en';

use File::Spec;

use Texinfo::Parser;
use Texinfo::Convert::HTML;
use Texinfo::Config;
use Texinfo::Tests qw(configure_document_locales find_dirs_t2a is_diff);

my $updir = File::Spec->updir();

my ($t2a_srcdir, $t2a_builddir, $srcdir)
       = find_dirs_t2a($Texinfo::ModulePath::t2a_srcdir,
                       $Texinfo::ModulePath::t2a_builddir);

configure_document_locales($t2a_builddir);

my $default_test_level = 1;
if (defined($Texinfo::ModulePath::default_test_level)
    and ($Texinfo::ModulePath::default_test_level == 1
         or $Texinfo::ModulePath::default_test_level == 2)) {
  $default_test_level = $Texinfo::ModulePath::default_test_level;
}

my $manual_file = join('/', ($t2a_srcdir, $updir, 'doc', 'texinfo.texi'));
my $manual_include_dir = join('/', ($t2a_srcdir, $updir, 'doc'));

my $test_include_dirs = [$manual_include_dir];

my $parser = Texinfo::Parser::parser(
          {'INCLUDE_DIRECTORIES' => $test_include_dirs,}
  );

{
  package Texinfo::Config;

  texinfo_register_no_arg_command_texinfo('equiv', 'is the @strong{same} as');
}

#my $document = $parser->parse_texi_text('aa @equiv{} bb'."\n");
my $document = $parser->parse_texi_file($manual_file);

my $parsing_errors = '';
my ($test_parser_errors, $test_parser_error_count) = $document->parser_errors();
foreach my $error_message (@$test_parser_errors) {
  $parsing_errors .= $error_message->{'error_line'};
}
if (!defined($document)) {
  die "Unexpected parsing errors: $parsing_errors";
}

my ($converter, $result_html, $second_result_html);
$converter = Texinfo::Convert::HTML->converter({'TEST' => $default_test_level});

$result_html = $converter->convert($document);
#print STDERR "1 $result_html\n";

$converter->converter_remove_output_units();

$second_result_html = $converter->convert($document);
#print STDERR "2 $second_result_html\n";

$converter->converter_remove_output_units();
$converter->destroy_converter();

is_diff($result_html, $second_result_html,
   'two call of converter give the same result');

$converter = Texinfo::Convert::HTML->converter({'TEST' => $default_test_level,
                                        'OUTPUT_CHARACTERS' => 1});

my $simple_document
  = $parser->parse_texi_text(
         'aa @equiv{} bb @geq{} cc @error{} @enddots{}'."\n");

$result_html = $converter->convert($simple_document);

$converter->converter_remove_output_units();

$second_result_html = $converter->convert($simple_document);

$converter->converter_remove_output_units();
$converter->destroy_converter();

is_diff($result_html, $second_result_html,
   'output characters simple doc two call of converter same result');

