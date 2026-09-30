use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'info_ifinfo_ifnotplaintext'} = '*document_root C1
 *before_node_section C2
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifinfo C1 l1
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  >expanded_conditional_command<start;2>
   >*@ifnotplaintext C1 l2
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C1
   {This will be in Info, but not plain text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:42>
    >*@end C1 l4
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnotplaintext}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnotplaintext}
   >expanded_conditional_command<end;1><p:42>
    >*@end C1 l5
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifinfo}
';


$result_texis{'info_ifinfo_ifnotplaintext'} = 'This will be in Info, but not plain text.
';


$result_texts{'info_ifinfo_ifnotplaintext'} = 'This will be in Info, but not plain text.
';

$result_errors{'info_ifinfo_ifnotplaintext'} = '';

$result_nodes_list{'info_ifinfo_ifnotplaintext'} = '';

$result_sections_list{'info_ifinfo_ifnotplaintext'} = '';

$result_sectioning_root{'info_ifinfo_ifnotplaintext'} = '';

$result_headings_list{'info_ifinfo_ifnotplaintext'} = '';

1;
