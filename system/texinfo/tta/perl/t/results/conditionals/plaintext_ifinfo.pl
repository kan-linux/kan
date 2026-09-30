use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'plaintext_ifinfo'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifinfo C1 l2
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C1
   {this text will appear only in Info and plain text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:51>
    >*@end C1 l4
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


$result_texis{'plaintext_ifinfo'} = '
this text will appear only in Info and plain text.
';


$result_texts{'plaintext_ifinfo'} = '
this text will appear only in Info and plain text.
';

$result_errors{'plaintext_ifinfo'} = '';

$result_nodes_list{'plaintext_ifinfo'} = '';

$result_sections_list{'plaintext_ifinfo'} = '';

$result_sectioning_root{'plaintext_ifinfo'} = '';

$result_headings_list{'plaintext_ifinfo'} = '';

1;
