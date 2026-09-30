use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'file_name_case_insensitive_conflict_redirections'} = '*document_root C4
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
 *@chapter C7 l4 {Chapter}
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
  *@table C5 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@samp l6
   *before_item C1
    {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {foo}
    *table_definition C4
     *@anchor C1 l9
     |EXTRA
     |is_target:{1}
     |normalized:{foo}
      *brace_arg C1
       {foo}
     {spaces_after_close_brace:\\n}
     *paragraph C3
      {Some text about }
      *@samp C1 l10
       *brace_container C1
        {foo}
      {\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l12
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {Foo}
    *table_definition C4
     *@anchor C1 l13
     |EXTRA
     |is_target:{1}
     |normalized:{Foo}
      *brace_arg C1
       {Foo}
     {spaces_after_close_brace:\\n}
     *paragraph C3
      {Some text about }
      *@samp C1 l14
       *brace_container C1
        {Foo}
      {\\n}
     {empty_line:\\n}
   *@end C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
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


$result_texis{'file_name_case_insensitive_conflict_redirections'} = '@node Top
@top top section

@chapter Chapter

@table @samp

@item foo
@anchor{foo}
Some text about @samp{foo}

@item Foo
@anchor{Foo}
Some text about @samp{Foo}

@end table

@xref{foo}

@xref{Foo}
';


$result_texts{'file_name_case_insensitive_conflict_redirections'} = 'top section
***********

1 Chapter
*********


foo
Some text about foo

Foo
Some text about Foo


foo

Foo
';

$result_errors{'file_name_case_insensitive_conflict_redirections'} = '';

$result_nodes_list{'file_name_case_insensitive_conflict_redirections'} = '1|Top
 associated_section: top section
 associated_title_command: top section
';

$result_sections_list{'file_name_case_insensitive_conflict_redirections'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'file_name_case_insensitive_conflict_redirections'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'file_name_case_insensitive_conflict_redirections'} = '';

$result_converted_errors{'file_html'}->{'file_name_case_insensitive_conflict_redirections'} = '* W l13|@anchor `Foo\' file foo.html for redirection exists
 warning: @anchor `Foo\' file foo.html for redirection exists

* WC l9|conflict with @anchor `foo\' redirection file
 warning: conflict with @anchor `foo\' redirection file

';

1;
