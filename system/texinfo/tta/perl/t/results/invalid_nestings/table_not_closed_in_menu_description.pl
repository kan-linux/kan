use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_not_closed_in_menu_description'} = '*document_root C1
 *before_node_section C1
  *@menu C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{gcc}
     {(}
     {gcc}
     {)}
    {menu_entry_separator::: }
    *menu_entry_description C2
     *preformatted C1
      {text }
     *@table C2 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *arguments_line C1
       *block_line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        *@asis l2
      *table_entry C2
       *table_term C1
        *@item C1 l3
        |INFO
        |spaces_before_argument:
         |{spaces_before_argument: }
         *line_arg C1
         |INFO
         |spaces_after_argument:
          |{spaces_after_argument:\\n}
          {item}
       *table_definition C1
        *preformatted C1
         {table line\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
';


$result_texis{'table_not_closed_in_menu_description'} = '@menu
* (gcc):: text @table @asis
@item item
table line
@end menu
';


$result_texts{'table_not_closed_in_menu_description'} = '* (gcc):: text item
table line
';

$result_errors{'table_not_closed_in_menu_description'} = '* W l2|@table should only appear at the beginning of a line
 warning: @table should only appear at the beginning of a line

* E l5|`@end\' expected `table\', but saw `menu\'
 `@end\' expected `table\', but saw `menu\'

';

$result_nodes_list{'table_not_closed_in_menu_description'} = '';

$result_sections_list{'table_not_closed_in_menu_description'} = '';

$result_sectioning_root{'table_not_closed_in_menu_description'} = '';

$result_headings_list{'table_not_closed_in_menu_description'} = '';

1;
