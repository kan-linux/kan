use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'colons_in_index_entries_and_node'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
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
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{One@asis{::}node@comma{} with entries.}
    |normalized:{One_003a_003anode_002c-with-entries_002e}
     {One}
     *@asis C1 l4
      *brace_container C1
       {::}
     {node}
     *@comma C1 l4
      *brace_container
     { with entries.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Concept Index}
    |normalized:{Concept-Index}
     {Concept Index}
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
  {empty_line:\\n}
 *@node C14 l8 {One@asis{::}node@comma{} with entries.}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{One_003a_003anode_002c-with-entries_002e}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {One}
    *@asis C1 l8
     *brace_container C1
      {::}
    {node}
    *@comma C1 l8
     *brace_container
    { with entries.}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {:}
  *index_entry_command@cindex C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {:a}
  *index_entry_command@cindex C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {b:c}
  {empty_line:\\n}
  *@example C3 l14
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {some example just to have text\\n}
   *@end C1 l16
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
  {empty_line:\\n}
  *index_entry_command@cindex C1 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {d::e}
  *index_entry_command@cindex C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {f :d}
  *index_entry_command@cindex C1 l20
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,6}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {g: h}
  {empty_line:\\n}
  *paragraph C1
   {node one\\n}
  {empty_line:\\n}
 *@node C4 l24 {Concept Index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{Concept-Index}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Concept Index}
  {empty_line:\\n}
  *@printindex C1 l26
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
';


$result_texis{'colons_in_index_entries_and_node'} = '@node Top

@menu
* One@asis{::}node@comma{} with entries.::
* Concept Index::
@end menu

@node One@asis{::}node@comma{} with entries.

@cindex :
@cindex :a
@cindex b:c

@example
some example just to have text
@end example

@cindex d::e
@cindex f :d
@cindex g: h

node one

@node Concept Index

@printindex cp

';


$result_texts{'colons_in_index_entries_and_node'} = '
* One::node, with entries.::
* Concept Index::



some example just to have text


node one



';

$result_errors{'colons_in_index_entries_and_node'} = '';

$result_nodes_list{'colons_in_index_entries_and_node'} = '1|Top
 menus:
  One@asis{::}node@comma{} with entries.
  Concept Index
 node_directions:
  next->One@asis{::}node@comma{} with entries.
2|One@asis{::}node@comma{} with entries.
 node_directions:
  next->Concept Index
  prev->Top
  up->Top
3|Concept Index
 node_directions:
  prev->One@asis{::}node@comma{} with entries.
  up->Top
';

$result_sections_list{'colons_in_index_entries_and_node'} = '';

$result_sectioning_root{'colons_in_index_entries_and_node'} = '';

$result_headings_list{'colons_in_index_entries_and_node'} = '';

$result_indices_sort_strings{'colons_in_index_entries_and_node'} = 'cp:
 :
 :a
 b:c
 d::e
 f :d
 g: h
';

1;
