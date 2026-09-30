use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_text_encoded'} = '*document_root C1
 *before_node_section C4
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {utf-8}
  {empty_line:\\n}
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {image_encoded}
  {\\n}
';


$result_texis{'image_text_encoded'} = '@documentencoding utf-8

@image{image_encoded}
';


$result_texts{'image_text_encoded'} = '
image_encoded
';

$result_errors{'image_text_encoded'} = '';

$result_nodes_list{'image_text_encoded'} = '';

$result_sections_list{'image_text_encoded'} = '';

$result_sectioning_root{'image_text_encoded'} = '';

$result_headings_list{'image_text_encoded'} = '';


$result_converted{'info'}->{'image_text_encoded'} = 'This is , produced from .

îmage encodée

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'image_text_encoded'} = '* W |document without nodes
 warning: document without nodes

';

1;
