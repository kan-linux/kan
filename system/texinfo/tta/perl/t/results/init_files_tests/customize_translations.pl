use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'customize_translations'} = '*document_root C13
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@contents C1 l2
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l4 {Top}
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
 *@top C2 l5 {top}
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
 *@node C1 l7 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
 *@chapter C5 l8 {chap}
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
    {chap}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l10
    *brace_container
   {.\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fr}
 *@node C1 l13 {Chapter fr}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Chapter-fr}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter fr}
 *@chapter C4 l14 {chap fr}
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
    {chap fr}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l16
    *brace_container
   {.\\n}
  {empty_line:\\n}
 *@node C1 l18 {section fr}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{section-fr}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section fr}
 *@section C3 l19 {sec fr}
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
    {sec fr}
  {empty_line:\\n}
  *@documentlanguage C1 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |text_arg:{de}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {de}
 *@node C1 l22 {Chapter de}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{Chapter-de}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter de}
 *@chapter C4 l23 {chap de}
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
    {chap de}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l25
    *brace_container
   {.\\n}
  {empty_line:\\n}
 *@node C1 l27 {Last chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{Last-chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Last chapter}
 *@chapter C2 l28 {Last Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Last Chapter}
  {empty_line:\\n}
';


$result_texis{'customize_translations'} = '
@contents

@node Top
@top top

@node Chapter
@chapter chap

@error{}.

@documentlanguage fr
@node Chapter fr
@chapter chap fr

@error{}.

@node section fr
@section sec fr

@documentlanguage de
@node Chapter de
@chapter chap de

@error{}.

@node Last chapter
@chapter Last Chapter

';


$result_texts{'customize_translations'} = '
top
***

1 chap
******

error->.

2 chap fr
*********

error->.

2.1 sec fr
==========

3 chap de
*********

error->.

4 Last Chapter
**************

';

$result_errors{'customize_translations'} = '';

$result_nodes_list{'customize_translations'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->Chapter fr
  prev->Top
  up->Top
3|Chapter fr
 associated_section: 2 chap fr
 associated_title_command: 2 chap fr
 node_directions:
  next->Chapter de
  prev->Chapter
  up->Top
4|section fr
 associated_section: 2.1 sec fr
 associated_title_command: 2.1 sec fr
 node_directions:
  up->Chapter fr
5|Chapter de
 associated_section: 3 chap de
 associated_title_command: 3 chap de
 node_directions:
  next->Last chapter
  prev->Chapter fr
  up->Top
6|Last chapter
 associated_section: 4 Last Chapter
 associated_title_command: 4 Last Chapter
 node_directions:
  prev->Chapter de
  up->Top
';

$result_sections_list{'customize_translations'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|chap fr
  3|chap de
  4|Last Chapter
2|chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  next->chap fr
  up->top
 toplevel_directions:
  next->chap fr
  prev->top
  up->top
3|chap fr
 associated_anchor_command: Chapter fr
 associated_node: Chapter fr
 section_directions:
  next->chap de
  prev->chap
  up->top
 toplevel_directions:
  next->chap de
  prev->chap
  up->top
 section_children:
  1|sec fr
4|sec fr
 associated_anchor_command: section fr
 associated_node: section fr
 section_directions:
  up->chap fr
5|chap de
 associated_anchor_command: Chapter de
 associated_node: Chapter de
 section_directions:
  next->Last Chapter
  prev->chap fr
  up->top
 toplevel_directions:
  next->Last Chapter
  prev->chap fr
  up->top
6|Last Chapter
 associated_anchor_command: Last chapter
 associated_node: Last chapter
 section_directions:
  prev->chap de
  up->top
 toplevel_directions:
  prev->chap de
  up->top
';

$result_sectioning_root{'customize_translations'} = 'level: -1
list:
 1|top
';

$result_headings_list{'customize_translations'} = '';

1;
