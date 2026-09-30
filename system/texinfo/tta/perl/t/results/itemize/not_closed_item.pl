use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'not_closed_item'} = '*document_root C1
 *before_node_section C1
  *@itemize C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {in item\\n}
';


$result_texis{'not_closed_item'} = '@itemize
@item in item
';


$result_texts{'not_closed_item'} = 'in item
';

$result_errors{'not_closed_item'} = '* E l1|no matching `@end itemize\'
 no matching `@end itemize\'

';

$result_nodes_list{'not_closed_item'} = '';

$result_sections_list{'not_closed_item'} = '';

$result_sectioning_root{'not_closed_item'} = '';

$result_headings_list{'not_closed_item'} = '';

1;
