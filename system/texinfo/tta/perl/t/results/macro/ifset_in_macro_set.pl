use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifset_in_macro_set'} = '*document_root C1
 *before_node_section C4
  *@macro C5 l1
  |EXTRA
  |macro_name:{note}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: note {arg}\\n}
   {raw:@ifset notes \\n}
   {raw:\\arg\\\\n}
   {raw:@end ifset\\n}
   *@end C1 l5
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
   >*macro_call@note C1
    >*brace_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument:\\n}
     >{macro_call_arg_text:arg\\n}
  >expanded_conditional_command<start;1><p:1>
   >*@ifset C1 l9:@note
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument: \\n}
      >{notes}
  *paragraph C1
   {arg\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<end;1><p:1>
   >*@end C1 l9:@note
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
     >>SOURCEMARKS
     >>macro_expansion<end;1><p:5>
';


$result_texis{'ifset_in_macro_set'} = '@macro note {arg}
@ifset notes 
\\arg\\
@end ifset
@end macro

arg

';


$result_texts{'ifset_in_macro_set'} = '
arg

';

$result_errors{'ifset_in_macro_set'} = '';

$result_nodes_list{'ifset_in_macro_set'} = '';

$result_sections_list{'ifset_in_macro_set'} = '';

$result_sectioning_root{'ifset_in_macro_set'} = '';

$result_headings_list{'ifset_in_macro_set'} = '';

1;
