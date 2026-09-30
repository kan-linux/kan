use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'tab_item_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {ignorable_spaces_after_command: }
    {in tab\\n}
   *preformatted C2
    {ignorable_spaces_after_command: }
    {in item\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'tab_item_in_example'} = '@example
 in tab
 in item
@end example
';


$result_texts{'tab_item_in_example'} = 'in tab
in item
';

$result_errors{'tab_item_in_example'} = '* E l2|ignoring @tab outside of multitable
 ignoring @tab outside of multitable

* E l3|@item outside of table or list
 @item outside of table or list

';

$result_nodes_list{'tab_item_in_example'} = '';

$result_sections_list{'tab_item_in_example'} = '';

$result_sectioning_root{'tab_item_in_example'} = '';

$result_headings_list{'tab_item_in_example'} = '';


$result_converted{'plaintext'}->{'tab_item_in_example'} = '     in tab
     in item
';

1;
