use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'math_leading_trailing_spaces'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@math C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C1
     {a = b }
';


$result_texis{'math_leading_trailing_spaces'} = '@math{ a = b }';


$result_texts{'math_leading_trailing_spaces'} = 'a = b ';

$result_errors{'math_leading_trailing_spaces'} = '';

$result_nodes_list{'math_leading_trailing_spaces'} = '';

$result_sections_list{'math_leading_trailing_spaces'} = '';

$result_sectioning_root{'math_leading_trailing_spaces'} = '';

$result_headings_list{'math_leading_trailing_spaces'} = '';

1;
