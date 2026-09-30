use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sc_formatting_with_css'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content C2
   *@settitle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {In title }
     *@sc C1 l1
      *brace_container C1
       {my string}
     { NEXT}
   {empty_line:\\n}
  *paragraph C2
   *@sc C1 l3
    *brace_container C1
     {in sc}
   {. OUT.\\n}
  {empty_line:\\n}
  *@example C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    *@sc C1 l6
     *brace_container C1
      {small case in example}
    { MORE text.\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
';


$result_texis{'sc_formatting_with_css'} = '@settitle In title @sc{my string} NEXT

@sc{in sc}. OUT.

@example
@sc{small case in example} MORE text.
@end example

';


$result_texts{'sc_formatting_with_css'} = '
IN SC. OUT.

SMALL CASE IN EXAMPLE MORE text.

';

$result_errors{'sc_formatting_with_css'} = '';

$result_nodes_list{'sc_formatting_with_css'} = '';

$result_sections_list{'sc_formatting_with_css'} = '';

$result_sectioning_root{'sc_formatting_with_css'} = '';

$result_headings_list{'sc_formatting_with_css'} = '';

1;
