use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_referenced_in_ref'} = '*document_root C4
 *before_node_section
 *@node C6 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap first level node}
    |normalized:{chap-first-level-node}
     {chap first level node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
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
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l7
    *brace_arg C1
    |EXTRA
    |node_content:{second level node}
    |normalized:{second-level-node}
     {second level node}
   {.\\n}
  {empty_line:\\n}
 *@node C2 l9 {chap first level node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-first-level-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap first level node}
  {empty_line:\\n}
 *@node C1 l11 {second level node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{second-level-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {second level node}
';


$result_texis{'node_referenced_in_ref'} = '@node Top

@menu
* chap first level node::
@end menu

@ref{second level node}.

@node chap first level node

@node second level node
';


$result_texts{'node_referenced_in_ref'} = '
* chap first level node::

second level node.


';

$result_errors{'node_referenced_in_ref'} = '* W l11|node `second level node\' not in menu
 warning: node `second level node\' not in menu

';

$result_nodes_list{'node_referenced_in_ref'} = '1|Top
 menus:
  chap first level node
 node_directions:
  next->chap first level node
2|chap first level node
 node_directions:
  prev->Top
  up->Top
3|second level node
';

$result_sections_list{'node_referenced_in_ref'} = '';

$result_sectioning_root{'node_referenced_in_ref'} = '';

$result_headings_list{'node_referenced_in_ref'} = '';

1;
