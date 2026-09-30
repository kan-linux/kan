use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifnot_format_conditional'} = '*document_root C1
 *before_node_section C4
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifnottex C1 l1
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C1
   {not tex\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:8>
    >*@end C1 l3
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
  {empty_line:\\n}
  *paragraph C1
   {After.}
';


$result_texis{'ifnot_format_conditional'} = 'not tex

After.';


$result_texts{'ifnot_format_conditional'} = 'not tex

After.';

$result_errors{'ifnot_format_conditional'} = '';

$result_nodes_list{'ifnot_format_conditional'} = '';

$result_sections_list{'ifnot_format_conditional'} = '';

$result_sectioning_root{'ifnot_format_conditional'} = '';

$result_headings_list{'ifnot_format_conditional'} = '';

1;
