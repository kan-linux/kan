use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'htmlxref_no_urlprefix_first'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {top}
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
    {top}
 *@top C2 l2 {top}
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
 *@chapter C6 l5 {Chap}
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
  *paragraph C2
   *@xref C4 l7
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C4 l9
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual2}
   {.\\n}
  {empty_line:\\n}
';


$result_texis{'htmlxref_no_urlprefix_first'} = '@node top
@top top

@node chap
@chapter Chap

@xref{,,,manual}.

@xref{,,,manual2}.

';


$result_texts{'htmlxref_no_urlprefix_first'} = 'top
***

1 Chap
******

.

.

';

$result_errors{'htmlxref_no_urlprefix_first'} = '';

$result_nodes_list{'htmlxref_no_urlprefix_first'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->top
  up->top
';

$result_sections_list{'htmlxref_no_urlprefix_first'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'htmlxref_no_urlprefix_first'} = 'level: -1
list:
 1|top
';

$result_headings_list{'htmlxref_no_urlprefix_first'} = '';

1;
