use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_top_node'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {node Top not Top node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{node-Top-not-Top-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node Top not Top node}
';


$result_texis{'no_top_node'} = '@node node Top not Top node
';


$result_texts{'no_top_node'} = '';

$result_errors{'no_top_node'} = '';

$result_nodes_list{'no_top_node'} = '1|node Top not Top node
';

$result_sections_list{'no_top_node'} = '';

$result_sectioning_root{'no_top_node'} = '';

$result_headings_list{'no_top_node'} = '';


$result_converted{'info'}->{'no_top_node'} = 'This is , produced from .


File: ,  Node: node Top not Top node


Tag Table:
Node: node Top not Top node27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'no_top_node'} = '* W |document without Top node
 warning: document without Top node

';

1;
