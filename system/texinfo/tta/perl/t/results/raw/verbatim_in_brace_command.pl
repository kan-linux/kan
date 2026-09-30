use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verbatim_in_brace_command'} = '*document_root C1
 *before_node_section C3
  *paragraph C1
   *@samp C1 l1
    *brace_container C1
     {\\n}
  *@verbatim C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:in verbatim\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {verbatim}
  {empty_line:\\n}
';


$result_texis{'verbatim_in_brace_command'} = '@samp{
}@verbatim
in verbatim
@end verbatim

';


$result_texts{'verbatim_in_brace_command'} = '
in verbatim

';

$result_errors{'verbatim_in_brace_command'} = '* E l1|@samp missing closing brace
 @samp missing closing brace

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'verbatim_in_brace_command'} = '';

$result_sections_list{'verbatim_in_brace_command'} = '';

$result_sectioning_root{'verbatim_in_brace_command'} = '';

$result_headings_list{'verbatim_in_brace_command'} = '';


$result_converted{'plaintext'}->{'verbatim_in_brace_command'} = '‘ ’
in verbatim

';


$result_converted{'xml'}->{'verbatim_in_brace_command'} = '<para><samp>
</samp></para><verbatim xml:space="preserve" endspaces=" ">
in verbatim
</verbatim>

';

1;
