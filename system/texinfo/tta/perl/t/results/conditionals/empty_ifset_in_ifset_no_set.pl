use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_ifset_in_ifset_no_set'} = '*document_root C1
 *before_node_section C1
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifset C5 l2
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{notset}
    >{raw:@verbatim\\n}
    >{raw:@ifset\\n}
    >{raw:@end verbatim\\n}
    >{raw:@end ifset\\n}
';


$result_texis{'empty_ifset_in_ifset_no_set'} = '
';


$result_texts{'empty_ifset_in_ifset_no_set'} = '
';

$result_errors{'empty_ifset_in_ifset_no_set'} = '* E l2|no matching `@end ifset\'
 no matching `@end ifset\'

';

$result_nodes_list{'empty_ifset_in_ifset_no_set'} = '';

$result_sections_list{'empty_ifset_in_ifset_no_set'} = '';

$result_sectioning_root{'empty_ifset_in_ifset_no_set'} = '';

$result_headings_list{'empty_ifset_in_ifset_no_set'} = '';

1;
