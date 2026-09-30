use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'filenameconflictwithnonsplit'} = '*document_root C3
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
 *@top C5 l2 {top}
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
  *@anchor C1 l4
  |EXTRA
  |is_target:{1}
  |normalized:{filenameconflictwithnonsplit}
   *brace_arg C1
    {filenameconflictwithnonsplit}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
';


$result_texis{'filenameconflictwithnonsplit'} = '@node Top
@top top

@anchor{filenameconflictwithnonsplit}

';


$result_texts{'filenameconflictwithnonsplit'} = 'top
***


';

$result_errors{'filenameconflictwithnonsplit'} = '';

$result_nodes_list{'filenameconflictwithnonsplit'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'filenameconflictwithnonsplit'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'filenameconflictwithnonsplit'} = 'level: -1
list:
 1|top
';

$result_headings_list{'filenameconflictwithnonsplit'} = '';

1;
