use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_expansion_end_in_conditional_line'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{begincond}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: begincond\\n}
   {raw:@ifset fl\\n}
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
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{flag|1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:flag 1}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@begincond C1
    >*brace_arg
  >expanded_conditional_command<start;1><p:1>
   >*@ifset C1 l7:@begincond
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{flag}
      >>SOURCEMARKS
      >>macro_expansion<end;1><p:2>
  *paragraph C1
   {Defined\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:8>
    >*@end C1 l9
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
';


$result_texis{'macro_expansion_end_in_conditional_line'} = '@macro begincond
@ifset fl
@end macro

@set flag 1

Defined
';


$result_texts{'macro_expansion_end_in_conditional_line'} = '

Defined
';

$result_errors{'macro_expansion_end_in_conditional_line'} = '';

$result_nodes_list{'macro_expansion_end_in_conditional_line'} = '';

$result_sections_list{'macro_expansion_end_in_conditional_line'} = '';

$result_sectioning_root{'macro_expansion_end_in_conditional_line'} = '';

$result_headings_list{'macro_expansion_end_in_conditional_line'} = '';

1;
