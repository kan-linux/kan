use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'more_sections_than_nodes_texi2html'} = '*document_root C19
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
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
 *@top C4 l2 {top}
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
    {top}
  {empty_line:\\n}
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{n c2}
    |normalized:{n-c2}
     {n c2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{n c3}
    |normalized:{n-c3}
     {n c3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{n c3 s1 s2}
    |normalized:{n-c3-s1-s2}
     {n c3 s1 s2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
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
 *@chapter C2 l10 {c1}
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
    {c1}
  {empty_line:\\n}
 *@node C1 l12 {n c2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{n-c2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {n c2}
 *@chapter C2 l13 {c2}
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
    {c2}
  {empty_line:\\n}
 *@section C2 l15 {s1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {s1}
  {empty_line:\\n}
 *@node C1 l17 {n c3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{n-c3}
  *arguments_line C4
   *line_arg C1
    {n c3}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{n c3 s1 s2}
   |normalized:{n-c3-s1-s2}
    {n c3 s1 s2}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{n c2}
   |normalized:{n-c2}
    {n c2}
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
 *@chapter C4 l18 {c3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3}
  {empty_line:\\n}
  *@menu C3 l20
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{n c3 s 2}
    |normalized:{n-c3-s-2}
     {n c3 s 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l22
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
 *@section C2 l24 {C3 s1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {C3 s1}
  {empty_line:\\n}
 *@node C1 l26 {n c3 s 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{n-c3-s-2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {n c3 s 2}
 *@section C2 l27 {c3 s2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3.2}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3 s2}
  {empty_line:\\n}
 *@section C2 l29 {c3 s3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3.3}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3 s3}
  {empty_line:\\n}
 *@chapter C2 l31 {c4}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c4}
  {empty_line:\\n}
 *@section C2 l33 {c3 s1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3 s1}
  {empty_line:\\n}
 *@subsection C2 l35 {c3 s1 s1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1.1}
 |section_level:{3}
 |section_number:{11}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3 s1 s1}
  {empty_line:\\n}
 *@node C1 l37 {n c3 s1 s2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{n-c3-s1-s2}
  *arguments_line C4
   *line_arg C1
    {n c3 s1 s2}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{n c3}
   |normalized:{n-c3}
    {n c3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
 *@subsection C2 l38 {c3 s1 s2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1.2}
 |section_level:{3}
 |section_number:{12}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c3 s1 s2}
  {empty_line:\\n}
 *@appendix C1 l40 {appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendix}
';


$result_texis{'more_sections_than_nodes_texi2html'} = '@node Top
@top top

@menu
* n c2::
* n c3::
* n c3 s1 s2::
@end menu

@chapter c1

@node n c2
@chapter c2

@section s1

@node n c3, n c3 s1 s2, n c2, Top
@chapter c3

@menu 
* n c3 s 2::
@end menu

@section C3 s1

@node n c3 s 2
@section c3 s2

@section c3 s3

@chapter c4

@section c3 s1

@subsection c3 s1 s1

@node n c3 s1 s2,,n c3,Top
@subsection c3 s1 s2

@appendix appendix
';


$result_texts{'more_sections_than_nodes_texi2html'} = 'top
***

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****

2 c2
****

2.1 s1
======

3 c3
****

* n c3 s 2::

3.1 C3 s1
=========

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************
';

$result_errors{'more_sections_than_nodes_texi2html'} = '';

$result_nodes_list{'more_sections_than_nodes_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  n c2
  n c3
  n c3 s1 s2
 node_directions:
  next->n c2
2|n c2
 associated_section: 2 c2
 associated_title_command: 2 c2
 node_directions:
  next->n c3
  prev->Top
  up->Top
3|n c3
 associated_section: 3 c3
 associated_title_command: 3 c3
 menus:
  n c3 s 2
 node_directions:
  next->n c3 s1 s2
  prev->n c2
  up->Top
4|n c3 s 2
 associated_section: 3.2 c3 s2
 associated_title_command: 3.2 c3 s2
 node_directions:
  up->n c3
5|n c3 s1 s2
 associated_section: 4.1.2 c3 s1 s2
 associated_title_command: 4.1.2 c3 s1 s2
 node_directions:
  prev->n c3
  up->Top
';

$result_sections_list{'more_sections_than_nodes_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->c1
 section_children:
  1|c1
  2|c2
  3|c3
  4|c4
  5|appendix
2|c1
 section_directions:
  next->c2
  up->top
 toplevel_directions:
  next->c2
  prev->top
  up->top
3|c2
 associated_anchor_command: n c2
 associated_node: n c2
 section_directions:
  next->c3
  prev->c1
  up->top
 toplevel_directions:
  next->c3
  prev->c1
  up->top
 section_children:
  1|s1
4|s1
 section_directions:
  up->c2
5|c3
 associated_anchor_command: n c3
 associated_node: n c3
 section_directions:
  next->c4
  prev->c2
  up->top
 toplevel_directions:
  next->c4
  prev->c2
  up->top
 section_children:
  1|C3 s1
  2|c3 s2
  3|c3 s3
6|C3 s1
 section_directions:
  next->c3 s2
  up->c3
7|c3 s2
 associated_anchor_command: n c3 s 2
 associated_node: n c3 s 2
 section_directions:
  next->c3 s3
  prev->C3 s1
  up->c3
8|c3 s3
 section_directions:
  prev->c3 s2
  up->c3
9|c4
 section_directions:
  next->appendix
  prev->c3
  up->top
 toplevel_directions:
  next->appendix
  prev->c3
  up->top
 section_children:
  1|c3 s1
10|c3 s1
 section_directions:
  up->c4
 section_children:
  1|c3 s1 s1
  2|c3 s1 s2
11|c3 s1 s1
 section_directions:
  next->c3 s1 s2
  up->c3 s1
12|c3 s1 s2
 associated_anchor_command: n c3 s1 s2
 associated_node: n c3 s1 s2
 section_directions:
  prev->c3 s1 s1
  up->c3 s1
13|appendix
 section_directions:
  prev->c4
  up->top
 toplevel_directions:
  prev->c4
  up->top
';

$result_sectioning_root{'more_sections_than_nodes_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'more_sections_than_nodes_texi2html'} = '';

1;
