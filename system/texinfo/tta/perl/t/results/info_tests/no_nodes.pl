use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_nodes'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   {Text.}
';


$result_texis{'no_nodes'} = 'Text.';


$result_texts{'no_nodes'} = 'Text.';

$result_errors{'no_nodes'} = '';

$result_nodes_list{'no_nodes'} = '';

$result_sections_list{'no_nodes'} = '';

$result_sectioning_root{'no_nodes'} = '';

$result_headings_list{'no_nodes'} = '';


$result_converted{'info'}->{'no_nodes'} = 'This is , produced from .

Text.

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'no_nodes'} = '* W |document without nodes
 warning: document without nodes

';

1;
