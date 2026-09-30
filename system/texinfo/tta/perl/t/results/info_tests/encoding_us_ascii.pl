use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'encoding_us_ascii'} = '*document_root C2
 *before_node_section C3
  {empty_line:\\n}
  *@documentencoding C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{us-ascii}
  |text_arg:{US-ASCII}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {US-ASCII}
  {empty_line:\\n}
 *@node C2 l4 {Top}
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
';


$result_texis{'encoding_us_ascii'} = '
@documentencoding US-ASCII

@node Top

';


$result_texts{'encoding_us_ascii'} = '


';

$result_errors{'encoding_us_ascii'} = '';

$result_nodes_list{'encoding_us_ascii'} = '1|Top
';

$result_sections_list{'encoding_us_ascii'} = '';

$result_sectioning_root{'encoding_us_ascii'} = '';

$result_headings_list{'encoding_us_ascii'} = '';


$result_converted{'info'}->{'encoding_us_ascii'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: us-ascii
End:
';

1;
