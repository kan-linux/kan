use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifset_in_command'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C2
   *@file C1 l2
    *brace_container C2
     {\\n}
     >SOURCEMARKS
     >ignored_conditional_block<1><p:1>
      >*@ifset C3 l3
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >*arguments_line C1
        >*block_line_arg C1
        >|INFO
        >|spaces_after_argument:
         >|{spaces_after_argument:\\n}
         >{x}
       >{raw:xset\\n}
       >*@end C1 l5
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
     >expanded_conditional_command<start;1><p:1>
      >*@ifclear C1 l6
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >*arguments_line C1
        >*block_line_arg C1
        >|INFO
        >|spaces_after_argument:
         >|{spaces_after_argument:\\n}
         >{x}
     {xclear\\n}
     >SOURCEMARKS
     >expanded_conditional_command<end;1><p:7>
      >*@end C1 l8
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
   {\\n}
';


$result_texis{'ifset_in_command'} = '
@file{
xclear
}
';


$result_texts{'ifset_in_command'} = '

xclear

';

$result_errors{'ifset_in_command'} = '';

$result_nodes_list{'ifset_in_command'} = '';

$result_sections_list{'ifset_in_command'} = '';

$result_sectioning_root{'ifset_in_command'} = '';

$result_headings_list{'ifset_in_command'} = '';

1;
