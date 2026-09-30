use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_arguments'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C6
   *@strong C1 l2
    *brace_container
   {\\n}
   *@uref C2 l3
    *brace_arg
    *brace_arg
   {\\n}
   *@abbr C2 l4
    *brace_arg C1
     {a}
    *brace_arg
   {\\n}
';


$result_texis{'empty_arguments'} = '
@strong{}
@uref{,}
@abbr{a,}
';


$result_texts{'empty_arguments'} = '


a
';

$result_errors{'empty_arguments'} = '';

$result_nodes_list{'empty_arguments'} = '';

$result_sections_list{'empty_arguments'} = '';

$result_sectioning_root{'empty_arguments'} = '';

$result_headings_list{'empty_arguments'} = '';


$result_converted{'info'}->{'empty_arguments'} = 'This is , produced from .

** a

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'empty_arguments'} = '* W |document without nodes
 warning: document without nodes

';

1;
