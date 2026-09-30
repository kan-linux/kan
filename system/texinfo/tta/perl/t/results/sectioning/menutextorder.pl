use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menutextorder'} = '*document_root C15
 *before_node_section C2
  *@menu C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{foo}
    |normalized:{foo}
     {foo}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l3
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{bar}
    |normalized:{bar}
     {bar}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l4
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
 *@node C1 l6 {bar}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{bar}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {bar}
 *@chapter C4 l7 {bar}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {bar}
  {empty_line:\\n}
  *@menu C3 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{onesub2}
    |normalized:{onesub2}
     {onesub2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
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
 *@node C1 l13 {onesub1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{onesub1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {onesub1}
 *@section C2 l14 {One sub 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {One sub 1}
  {empty_line:\\n}
 *@node C1 l16 {onesub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{onesub2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {onesub2}
 *@section C3 l17 {One sub 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {One sub 2}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 l20 {foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{foo}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {foo}
 *@chapter C4 l21 {foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {foo}
  {empty_line:\\n}
  *@menu C5 l23
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{sub1}
    |normalized:{sub1}
     {sub1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{sub3}
    |normalized:{sub3}
     {sub3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{sub2}
    |normalized:{sub2}
     {sub2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l27
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
 *@node C1 l29 {sub1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{sub1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sub1}
 *@section C2 l30 {Sub1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sub1}
  {empty_line:\\n}
 *@node C1 l32 {sub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{sub2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sub2}
 *@section C2 l33 {Sub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.2}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sub2}
  {empty_line:\\n}
 *@node C1 l35 {sub3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{sub3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sub3}
 *@section C1 l36 {Sub3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.3}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sub3}
';


$result_texis{'menutextorder'} = '@menu
* foo::
* bar::
@end menu

@node bar
@chapter bar

@menu
* onesub2::
@end menu

@node onesub1
@section One sub 1

@node onesub2
@section One sub 2


@node foo
@chapter foo

@menu
* sub1::
* sub3::
* sub2::
@end menu

@node sub1
@section Sub1

@node sub2
@section Sub2

@node sub3
@section Sub3
';


$result_texts{'menutextorder'} = '* foo::
* bar::

1 bar
*****

* onesub2::

1.1 One sub 1
=============

1.2 One sub 2
=============


2 foo
*****

* sub1::
* sub3::
* sub2::

2.1 Sub1
========

2.2 Sub2
========

2.3 Sub3
========
';

$result_errors{'menutextorder'} = '* W l10|node `onesub2\' in menu where `onesub1\' expected
 warning: node `onesub2\' in menu where `onesub1\' expected

* W l25|node `sub3\' in menu where `sub2\' expected
 warning: node `sub3\' in menu where `sub2\' expected

* W l26|unexpected node `sub2\' in menu
 warning: unexpected node `sub2\' in menu

* W l6|node `bar\' lacks menu item for `onesub1\' but is above it in sectioning
 warning: node `bar\' lacks menu item for `onesub1\' but is above it in sectioning

';

$result_nodes_list{'menutextorder'} = '1|bar
 associated_section: 1 bar
 associated_title_command: 1 bar
 menus:
  onesub2
 node_directions:
  next->foo
2|onesub1
 associated_section: 1.1 One sub 1
 associated_title_command: 1.1 One sub 1
 node_directions:
  next->onesub2
  up->bar
3|onesub2
 associated_section: 1.2 One sub 2
 associated_title_command: 1.2 One sub 2
 node_directions:
  prev->onesub1
  up->bar
4|foo
 associated_section: 2 foo
 associated_title_command: 2 foo
 menus:
  sub1
  sub3
  sub2
 node_directions:
  prev->bar
5|sub1
 associated_section: 2.1 Sub1
 associated_title_command: 2.1 Sub1
 node_directions:
  next->sub2
  up->foo
6|sub2
 associated_section: 2.2 Sub2
 associated_title_command: 2.2 Sub2
 node_directions:
  next->sub3
  prev->sub1
  up->foo
7|sub3
 associated_section: 2.3 Sub3
 associated_title_command: 2.3 Sub3
 node_directions:
  next->sub2
  prev->sub2
  up->foo
';

$result_sections_list{'menutextorder'} = '1|bar
 associated_anchor_command: bar
 associated_node: bar
 section_directions:
  next->foo
 toplevel_directions:
  next->foo
 section_children:
  1|One sub 1
  2|One sub 2
2|One sub 1
 associated_anchor_command: onesub1
 associated_node: onesub1
 section_directions:
  next->One sub 2
  up->bar
3|One sub 2
 associated_anchor_command: onesub2
 associated_node: onesub2
 section_directions:
  prev->One sub 1
  up->bar
4|foo
 associated_anchor_command: foo
 associated_node: foo
 section_directions:
  prev->bar
 toplevel_directions:
  prev->bar
 section_children:
  1|Sub1
  2|Sub2
  3|Sub3
5|Sub1
 associated_anchor_command: sub1
 associated_node: sub1
 section_directions:
  next->Sub2
  up->foo
6|Sub2
 associated_anchor_command: sub2
 associated_node: sub2
 section_directions:
  next->Sub3
  prev->Sub1
  up->foo
7|Sub3
 associated_anchor_command: sub3
 associated_node: sub3
 section_directions:
  prev->Sub2
  up->foo
';

$result_sectioning_root{'menutextorder'} = 'level: 0
list:
 1|bar
 2|foo
';

$result_headings_list{'menutextorder'} = '';

1;
