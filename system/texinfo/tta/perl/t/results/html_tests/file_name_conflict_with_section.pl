use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'file_name_conflict_with_section'} = '*document_root C4
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
  *@anchor C1 l3
  |EXTRA
  |is_target:{1}
  |normalized:{Chap}
   *brace_arg C1
    {Chap}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@chapter C1 l5 {Chap}
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
';


$result_texis{'file_name_conflict_with_section'} = '@node Top
@top top
@anchor{Chap}

@chapter Chap
';


$result_texts{'file_name_conflict_with_section'} = 'top
***

1 Chap
******
';

$result_errors{'file_name_conflict_with_section'} = '';

$result_nodes_list{'file_name_conflict_with_section'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'file_name_conflict_with_section'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
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
';

$result_sectioning_root{'file_name_conflict_with_section'} = 'level: -1
list:
 1|top
';

$result_headings_list{'file_name_conflict_with_section'} = '';

$result_converted_errors{'file_html'}->{'file_name_conflict_with_section'} = '* W l3|@anchor `Chap\' file Chap.html for redirection exists
 warning: @anchor `Chap\' file Chap.html for redirection exists

* WC l5|conflict with @chapter `Chap\' file
 warning: conflict with @chapter `Chap\' file

';

1;
