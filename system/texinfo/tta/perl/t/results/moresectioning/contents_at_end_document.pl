use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'contents_at_end_document'} = '*document_root C4
 *before_node_section
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
 *@top C2 l2 {contents at end document}
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
    |{spaces_after_argument: \\n}
    {contents at end document}
  {empty_line:\\n}
 *@chapter C3 l4 {chap}
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
  *@contents C1 l6
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'contents_at_end_document'} = '@node Top
@top contents at end document 

@chapter chap

@contents
';


$result_texts{'contents_at_end_document'} = 'contents at end document
************************

1 chap
******

';

$result_errors{'contents_at_end_document'} = '';

$result_nodes_list{'contents_at_end_document'} = '1|Top
 associated_section: contents at end document
 associated_title_command: contents at end document
';

$result_sections_list{'contents_at_end_document'} = '1|contents at end document
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->contents at end document
 toplevel_directions:
  prev->contents at end document
  up->contents at end document
';

$result_sectioning_root{'contents_at_end_document'} = 'level: -1
list:
 1|contents at end document
';

$result_headings_list{'contents_at_end_document'} = '';

1;
