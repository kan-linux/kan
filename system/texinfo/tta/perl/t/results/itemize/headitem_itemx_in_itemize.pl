use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'headitem_itemx_in_itemize'} = '*document_root C1
 *before_node_section C1
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@item C5 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item\\n}
    *@itemx C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {itemx}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {headitem\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
';


$result_texis{'headitem_itemx_in_itemize'} = '@itemize
@item item
@itemx itemx
 headitem
@end itemize
';


$result_texts{'headitem_itemx_in_itemize'} = 'item
itemx
headitem
';

$result_errors{'headitem_itemx_in_itemize'} = '* E l3|@itemx outside of table or list
 @itemx outside of table or list

* E l4|@headitem not meaningful inside `@itemize\' block
 @headitem not meaningful inside `@itemize\' block

';

$result_nodes_list{'headitem_itemx_in_itemize'} = '';

$result_sections_list{'headitem_itemx_in_itemize'} = '';

$result_sectioning_root{'headitem_itemx_in_itemize'} = '';

$result_headings_list{'headitem_itemx_in_itemize'} = '';

1;
