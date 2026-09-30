use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unknown_node_in_menu_novalidate'} = '*document_root C2
 *before_node_section C2
  *@novalidate C1 l1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 l3 {first}
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
  *@menu C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{unknown}
    |normalized:{unknown}
     {unknown}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l7
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


$result_texis{'unknown_node_in_menu_novalidate'} = '@novalidate

@node first

@menu
* unknown::
@end menu
';


$result_texts{'unknown_node_in_menu_novalidate'} = '

* unknown::
';

$result_errors{'unknown_node_in_menu_novalidate'} = '';

$result_nodes_list{'unknown_node_in_menu_novalidate'} = '1|first
 menus:
  unknown
';

$result_sections_list{'unknown_node_in_menu_novalidate'} = '';

$result_sectioning_root{'unknown_node_in_menu_novalidate'} = '';

$result_headings_list{'unknown_node_in_menu_novalidate'} = '';

1;
