use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifclear_in_macro'} = '*document_root C1
 *before_node_section C4
  *@macro C5 l1
  |EXTRA
  |macro_name:{note}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: note {arg}\\n}
   {raw:@ifclear notes \\n}
   {raw:\\arg\\\\n}
   {raw:@end ifclear\\n}
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
   >*@ifclear C1 l9:@note
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
   >|text_arg:{ifclear}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{ifclear}
     >>SOURCEMARKS
     >>macro_expansion<end;1><p:7>
';


$result_texis{'ifclear_in_macro'} = '@macro note {arg}
@ifclear notes 
\\arg\\
@end ifclear
@end macro

arg

';


$result_texts{'ifclear_in_macro'} = '
arg

';

$result_errors{'ifclear_in_macro'} = '';

$result_nodes_list{'ifclear_in_macro'} = '';

$result_sections_list{'ifclear_in_macro'} = '';

$result_sectioning_root{'ifclear_in_macro'} = '';

$result_headings_list{'ifclear_in_macro'} = '';

1;
