use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'direntry_dircategory'} = '*document_root C6
 *before_node_section C2
  *preamble_before_setfilename C1
   *preamble_before_beginning C2
    {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
    {text_before_beginning:\\n}
  *preamble_before_content C9
   *@setfilename C1 direntry_dircategory.texi:l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{direntry_dircategory.info}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {direntry_dircategory.info}
   {empty_line:\\n}
   *@dircategory C1 direntry_dircategory.texi:l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {``category---}
     *@var C1 direntry_dircategory.texi:l5
      *brace_container C1
       {th  ere}
     {?\'\'}
   *@direntry C3 direntry_dircategory.texi:l6
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C6 direntry_dircategory.texi:l7
     {menu_entry_leading_text:* }
     *menu_entry_name C1
      {foo}
     {menu_entry_separator:: }
     *menu_entry_node C3
     |EXTRA
     |manual_content:{foo}
      {(}
      {foo}
      {)}
     {menu_entry_separator:.   }
     *menu_entry_description C1
      *preformatted C3
       {``hello---}
       *@var C1 direntry_dircategory.texi:l7
        *brace_container C1
         {there}
       {?\'\'\\n}
    *@end C1 direntry_dircategory.texi:l8
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{direntry}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {direntry}
   {empty_line:\\n}
   *@dircategory C1 direntry_dircategory.texi:l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cat2}
   *@direntry C4 direntry_dircategory.texi:l11
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 direntry_dircategory.texi:l12
     {menu_entry_leading_text:* }
     *menu_entry_node C2
     |EXTRA
     |node_content:{aaa }
     |normalized:{aaa}
      {aaa}
      {space_at_end_menu_node: }
     {menu_entry_separator:::               }
     *menu_entry_description C1
      *preformatted C2
       {aaaa\\n}
       {                   bbbbb\\n}
    *menu_comment C1
     *preformatted C2
      {after_menu_description_line:\\n}
      {menutitle\\n}
    *@end C1 direntry_dircategory.texi:l16
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{direntry}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {direntry}
   {empty_line:\\n}
   {empty_line:\\n}
 *@node C1 direntry_dircategory.texi:l19 {Top}
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
 *@top C8 direntry_dircategory.texi:l20 {Test dircategory and direntry}
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
    {Test dircategory and direntry}
  {empty_line:\\n}
  *paragraph C1
   {Text\\n}
  *@dircategory C1 direntry_dircategory.texi:l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {in text}
  *@direntry C3 direntry_dircategory.texi:l24
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C6 direntry_dircategory.texi:l25
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {in text}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{in_text}
     {(}
     {in_text}
     {)}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {in text\\n}
   *@end C1 direntry_dircategory.texi:l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{direntry}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {direntry}
  {empty_line:\\n}
  *@menu C3 direntry_dircategory.texi:l28
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 direntry_dircategory.texi:l29
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
   *@end C1 direntry_dircategory.texi:l30
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
 *@node C1 direntry_dircategory.texi:l32 {chapter}
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
 *@chapter C4 direntry_dircategory.texi:l33 {chapter}
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
    {chapter}
  {empty_line:\\n}
  *paragraph C1
   {In chapter\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'direntry_dircategory'} = '\\input texinfo @c -*-texinfo-*-

@setfilename direntry_dircategory.info

@dircategory ``category---@var{th  ere}?\'\'
@direntry
* foo: (foo).   ``hello---@var{there}?\'\'
@end direntry

@dircategory cat2
@direntry
* aaa ::               aaaa
                   bbbbb

menutitle
@end direntry


@node Top
@top Test dircategory and direntry

Text
@dircategory in text
@direntry
* in text: (in_text). in text
@end direntry

@menu
* chapter::
@end menu

@node chapter
@chapter chapter

In chapter

@bye
';


$result_texts{'direntry_dircategory'} = '
* foo: (foo).   "hello--there?"

* aaa::               aaaa
                   bbbbb

menutitle


Test dircategory and direntry
*****************************

Text
* in text: (in_text). in text

* chapter::

1 chapter
*********

In chapter

';

$result_errors{'direntry_dircategory'} = '* W direntry_dircategory.texi:l23|@dircategory after first node
 warning: @dircategory after first node

* W direntry_dircategory.texi:l24|@direntry after first node
 warning: @direntry after first node

';

$result_nodes_list{'direntry_dircategory'} = '1|Top
 associated_section: Test dircategory and direntry
 associated_title_command: Test dircategory and direntry
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'direntry_dircategory'} = '1|Test dircategory and direntry
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Test dircategory and direntry
 toplevel_directions:
  prev->Test dircategory and direntry
  up->Test dircategory and direntry
';

$result_sectioning_root{'direntry_dircategory'} = 'level: -1
list:
 1|Test dircategory and direntry
';

$result_headings_list{'direntry_dircategory'} = '';

1;
