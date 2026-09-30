use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_ifset'} = '*document_root C1
 *before_node_section C5
  {empty_line:\\n}
  *@macro C3 l2
  |EXTRA
  |macro_name:{truc}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: truc {}\\n}
   {raw:truc\\n}
   *@end C1 l4
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
  >ignored_conditional_block<1><p:1>
   >*@ifset C6 l6
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
    >{raw:@unmacro truc\\n}
    >{raw:@macro truc{}\\n}
    >{raw:in ifset\\n}
    >{raw:@end macro\\n}
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
  *paragraph C1
   {truc\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@truc C1
     >*brace_arg
   >macro_expansion<end;1><p:4>
';


$result_texis{'macro_in_ifset'} = '
@macro truc {}
truc
@end macro


truc
';


$result_texts{'macro_in_ifset'} = '


truc
';

$result_errors{'macro_in_ifset'} = '';

$result_nodes_list{'macro_in_ifset'} = '';

$result_sections_list{'macro_in_ifset'} = '';

$result_sectioning_root{'macro_in_ifset'} = '';

$result_headings_list{'macro_in_ifset'} = '';

1;
