use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'headitem_in_table'} = '*document_root C1
 *before_node_section C1
  *@table C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@strong l1
   *before_item C5
    {ignorable_spaces_after_command: }
    *paragraph C1
     {headitem in table\\n}
    {empty_line:\\n}
    *paragraph C1
     {headitem In table text.\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l6
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
';


$result_texis{'headitem_in_table'} = '@table @strong
 headitem in table

headitem In table text.

@item item
@end table
';


$result_texts{'headitem_in_table'} = 'headitem in table

headitem In table text.

item
';

$result_errors{'headitem_in_table'} = '* E l2|@headitem not meaningful inside `@table\' block
 @headitem not meaningful inside `@table\' block

';

$result_nodes_list{'headitem_in_table'} = '';

$result_sections_list{'headitem_in_table'} = '';

$result_sectioning_root{'headitem_in_table'} = '';

$result_headings_list{'headitem_in_table'} = '';

1;
