use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_heading_between'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C1
   *@settitle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {node heading between}
 *@node C1 l2 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
 *@chapter C2 l3 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
 *@node C3 l5 {Topic}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Topic}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Topic}
  *@subsubheading C1 l6
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
    {Topic}
  {empty_line:\\n}
 *@node C1 l8 {Section}
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
 *@section C3 l9 {Section}
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
    {Section}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:{Topic}
    |normalized:{Topic}
     {Topic}
   {\\n}
';


$result_texis{'node_heading_between'} = '@settitle node heading between
@node Chapter
@chapter Chapter

@node Topic
@subsubheading Topic

@node Section
@section Section

@xref{Topic}
';


$result_texts{'node_heading_between'} = '1 Chapter
*********

Topic
.....

1.1 Section
===========

Topic
';

$result_errors{'node_heading_between'} = '';

$result_nodes_list{'node_heading_between'} = '1|Chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
2|Topic
 associated_title_command: @subsubheading Topic
3|Section
 associated_section: 1.1 Section
 associated_title_command: 1.1 Section
 node_directions:
  up->Chapter
';

$result_sections_list{'node_heading_between'} = '1|Chapter
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_children:
  1|Section
2|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chapter
';

$result_sectioning_root{'node_heading_between'} = 'level: 0
list:
 1|Chapter
';

$result_headings_list{'node_heading_between'} = '1|Topic
 associated_anchor_command: Topic
';

1;
