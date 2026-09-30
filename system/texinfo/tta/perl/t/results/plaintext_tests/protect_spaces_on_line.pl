use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_spaces_on_line'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *paragraph C5
   {Before samp. }
   *@samp C1 l2
    *brace_container C1
     {a}
   {. after samp, w }
   *@w C1 l2
    *brace_container C1
     {in   w. after dot}
   {  afterw\\n}
  {empty_line:\\n}
  *@quotation C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@exdent C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {before samp. }
     *@samp C1 l5
      *brace_container C1
       {a}
     {. after samp, w }
     *@w C1 l5
      *brace_container C1
       {in   w. after dot}
     {  afterw}
   *@end C1 l6
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
';


$result_texis{'protect_spaces_on_line'} = '
Before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw

@quotation
@exdent before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw
@end quotation
';


$result_texts{'protect_spaces_on_line'} = '
Before samp. a. after samp, w in   w. after dot  afterw

before samp. a. after samp, w in   w. after dot  afterw
';

$result_errors{'protect_spaces_on_line'} = '';

$result_nodes_list{'protect_spaces_on_line'} = '';

$result_sections_list{'protect_spaces_on_line'} = '';

$result_sectioning_root{'protect_spaces_on_line'} = '';

$result_headings_list{'protect_spaces_on_line'} = '';


$result_converted{'plaintext'}->{'protect_spaces_on_line'} = 'Before samp.  ‘a’.  after samp, w in w.  after dot afterw

before samp.  ‘a’.  after samp, w in w.  after dot afterw
';

1;
