use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_fill_gaps_in_sectioning'} = '*document_root C6
 *before_node_section
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


$result_texis{'test_fill_gaps_in_sectioning'} = '@top top

@chapter Chap

@section Section

@unnumberedsubsec @asis{}

@subsubsection There
';


$result_texts{'test_fill_gaps_in_sectioning'} = 'top
***

1 Chap
******

1.1 Section
===========


There
.....
';

$result_errors{'test_fill_gaps_in_sectioning'} = '';

$result_nodes_list{'test_fill_gaps_in_sectioning'} = '';

$result_sections_list{'test_fill_gaps_in_sectioning'} = '1|top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Section
3|Section
 section_directions:
  up->Chap
 section_children:
  1|@asis{}
4|@asis{}
 section_directions:
  up->Section
 section_children:
  1|There
5|There
 section_directions:
  up->@asis{}
';

$result_sectioning_root{'test_fill_gaps_in_sectioning'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_fill_gaps_in_sectioning'} = '';

1;
