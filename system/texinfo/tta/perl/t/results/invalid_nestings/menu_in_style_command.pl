use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_in_style_command'} = '*document_root C2
 *before_node_section
 *@node C4 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *paragraph C1
   *@code C1 l3
    *brace_container C1
     {\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{truc}
     {(}
     {truc}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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


$result_texis{'menu_in_style_command'} = '@node first

@code{
}@menu
* (truc)::
@end menu
';


$result_texts{'menu_in_style_command'} = '

* (truc)::
';

$result_errors{'menu_in_style_command'} = '* E l3|@code missing closing brace
 @code missing closing brace

* E l7|misplaced }
 misplaced }

';

$result_nodes_list{'menu_in_style_command'} = '1|first
 menus:
  (truc)
';

$result_sections_list{'menu_in_style_command'} = '';

$result_sectioning_root{'menu_in_style_command'} = '';

$result_headings_list{'menu_in_style_command'} = '';

1;
