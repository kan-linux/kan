use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'character_and_spaces_in_refs_out'} = 'U0 unit{N:Top}{s:Test refs}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 character_and_spaces_in_refs_text.texi:l1 {Top}
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
 *@top C4 character_and_spaces_in_refs_text.texi:l2 {Test refs}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Test refs}
  {empty_line:\\n}
  *@menu C4 character_and_spaces_in_refs_text.texi:l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node to avoid DocBook or LaTeX ignored}
    |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
     {node to avoid DocBook or LaTeX ignored}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{other nodes}
    |normalized:{other-nodes}
     {other nodes}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l7
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
U1 unit{N:node to avoid DocBook or LaTeX ignored}{s:1 first chapter}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 character_and_spaces_in_refs_text.texi:l9 {node to avoid DocBook or LaTeX ignored}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node to avoid DocBook or LaTeX ignored}
 *@chapter C10 character_and_spaces_in_refs_text.texi:l10 {first chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first chapter}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Testing distant nodes}
  {empty_line:\\n}
  *paragraph C10
   *@ref C4 character_and_spaces_in_refs_text.texi:l14
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |node_content:{a  node}
     {a  node}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l15
    *brace_arg C1
    |EXTRA
    |node_content:{:}
     {:}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l16
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |node_content:{top}
     {top}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l17
    *brace_arg C4
    |EXTRA
    |manual_content:{texinfo}
    |node_content:{Cross References}
     {(}
     {texinfo}
     {)}
     {Cross References}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l18
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {../manual/doc}
   {\\n}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l20
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Testing local nodes}
  {empty_line:\\n}
  *paragraph C8
   *@ref C1 character_and_spaces_in_refs_text.texi:l22
    *brace_arg C1
    |EXTRA
    |node_content:{!_"#$%&\'()*+-.}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {!_"#$%&\'()*+-.}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l23
    *brace_arg C1
    |EXTRA
    |node_content:{/;<=>?[\\]^_`|~}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {/;<=>?[\\]^_`|~}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l24
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l25
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument:  }
    |EXTRA
    |node_content:{local   node}
    |normalized:{local-node}
     {local   node}
   {\\n}
  {empty_line:\\n}
