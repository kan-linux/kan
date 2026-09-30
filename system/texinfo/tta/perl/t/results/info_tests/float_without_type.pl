use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'float_without_type'} = '*document_root C2
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
  *@float C3 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{a}
  |global_command_number:{1}
   *arguments_line C2
    *block_line_arg C1
     {a}
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {aa\\n}
   *@end C1 l6
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
  *@listoffloats C1 l8
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


$result_texis{'float_without_type'} = '
@node Top

@float a,
aa
@end float

@listoffloats a
';


$result_texts{'float_without_type'} = '

a
aa

';

$result_errors{'float_without_type'} = '';

$result_floats{'float_without_type'} = 'a: 1
 F
';

$result_nodes_list{'float_without_type'} = '1|Top
';

$result_sections_list{'float_without_type'} = '';

$result_sectioning_root{'float_without_type'} = '';

$result_headings_list{'float_without_type'} = '';


$result_converted{'info'}->{'float_without_type'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

aa

a

* Menu:



Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
