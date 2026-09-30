use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_fill_gaps_in_sectioning_insert_nodes'} = '*document_root C11
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
 *@top C2 l1 {top}
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
 *@node C1 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
 *@chapter C2 l3 {Chap}
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
    {Chap}
  {empty_line:\\n}
 *@node C1 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
 *@section C2 l5 {Section}
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
    {Section}
  {empty_line:\\n}
 *@node C1 {@asis{} 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{-1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1
     *brace_container
    { 1}
 *@unnumberedsubsec C2 {@asis{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1
     *brace_container
  {empty_line:\\n}
 *@node C1 {There}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{There}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {There}
 *@subsubsection C1 l7 {There}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {There}
';


$result_texis{'test_fill_gaps_in_sectioning_insert_nodes'} = '@node Top
@top top

@node Chap
@chapter Chap

@node Section
@section Section

@node @asis{} 1
@unnumberedsubsec @asis{}

@node There
@subsubsection There
';


$result_texts{'test_fill_gaps_in_sectioning_insert_nodes'} = 'top
***

1 Chap
******

1.1 Section
===========


There
.....
';

$result_errors{'test_fill_gaps_in_sectioning_insert_nodes'} = '';

$result_nodes_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '1|Top
 associated_section: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 Chap
 node_directions:
  prev->Top
  up->Top
3|Section
 associated_section: 1.1 Section
 node_directions:
  up->Chap
4|@asis{} 1
 associated_section: @asis{}
 node_directions:
  up->Section
5|There
 associated_section: There
 node_directions:
  up->@asis{} 1
';

$result_sections_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '1|top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_node: Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Section
3|Section
 associated_node: Section
 section_directions:
  up->Chap
 section_children:
  1|@asis{}
4|@asis{}
 associated_node: @asis{} 1
 section_directions:
  up->Section
 section_children:
  1|There
5|There
 associated_node: There
 section_directions:
  up->@asis{}
';

$result_sectioning_root{'test_fill_gaps_in_sectioning_insert_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '';

1;
