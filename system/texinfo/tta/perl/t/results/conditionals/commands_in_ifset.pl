use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'commands_in_ifset'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifset C6 l2
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{notset}
    >{raw:@definfoenclose\\n}
    >{raw:@documentencoding ISO-8859-1\\n}
    >{raw:@end ifsettruc\\n}
    >{raw:open { \\n}
    >*@end C1 l7
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
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*@ifset C7 l9
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{notset}
    >{raw:@example\\n}
    >{raw:@copying\\n}
    >{raw:@itemize\\n}
    >{raw:@table\\n}
    >{raw:@bye\\n}
    >*@end C1 l15
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


$result_texis{'commands_in_ifset'} = '

';


$result_texts{'commands_in_ifset'} = '

';

$result_errors{'commands_in_ifset'} = '';

$result_nodes_list{'commands_in_ifset'} = '';

$result_sections_list{'commands_in_ifset'} = '';

$result_sectioning_root{'commands_in_ifset'} = '';

$result_headings_list{'commands_in_ifset'} = '';

1;
