use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_expansion_in_set_comment_leading_spaces'} = '*document_root C1
 *before_node_section C4
  *@macro C3 l1
  |EXTRA
  |macro_name:{mymac}
  |misc_args:A{a}
   *arguments_line C1
    {macro_line: mymac {a}\\n}
   {raw:@set flag \\a\\ @comment \\n}
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@mymac C1
    >*brace_arg C1
     >{macro_call_arg_text:v}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{flag|v}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument:  }
     ||>SOURCEMARKS
     ||>macro_expansion<end;1><p:1>
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:here}
    {rawline_text:flag v }
  {empty_line:\\n}
';


$result_texis{'macro_expansion_in_set_comment_leading_spaces'} = '@macro mymac {a}
@set flag \\a\\ @comment 
@end macro

@set flag v @comment  here

';


$result_texts{'macro_expansion_in_set_comment_leading_spaces'} = '

';

$result_errors{'macro_expansion_in_set_comment_leading_spaces'} = '';

$result_nodes_list{'macro_expansion_in_set_comment_leading_spaces'} = '';

$result_sections_list{'macro_expansion_in_set_comment_leading_spaces'} = '';

$result_sectioning_root{'macro_expansion_in_set_comment_leading_spaces'} = '';

$result_headings_list{'macro_expansion_in_set_comment_leading_spaces'} = '';

1;
