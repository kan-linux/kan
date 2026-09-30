use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'group_not_closed'} = '*document_root C1
 *before_node_section C1
  *@group C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {text in group\\n}
';


$result_texis{'group_not_closed'} = '@group

text in group
';


$result_texts{'group_not_closed'} = '
text in group
';

$result_errors{'group_not_closed'} = '* E l1|no matching `@end group\'
 no matching `@end group\'

';

$result_nodes_list{'group_not_closed'} = '';

$result_sections_list{'group_not_closed'} = '';

$result_sectioning_root{'group_not_closed'} = '';

$result_headings_list{'group_not_closed'} = '';

1;
