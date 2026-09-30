use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_caption'} = '*document_root C2
 *before_node_section C1
  {empty_line:\\n}
 *@node C5 l2 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@float C5 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{a}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{b}
   *arguments_line C2
    *block_line_arg C1
     {a}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {b}
   *paragraph C1
    {aa\\n}
   *@caption C1 l6
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{a}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a}
';


$result_texis{'empty_caption'} = '
@node Top

@float a,b
aa
@caption{}
@end float

@listoffloats a
';


$result_texts{'empty_caption'} = '

a, b
aa

';

$result_errors{'empty_caption'} = '';

$result_floats{'empty_caption'} = 'a: 1
 F1: {b}
  C(E)
';

$result_nodes_list{'empty_caption'} = '1|Top
';

$result_sections_list{'empty_caption'} = '';

$result_sectioning_root{'empty_caption'} = '';

$result_headings_list{'empty_caption'} = '';


$result_converted{'info'}->{'empty_caption'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

aa

a 1: 

* Menu:

* a 1: b.                                


Tag Table:
Node: Top27
Ref: b61

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
