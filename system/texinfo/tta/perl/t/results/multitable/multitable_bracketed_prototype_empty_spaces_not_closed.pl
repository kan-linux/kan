use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@multitable C2 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C1
     *bracketed_arg l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: \\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
';


$result_texis{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '
@multitable { 
}@end multitable
';


$result_texts{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '
';

$result_errors{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '* E l2|misplaced {
 misplaced {

';

$result_nodes_list{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '';

$result_sections_list{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '';

$result_sectioning_root{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '';

$result_headings_list{'multitable_bracketed_prototype_empty_spaces_not_closed'} = '';

1;
