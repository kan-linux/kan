use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'navigation_vertical'} = '*document_root C10
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 navigation.texi:l3 {Top}
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
 *@top C4 navigation.texi:l4 {File used for navigation testing}
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
    {File used for navigation testing}
  {empty_line:\\n}
  *@menu C3 navigation.texi:l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 navigation.texi:l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 navigation.texi:l8
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
 *@node C1 navigation.texi:l10 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C4 navigation.texi:l11 {First chapter}
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
    {First chapter}
  {empty_line:\\n}
  *@menu C3 navigation.texi:l13
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 navigation.texi:l14
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section}
    |normalized:{section}
     {section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 navigation.texi:l15
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
 *@node C1 navigation.texi:l17 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
 *@section C30 navigation.texi:l18 {Section in chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section in chapter}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C1
   {AAAA\\n}
  {empty_line:\\n}
  *paragraph C2
   {b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b \\n}
   {b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.\\n}
  {empty_line:\\n}
  *@menu C3 navigation.texi:l47
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 navigation.texi:l48
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{subsection}
    |normalized:{subsection}
     {subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 navigation.texi:l49
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
 *@node C1 navigation.texi:l51 {subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{subsection}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsection}
 *@subsection C4 navigation.texi:l52 {Sub section in section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sub section in section}
  {empty_line:\\n}
  *@contents C1 navigation.texi:l54
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'navigation_vertical'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top File used for navigation testing

@menu
* chapter::
@end menu

@node chapter
@chapter First chapter

@menu
* section::
@end menu

@node section
@section Section in chapter

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b 
b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.

@menu
* subsection::
@end menu

@node subsection
@subsection Sub section in section

@contents

@bye
';


$result_texts{'navigation_vertical'} = 'File used for navigation testing
********************************

* chapter::

1 First chapter
***************

* section::

1.1 Section in chapter
======================

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b 
b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.

* subsection::

1.1.1 Sub section in section
----------------------------


';

$result_errors{'navigation_vertical'} = '';

$result_nodes_list{'navigation_vertical'} = '1|Top
 associated_section: File used for navigation testing
 associated_title_command: File used for navigation testing
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 First chapter
 associated_title_command: 1 First chapter
 menus:
  section
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 Section in chapter
 associated_title_command: 1.1 Section in chapter
 menus:
  subsection
 node_directions:
  up->chapter
4|subsection
 associated_section: 1.1.1 Sub section in section
 associated_title_command: 1.1.1 Sub section in section
 node_directions:
  up->section
';

$result_sections_list{'navigation_vertical'} = '1|File used for navigation testing
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->First chapter
 section_children:
  1|First chapter
2|First chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->File used for navigation testing
 toplevel_directions:
  prev->File used for navigation testing
  up->File used for navigation testing
 section_children:
  1|Section in chapter
3|Section in chapter
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->First chapter
 section_children:
  1|Sub section in section
4|Sub section in section
 associated_anchor_command: subsection
 associated_node: subsection
 section_directions:
  up->Section in chapter
';

$result_sectioning_root{'navigation_vertical'} = 'level: -1
list:
 1|File used for navigation testing
';

$result_headings_list{'navigation_vertical'} = '';

1;
