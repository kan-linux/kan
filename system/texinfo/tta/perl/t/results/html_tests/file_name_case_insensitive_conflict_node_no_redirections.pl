use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'file_name_case_insensitive_conflict_node_no_redirections'} = '*document_root C11
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
 *@top C2 l2 {top section}
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
 *@node C1 l4 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C5 l5 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
  *@anchor C1 l7
  |EXTRA
  |is_target:{1}
  |normalized:{fOO}
   *brace_arg C1
    {fOO}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l9 {Foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Foo}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Foo}
 *@section C2 l10 {Foo}
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
    {Foo}
  {empty_line:\\n}
 *@node C1 l12 {Bar}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Bar}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Bar}
 *@section C2 l13 {Bar}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Bar}
  {empty_line:\\n}
 *@node C1 l15 {foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{foo}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {foo}
 *@section C5 l16 {foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {foo}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l18
    *brace_arg C1
    |EXTRA
    |node_content:{foo}
    |normalized:{foo}
     {foo}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l20
    *brace_arg C1
    |EXTRA
    |node_content:{Foo}
    |normalized:{Foo}
     {Foo}
   {\\n}
';


$result_texis{'file_name_case_insensitive_conflict_node_no_redirections'} = '@node Top
@top top section

@node chap
@chapter Chapter

@anchor{fOO}

@node Foo
@section Foo

@node Bar
@section Bar

@node foo
@section foo

@xref{foo}

@xref{Foo}
';


$result_texts{'file_name_case_insensitive_conflict_node_no_redirections'} = 'top section
***********

1 Chapter
*********


1.1 Foo
=======

1.2 Bar
=======

1.3 foo
=======

foo

Foo
';

$result_errors{'file_name_case_insensitive_conflict_node_no_redirections'} = '';

$result_nodes_list{'file_name_case_insensitive_conflict_node_no_redirections'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
3|Foo
 associated_section: 1.1 Foo
 associated_title_command: 1.1 Foo
 node_directions:
  next->Bar
  up->chap
4|Bar
 associated_section: 1.2 Bar
 associated_title_command: 1.2 Bar
 node_directions:
  next->foo
  prev->Foo
  up->chap
5|foo
 associated_section: 1.3 foo
 associated_title_command: 1.3 foo
 node_directions:
  prev->Bar
  up->chap
';

$result_sections_list{'file_name_case_insensitive_conflict_node_no_redirections'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
 section_children:
  1|Foo
  2|Bar
  3|foo
3|Foo
 associated_anchor_command: Foo
 associated_node: Foo
 section_directions:
  next->Bar
  up->Chapter
4|Bar
 associated_anchor_command: Bar
 associated_node: Bar
 section_directions:
  next->foo
  prev->Foo
  up->Chapter
5|foo
 associated_anchor_command: foo
 associated_node: foo
 section_directions:
  prev->Bar
  up->Chapter
';

$result_sectioning_root{'file_name_case_insensitive_conflict_node_no_redirections'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'file_name_case_insensitive_conflict_node_no_redirections'} = '';

1;
