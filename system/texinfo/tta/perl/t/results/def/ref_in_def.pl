use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ref_in_def'} = '*document_root C2
 *before_node_section C1
  {empty_line:\\n}
 *@node C6 l2 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *@deffn C4 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l4
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |*@ref C1
       |*brace_arg C1
       ||EXTRA
       ||node_content:{myanchor}
        |{myanchor}
   |element_node:{first}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       *@ref C1 l4
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@ref C1 l4
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l4
       *@pxref C1 l4
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@pxref C1 l4
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@pxref C1 l4
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
   *@deffnx C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |*@ref C1
       |*brace_arg C1
       ||EXTRA
       ||node_content:{myanchor}
        |{myanchor}
   |element_node:{first}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       *@ref C1 l5
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@ref C1 l5
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l5
       *@pxref C1 l5
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@pxref C1 l5
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@pxref C1 l5
        *brace_arg C1
        |EXTRA
        |node_content:{myanchor}
        |normalized:{myanchor}
         {myanchor}
   *def_item C1
    *paragraph C1
     {T\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@anchor C1 l9
  |EXTRA
  |is_target:{1}
  |normalized:{myanchor}
   *brace_arg C1
    {myanchor}
  {spaces_after_close_brace:\\n}
';


$result_texis{'ref_in_def'} = '
@node first

@deffn @ref{myanchor} @ref{myanchor} {@pxref{myanchor}} @pxref{myanchor} @pxref{myanchor}
@deffnx @ref{myanchor} @ref{myanchor} {@pxref{myanchor}} @pxref{myanchor} @pxref{myanchor}
T
@end deffn

@anchor{myanchor}
';


$result_texts{'ref_in_def'} = '

myanchor: myanchor myanchor myanchor myanchor
myanchor: myanchor myanchor myanchor myanchor
T

';

$result_errors{'ref_in_def'} = '';

$result_nodes_list{'ref_in_def'} = '1|first
';

$result_sections_list{'ref_in_def'} = '';

$result_sectioning_root{'ref_in_def'} = '';

$result_headings_list{'ref_in_def'} = '';

$result_indices_sort_strings{'ref_in_def'} = 'fn:
 myanchor
 myanchor
';


$result_converted{'plaintext'}->{'ref_in_def'} = ' -- myanchor: myanchor see myanchor see myanchor see myanchor
 -- myanchor: myanchor see myanchor see myanchor see myanchor
     T

';

1;
