use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unknown_encoding'} = '*document_root C2
 *before_node_section C3
  {empty_line:\\n}
  *@documentencoding C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |text_arg:{ggg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ggg}
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


$result_texis{'unknown_encoding'} = '
@documentencoding ggg

@node Top

';


$result_texts{'unknown_encoding'} = '


';

$result_errors{'unknown_encoding'} = '* W l2|encoding `ggg\' is not a canonical texinfo encoding
 warning: encoding `ggg\' is not a canonical texinfo encoding

* W l2|unhandled encoding name `ggg\'
 warning: unhandled encoding name `ggg\'

';

$result_nodes_list{'unknown_encoding'} = '1|Top
';

$result_sections_list{'unknown_encoding'} = '';

$result_sectioning_root{'unknown_encoding'} = '';

$result_headings_list{'unknown_encoding'} = '';


$result_converted{'info'}->{'unknown_encoding'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
