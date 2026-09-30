use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_format_single_footnote_in_inline_content'} = '*document_root C5
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
 *@chapter C9 l5 {Chap}
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
  *paragraph C3
   {a}
   *@footnote C1 l7
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {In the footnote}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {b}
   *@footnote C1 l9
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C3
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:an example in the footnote}
     {empty_line:\\n}
     *@example C3 l11
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *preformatted C1
       {in    example\\n}
      *@end C1 l13
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{example}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {example}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {c}
   *@footnote C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
   |EXTRA
   |global_command_number:{3}
    *brace_command_context C2
     *@*
     {\\n}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {d}
   *@footnote C1 l20
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
   |EXTRA
   |global_command_number:{4}
    *brace_command_context C1
     *@quotation C4 l21
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *arguments_line C1
       *block_line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {qtitle}
      *@author C1 l22
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |global_command_number:{1}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {Me}
      *paragraph C1
       {In quotation\\n}
      *@end C1 l24
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{quotation}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {quotation}
   {\\n}
';


$result_texis{'test_format_single_footnote_in_inline_content'} = '@node Top
@top top

@node chap
@chapter Chap

a@footnote{In the footnote}.

b@footnote{@c an example in the footnote

@example
in    example
@end example
}

c@footnote{
@*
}

d@footnote{
@quotation qtitle
@author Me
In quotation
@end quotation
}
';


$result_texts{'test_format_single_footnote_in_inline_content'} = 'top
***

1 Chap
******

a.

b

c

d
';

$result_errors{'test_format_single_footnote_in_inline_content'} = '';

$result_nodes_list{'test_format_single_footnote_in_inline_content'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'test_format_single_footnote_in_inline_content'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
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

$result_sectioning_root{'test_format_single_footnote_in_inline_content'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_format_single_footnote_in_inline_content'} = '';

1;
