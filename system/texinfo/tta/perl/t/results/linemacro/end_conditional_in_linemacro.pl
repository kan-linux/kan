use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_conditional_in_linemacro'} = '*document_root C1
 *before_node_section C5
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{lm}
  |misc_args:A{a}
   *arguments_line C1
    {macro_line: lm {a}\\n}
   {raw:\\a\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifclear C1 l5
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{aa}
  *paragraph C2
   {text\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*linemacro_arg C1
      >{bracketed_linemacro_arg:text\\n  @end ifclear}
   {  }
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:2>
    >*@end C1 l7:@lm
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
      >>linemacro_expansion<end;1><p:7>
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifset C3 l9
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{b}
    >{raw:@lm {text\\n}
    >*@end C1 l11
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
  {empty_line:\\n}
';


$result_texis{'end_conditional_in_linemacro'} = '@linemacro lm {a}
\\a\\
@end linemacro

text
  

';


$result_texts{'end_conditional_in_linemacro'} = '
text
  

';

$result_errors{'end_conditional_in_linemacro'} = '* E l11|misplaced }
 misplaced }

';

$result_nodes_list{'end_conditional_in_linemacro'} = '';

$result_sections_list{'end_conditional_in_linemacro'} = '';

$result_sectioning_root{'end_conditional_in_linemacro'} = '';

$result_headings_list{'end_conditional_in_linemacro'} = '';

1;
