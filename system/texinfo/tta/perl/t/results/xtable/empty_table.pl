use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_table'} = '*document_root C1
 *before_node_section C1
  *@table C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l1
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
';


$result_texis{'empty_table'} = '@table @code
@end table
';


$result_texts{'empty_table'} = '';

$result_errors{'empty_table'} = '';

$result_nodes_list{'empty_table'} = '';

$result_sections_list{'empty_table'} = '';

$result_sectioning_root{'empty_table'} = '';

$result_headings_list{'empty_table'} = '';


$result_converted{'plaintext'}->{'empty_table'} = '';


$result_converted{'html_text'}->{'empty_table'} = '';


$result_converted{'xml'}->{'empty_table'} = '<table commandarg="code" spaces=" " endspaces=" ">
</table>
';


$result_converted{'docbook'}->{'empty_table'} = '<variablelist></variablelist>';

1;
