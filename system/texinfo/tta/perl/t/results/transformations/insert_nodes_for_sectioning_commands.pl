use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'insert_nodes_for_sectioning_commands'} = '*document_root C22
 *before_node_section
 *@node C1 {Top}
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
 *@top C2 l1 {top section}
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
    {top section}
  {empty_line:\\n}
 *@part C2 l3 {part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part}
  {empty_line:\\n}
 *@node C1 {chap@comma{} @code{a chap}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap_002c-a-chap}
  *arguments_line C1
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
    *@comma C1
     *brace_container
    { }
    *@code C1
     *brace_container C1
      {a chap}
 *@chapter C2 l5 {chap, @code{a chap}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap, }
    *@code C1 l5
     *brace_container C1
      {a chap}
  {empty_line:\\n}
 *@node C1 l7 {a node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{a-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a node}
 *@section C2 l8 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
  {empty_line:\\n}
 *@node C1 {truc}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{truc}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc}
 *@section C1 l10 {truc}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc}
 *@node C1 {sub1}
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
 *@subsection C4 l11 {sub1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2.1}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sub1}
  {empty_line:\\n}
  *paragraph C1
   {Text.\\n}
  {empty_line:\\n}
 *@node C1 {sub2}
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
 *@subsection C2 l15 {sub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2.2}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:comment}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {sub2}
  {empty_line:\\n}
 *@node C1 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
 *@section C2 l17 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
  {empty_line:\\n}
 *@node C1 {section 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{section-1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
    { 1}
 *@section C2 l19 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.4}
 |section_level:{2}
 |section_number:{9}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
  {empty_line:\\n}
 *@node C1 { 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{-1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {}
    { 1}
 *@unnumbered C2 l21
 |EXTRA
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 {@asis{} 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{10}
 |normalized:{-2}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1
     *brace_container
    { 2}
 *@section C2 l23 {@asis{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{2}
 |section_number:{11}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 l23
     *brace_container
  {empty_line:\\n}
';


$result_texis{'insert_nodes_for_sectioning_commands'} = '@node Top
@top top section

@part part

@node chap@comma{} @code{a chap}
@chapter chap, @code{a chap}

@node a node
@section section

@node truc
@section truc
@node sub1
@subsection sub1

Text.

@node sub2
@subsection sub2 @c comment

@node section
@section section

@node section 1
@section section

@node  1
@unnumbered

@node @asis{} 2
@section @asis{}

';


$result_texts{'insert_nodes_for_sectioning_commands'} = 'top section
***********

part
****

1 chap, a chap
**************

1.1 section
===========

1.2 truc
========
1.2.1 sub1
----------

Text.

1.2.2 sub2
----------

1.3 section
===========

1.4 section
===========



';

$result_errors{'insert_nodes_for_sectioning_commands'} = '* W l21|@unnumbered missing argument
 warning: @unnumbered missing argument

';

$result_nodes_list{'insert_nodes_for_sectioning_commands'} = '1|Top
 associated_section: top section
 node_directions:
  next->chap@comma{} @code{a chap}
2|chap@comma{} @code{a chap}
 associated_section: 1 chap, @code{a chap}
 node_directions:
  next-> 1
  prev->Top
  up->Top
3|a node
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  next->truc
  up->chap@comma{} @code{a chap}
4|truc
 associated_section: 1.2 truc
 node_directions:
  next->section
  prev->a node
  up->chap@comma{} @code{a chap}
5|sub1
 associated_section: 1.2.1 sub1
 node_directions:
  next->sub2
  up->truc
6|sub2
 associated_section: 1.2.2 sub2
 node_directions:
  prev->sub1
  up->truc
7|section
 associated_section: 1.3 section
 node_directions:
  next->section 1
  prev->truc
  up->chap@comma{} @code{a chap}
8|section 1
 associated_section: 1.4 section
 node_directions:
  prev->section
  up->chap@comma{} @code{a chap}
9| 1
 associated_section
 node_directions:
  prev->chap@comma{} @code{a chap}
  up->Top
10|@asis{} 2
 associated_section: @asis{}
 node_directions:
  up-> 1
';

$result_sections_list{'insert_nodes_for_sectioning_commands'} = '1|top section
 associated_node: Top
 section_directions:
  next->part
 toplevel_directions:
  next->chap, @code{a chap}
2|part
 part_associated_section: 1 chap, @code{a chap}
 section_directions:
  prev->top section
 section_children:
  1|chap, @code{a chap}
  2|
3|chap, @code{a chap}
 associated_node: chap@comma{} @code{a chap}
 associated_part: part
 section_directions:
  next->
  up->part
 toplevel_directions:
  next->
  prev->top section
  up->top section
 section_children:
  1|section
  2|truc
  3|section
  4|section
4|section
 associated_anchor_command: a node
 associated_node: a node
 section_directions:
  next->truc
  up->chap, @code{a chap}
5|truc
 associated_node: truc
 section_directions:
  next->section
  prev->section
  up->chap, @code{a chap}
 section_children:
  1|sub1
  2|sub2
6|sub1
 associated_node: sub1
 section_directions:
  next->sub2
  up->truc
7|sub2
 associated_node: sub2
 section_directions:
  prev->sub1
  up->truc
8|section
 associated_node: section
 section_directions:
  next->section
  prev->truc
  up->chap, @code{a chap}
9|section
 associated_node: section 1
 section_directions:
  prev->section
  up->chap, @code{a chap}
10
 associated_node:  1
 section_directions:
  prev->chap, @code{a chap}
  up->part
 toplevel_directions:
  prev->chap, @code{a chap}
  up->top section
 section_children:
  1|@asis{}
11|@asis{}
 associated_node: @asis{} 2
 section_directions:
  up->
';

$result_sectioning_root{'insert_nodes_for_sectioning_commands'} = 'level: -1
list:
 1|top section
 2|part
';

$result_headings_list{'insert_nodes_for_sectioning_commands'} = '';

1;
