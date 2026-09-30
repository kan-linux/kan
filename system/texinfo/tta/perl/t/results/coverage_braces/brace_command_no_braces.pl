use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'brace_command_no_braces'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@xref l1
';


$result_texis{'brace_command_no_braces'} = '@xref';


$result_texts{'brace_command_no_braces'} = '';

$result_errors{'brace_command_no_braces'} = '* E l1|@xref expected braces
 @xref expected braces

';

$result_nodes_list{'brace_command_no_braces'} = '';

$result_sections_list{'brace_command_no_braces'} = '';

$result_sectioning_root{'brace_command_no_braces'} = '';

$result_headings_list{'brace_command_no_braces'} = '';


$result_converted{'plaintext'}->{'brace_command_no_braces'} = '';


$result_converted{'html_text'}->{'brace_command_no_braces'} = '';


$result_converted{'latex_text'}->{'brace_command_no_braces'} = '';


$result_converted{'docbook'}->{'brace_command_no_braces'} = '<para></para>';

1;
