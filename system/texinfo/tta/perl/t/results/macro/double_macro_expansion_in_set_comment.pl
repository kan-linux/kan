use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_macro_expansion_in_set_comment'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{mymac}
  |misc_args:A{a}
   *arguments_line C1
    {macro_line: mymac {a}\\n}
   {raw:@set flag \\a\\ @comment in \\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@macro C3 l5
  |EXTRA
  |macro_name:{callmymac}
  |misc_args:A{b}
   *arguments_line C1
    {macro_line: callmymac {b}\\n}
   {raw:@mymac{\\b\\} here\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@callmymac C1
    >*brace_arg C1
     >{macro_call_arg_text:vv}
  >macro_expansion<start;2><p:1>
   >*macro_call@mymac C1
    >*brace_arg C1
     >{macro_call_arg_text:vv}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{flag|vv}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:in  here after }
      |>SOURCEMARKS
      |>macro_expansion<end;2><p:3>
      |>macro_expansion<end;1><p:8>
    {rawline_text:flag vv }
';


$result_texis{'double_macro_expansion_in_set_comment'} = '@macro mymac {a}
@set flag \\a\\ @comment in 
@end macro

@macro callmymac {b}
@mymac{\\b\\} here
@end macro

@set flag vv @comment in  here after 
';


$result_texts{'double_macro_expansion_in_set_comment'} = '

';

$result_errors{'double_macro_expansion_in_set_comment'} = '';

$result_nodes_list{'double_macro_expansion_in_set_comment'} = '';

$result_sections_list{'double_macro_expansion_in_set_comment'} = '';

$result_sectioning_root{'double_macro_expansion_in_set_comment'} = '';

$result_headings_list{'double_macro_expansion_in_set_comment'} = '';

1;