U2 unit{N:other nodes}{s:2 Chapter with nodes}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodeNext: [U3]
NodePrev: [U1]
NodeUp: [U0]
NodeForward: [U3]
NodeBack: [U1]
 *@node C1 character_and_spaces_in_refs_text.texi:l27 {other nodes}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{other-nodes}
  *arguments_line C4
   *line_arg C1
    {other nodes}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{!_"#$%&\'()*+-.}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {!_"#$%&\'()*+-.}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{node to avoid DocBook or LaTeX ignored}
   |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
    {node to avoid DocBook or LaTeX ignored}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
 *@chapter C4 character_and_spaces_in_refs_text.texi:l28 {Chapter with nodes}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter with nodes}
  {empty_line:\\n}
  *@menu C5 character_and_spaces_in_refs_text.texi:l30
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l31
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{!_"#$%&\'()*+-.}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {!_"#$%&\'()*+-.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l32
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{/;<=>?[\\]^_`|~}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {/;<=>?[\\]^_`|~}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{local node}
    |normalized:{local-node}
     {local node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l34
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
U3 unit{N:!_"#$%&\'()*+-.}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastBack: [U2]
NodeNext: [U4]
NodePrev: [U2]
NodeUp: [U2]
NodeForward: [U4]
NodeBack: [U2]
 *@node C2 character_and_spaces_in_refs_text.texi:l36 {!_"#$%&\'()*+-.}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
  *arguments_line C4
   *line_arg C1
    {!_"#$%&\'()*+-.}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{/;<=>?[\\]^_`|~}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {/;<=>?[\\]^_`|~}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{other nodes}
   |normalized:{other-nodes}
    {other nodes}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{other nodes}
   |normalized:{other-nodes}
    {other nodes}
  {empty_line:\\n}
U4 unit{N:/;<=>?[\\]^_`|~}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastBack: [U2]
NodeNext: [U5]
NodePrev: [U3]
NodeUp: [U2]
NodeForward: [U5]
NodeBack: [U3]
 *@node C2 character_and_spaces_in_refs_text.texi:l38 {/;<=>?[\\]^_`|~}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
  *arguments_line C4
   *line_arg C1
    {/;<=>?[\\]^_`|~}
   *line_arg C1
   |EXTRA
   |node_content:{local   node}
   |normalized:{local-node}
    {local   node}
   *line_arg C1
   |EXTRA
   |node_content:{!_"#$%&\'()*+-.}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {!_"#$%&\'()*+-.}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{other nodes}
   |normalized:{other-nodes}
    {other nodes}
  {empty_line:\\n}
U5 unit{N:local   node}
unit_directions:D[prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Back: [U4]
FastBack: [U2]
NodePrev: [U4]
NodeUp: [U2]
NodeForward: [U3]
NodeBack: [U4]
 *@node C2 character_and_spaces_in_refs_text.texi:l40 {local   node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument:  }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{local-node}
  *arguments_line C4
   *line_arg C1
    {local   node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{/;<=>?[\\]^_`|~}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {/;<=>?[\\]^_`|~}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{other nodes}
   |normalized:{other-nodes}
    {other nodes}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'character_and_spaces_in_refs_out'} = '@node Top
@top Test refs

@menu
* node to avoid DocBook or LaTeX ignored::
* other nodes::
@end menu

@node node to avoid DocBook or LaTeX ignored
@chapter first chapter

@subheading Testing distant nodes

@ref{ a  node ,,, manual}
@ref{:,,,manual}
@ref{ top ,,, manual}
@ref{(texinfo)Cross References}
@ref{node,,, ../manual/doc}

@subheading Testing local nodes

@ref{!_"#$%&\'()*+-.}
@ref{/;<=>?[\\]^_`|~}
@ref{ Top}
@ref{  local   node}

@node other nodes, !_"#$%&\'()*+-., node to avoid DocBook or LaTeX ignored, Top
@chapter Chapter with nodes

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes

@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes

@node  local   node,,/;<=>?[\\]^_`|~,other nodes

@bye
';


$result_texts{'character_and_spaces_in_refs_out'} = 'Test refs
*********

* node to avoid DocBook or LaTeX ignored::
* other nodes::

1 first chapter
***************

Testing distant nodes
---------------------

a  node
:
top
(texinfo)Cross References
node

Testing local nodes
-------------------

!_"#$%&\'()*+-.
/;<=>?[\\]^_`|~
Top
local   node

2 Chapter with nodes
********************

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::




';

$result_errors{'character_and_spaces_in_refs_out'} = '';

$result_nodes_list{'character_and_spaces_in_refs_out'} = '1|Top
 associated_section: Test refs
 associated_title_command: Test refs
 menus:
  node to avoid DocBook or LaTeX ignored
  other nodes
 node_directions:
  next->node to avoid DocBook or LaTeX ignored
2|node to avoid DocBook or LaTeX ignored
 associated_section: 1 first chapter
 associated_title_command: 1 first chapter
 node_directions:
  next->other nodes
  prev->Top
  up->Top
3|other nodes
 associated_section: 2 Chapter with nodes
 associated_title_command: 2 Chapter with nodes
 menus:
  !_"#$%&\'()*+-.
  /;<=>?[\\]^_`|~
  local node
 node_directions:
  next->!_"#$%&\'()*+-.
  prev->node to avoid DocBook or LaTeX ignored
  up->Top
4|!_"#$%&\'()*+-.
 node_directions:
  next->/;<=>?[\\]^_`|~
  prev->other nodes
  up->other nodes
5|/;<=>?[\\]^_`|~
 node_directions:
  next->local   node
  prev->!_"#$%&\'()*+-.
  up->other nodes
6|local   node
 node_directions:
  prev->/;<=>?[\\]^_`|~
  up->other nodes
';

$result_sections_list{'character_and_spaces_in_refs_out'} = '1|Test refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first chapter
 section_children:
  1|first chapter
  2|Chapter with nodes
2|first chapter
 associated_anchor_command: node to avoid DocBook or LaTeX ignored
 associated_node: node to avoid DocBook or LaTeX ignored
 section_directions:
  next->Chapter with nodes
  up->Test refs
 toplevel_directions:
  next->Chapter with nodes
  prev->Test refs
  up->Test refs
3|Chapter with nodes
 associated_anchor_command: other nodes
 associated_node: other nodes
 section_directions:
  prev->first chapter
  up->Test refs
 toplevel_directions:
  prev->first chapter
  up->Test refs
';

$result_sectioning_root{'character_and_spaces_in_refs_out'} = 'level: -1
list:
 1|Test refs
';

$result_headings_list{'character_and_spaces_in_refs_out'} = '1|Testing distant nodes
2|Testing local nodes
';

1;
