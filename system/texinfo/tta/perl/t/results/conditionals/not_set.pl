use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'not_set'} = '*document_root C1
 *before_node_section C1
  {}
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*@ifset C5 l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
    >{raw:\\n}
    >{raw:Flag a is set.\\n}
    >{raw:\\n}
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
';


$result_texis{'not_set'} = '';


$result_texts{'not_set'} = '';

$result_errors{'not_set'} = '';

$result_nodes_list{'not_set'} = '';

$result_sections_list{'not_set'} = '';

$result_sectioning_root{'not_set'} = '';

$result_headings_list{'not_set'} = '';

1;
