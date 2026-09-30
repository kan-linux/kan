use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'U_no_braces'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@U l1
';


$result_texis{'U_no_braces'} = '@U';


$result_texts{'U_no_braces'} = '';

$result_errors{'U_no_braces'} = '* E l1|@U expected braces
 @U expected braces

';

$result_nodes_list{'U_no_braces'} = '';

$result_sections_list{'U_no_braces'} = '';

$result_sectioning_root{'U_no_braces'} = '';

$result_headings_list{'U_no_braces'} = '';


$result_converted{'plaintext'}->{'U_no_braces'} = '';


$result_converted{'html_text'}->{'U_no_braces'} = '';


$result_converted{'latex_text'}->{'U_no_braces'} = '';


$result_converted{'docbook'}->{'U_no_braces'} = '<para></para>';

1;
