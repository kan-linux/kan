use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

my @test_cases = (
['redefined_need',
'@need 0.1
', {'init_files' => ['redefine_need.init']}],
['modified_translation',
'@error{}.

@documentlanguage fr

fr @error{}.

@documentlanguage pt

pt @error{}.

', {'init_files' => ['command_translation_modified.init']}],
['macro_defined_txiinternalvalue_in_translation',
'@sp 1

@sp 2

',{'init_files' => ['translate_txiinternalvalue_macro.init'],
}],
# test accessing setting unknown customization variables, which can only
# be done through init files.  Also requires TEST to be unset to avoid bug
# messages and traces.
['unknown_custom_variable',
'@node Top
@top top

@node Chap
@chapter chap
', {'init_files' => ['unknown_custom_variable.pm']},
   {'TEST' => 0}],
);

my $direction_strings_test_text = '@node Top
@top top

@node chap
@chapter Chap

@node chap2
@chapter Chap 2

@node sec1
@section Sec 1

@node sec2
@section Sec 2

@node sec3
@section Sec 3
';

my $documentation_examples_text = '
@settitle @email{someone@@example.com, me} @sansserif{in--title} @error{} @equiv{}

@contents

@node Top
@top top

@node chapter
@chapter Chapter

@sansserif{in--text} @- p--n. @error{} @equiv{}
@xref{my node}@footnote{in footnote}.
@titlefont{in titlefont}
@email{a@@b.c, someone}
@sc{in Sc}
@var{in var}
@slanted{``slant--@code{this}}

@math{@sansserif{in--math} @- a=b @error{} @equiv{}}

@indentedblock
@example
@sansserif{in--example} @- c. @error{} @equiv{}
@email{a@@example}
@end example
@end indentedblock

@display
@email{a@@display}
@end display

@displaymath
\frac{h}{j@sup{2}} \dv[n]{f}{x}
@end displaymath

@cindex @file{e1}
@cindex i2

@vindex    

@documentlanguage fr

@error{}.

@equiv{}

@contents

@node my node
@chapter New node

@documentlanguage pl

@error{}.

@equiv{}

@node Index
@appendix Index

@printindex cp

@node Second appendix
@appendix Second appendix

';

my $special_unit_direction_customization_text = '@contents

@node Top
@top top

@node chapter
@chapter chap
';

my $directions_buttons_text = '@contents

@node Top
@top top

@node chapter
@chapter chap

@printindex cp

@node @code{append}ix
@appendix App

@cindex Here
';

my @file_tests = (
['customize_translations',
'
@contents

@node Top
@top top

@node Chapter
@chapter chap

@error{}.

@documentlanguage fr
@node Chapter fr
@chapter chap fr

@error{}.

@node section fr
@section sec fr

@documentlanguage de
@node Chapter de
@chapter chap de

@error{}.

@node Last chapter
@chapter Last Chapter

', {'init_files' => ['translated_strings_customization.pm']},
   {'SPLIT' => 'chapter'}],
['undefined_node_filename',
'@node Top

@node chap Other
',{'init_files' => ['undef_node_file_name.init'],
}, {'VERBOSE' => 1}],
['customize_special_element',
'
@contents
@shortcontents

@node Top
@top top

@node Chapter
@chapter chap

@documentlanguage fr
@node Chapter fr
@chapter chap fr

Text@footnote{In footnote}.
', {'init_files' => ['special_element_customization.pm']}],
['documentation_examples',
$documentation_examples_text,
{'init_files' => ['documentation_examples.pm']},
{'CASE_INSENSITIVE_FILENAMES' => 1},
],
['documentation_examples_texi2html',
$documentation_examples_text,
{'init_files' => ['documentation_examples.pm']},
{'TEXI2HTML' => 1, 'CONTENTS_OUTPUT_LOCATION' => 'inline'},
],
['sc_formatting_with_css',
'@settitle In title @sc{my string} NEXT

@sc{in sc}. OUT.

@example
@sc{small case in example} MORE text.
@end example

',{'init_files' => ['sc_formatting_with_css.pm']},
],
# tests translation in parser of def object type index entry, when already
# in a translation (of the Next button).
['translation_in_parser_in_translation',
'@documentlanguage fr

@node Top
@top top

@node chap
@chapter Chap

@deftypeop da db dc dd de
DOC
@end deftypeop

', {'init_files' => ['translation_in_parser_in_translation.pm']}],
# usefull to setup a base for comparison with the next test
['directions_string_base',
$direction_strings_test_text,],
['directions_string_undef',
$direction_strings_test_text,
{'init_files' => ['directions_string_undef.pm']},],
# test texi2html style buttons and directions strings undef
['directions_string_undef_texi2html',
$direction_strings_test_text,
{'init_files' => ['directions_string_undef.pm']},
{'TEXI2HTML' => 1},
],
['redefined_buttons_functions',
$direction_strings_test_text,
{'init_files' => ['redefined_buttons.pm']},
],
['test_format_single_footnote_in_inline_content',
'@node Top
@top top

@node chap
@chapter Chap

a@footnote{In the footnote}.

b@footnote{@c an example in the footnote

@example
in    example
@end example
}

c@footnote{
@*
}

d@footnote{
@quotation qtitle
@author Me
In quotation
@end quotation
}
',
{'init_files' => ['footnote_mark_in_inline_content.pm']},
],
['access_document_name_in_handler',
'@node Top
@top top

@node chap
@chapter Chap
', {'init_files' => ['access_document_name_in_handler.pm']},
],
['access_global_direction_unit_in_handler',
'@node Top
@top top

@node chap
@chapter Chap
', {'init_files' => ['access_global_direction_unit_in_handler.pm']},
],
['access_output_unit_in_handler',
'@node Top
@top top

@node chap
@chapter Chap
', {'init_files' => ['access_output_unit_in_handler.pm']},
],
['access_tree_output_unit_in_handler',
'@node Top
@top top

@node chap
@chapter Chap
', {'init_files' => ['access_tree_output_unit_in_handler.pm']},
],
# a series of tests with special unit direction customization showing the
# effect of adding customization information needed by the change.
['ref_for_special_unit_direction',
$special_unit_direction_customization_text,
],
['special_unit_direction_customization',
$special_unit_direction_customization_text,
{'init_files' => ['special_unit_direction_customization.pm']},
],
['button_replacement_for_special_unit_direction',
$special_unit_direction_customization_text,
{'init_files' => ['button_replacement_for_special_unit_direction.pm']},
],
['button_replacement_and_direction_customization',
$special_unit_direction_customization_text,
{'init_files' => ['special_unit_direction_customization.pm',
                  'button_replacement_for_special_unit_direction.pm']},
],
['button_replacement_direction_strings_customization',
$special_unit_direction_customization_text,
{'init_files' => ['special_unit_direction_customization.pm',
                  'button_replacement_for_special_unit_direction.pm',
                  'special_unit_direction_string_info_customization.pm']},
],
['directions_buttons',
$directions_buttons_text,
{'init_files' => ['directions_buttons.pm']},
],
['directions_buttons_buttons',
$directions_buttons_text,
{'init_files' => ['directions_buttons.pm',
                  'add_directions_buttons.pm']},
],
['printindex_set_direction',
'@node Top
@top top

@node Chapter
@chapter chap

@cindex CC
@vindex VV
@findex FF

@node Vindex
@appendix Vindex

@printindex vr

@node Cindex
@appendix Cindex

@printindex cp

@node Findex
@appendix Findex

@printindex fn
', {'init_files' => ['index_direction_from_index_name.pm']},
],
['prepend_number_redirection_file_names',
'@node Top
@top top

@node Chap
@chapter The chapt

@anchor{Up and Down}

@node 4 section
@section Sect

@anchor{12 lowerc}

@xref{Up and Down}.
@xref{Chap}.
@xref{4 section}.
@xref{12 lowerc}.
', {'init_files' => ['test_customize_redirection_file_names.pm']}
],

# The next test fails on case insensitive platforms, that is why
# it is skipped
['add_lower_case_redirection_file_names',
'@node Top
@top top

@node Chap
@chapter The chapt

@anchor{Up and Down}

@node section
@section Sect

@anchor{lowerc}

@xref{Up and Down}.
@xref{Chap}.
@xref{section}.
@xref{lowerc}.
', {'init_files' => ['lowercase_file_names_and_redirections.pm'],
    'skip' => 'different output with case insensitive file names'}
],
# TODO different result in XS (abort) and in Perl (sets the relative
# direction to the global direction) to be "fixed" before enabling the
# test.
#['set_global_direction_for_relative_direction',
#$direction_strings_test_text,
#{'init_files' => ['set_global_direction_for_relative.pm']},
#],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html';
}

foreach my $test (@file_tests) {
  push @{$test->[2]->{'test_formats'}}, 'file_html';
  $test->[2]->{'test_input_file_name'} = $test->[0] . '.texi';
  $test->[2]->{'full_document'} = 1 unless (exists($test->[2]->{'full_document'}));
}

run_all('init_files_tests', [@test_cases, @file_tests]);
