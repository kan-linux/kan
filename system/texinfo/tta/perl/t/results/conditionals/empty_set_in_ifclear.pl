use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_set_in_ifclear'} = '*document_root C1
 *before_node_section C2
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{a|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:a}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifclear C3 l3
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
    >{raw:a is set to:|@value{a}|.\\n}
    >*@end C1 l5
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifclear}
     >*line_arg C1
      >{ifclear}
';


$result_texis{'empty_set_in_ifclear'} = '@set a

';


$result_texts{'empty_set_in_ifclear'} = '
';

$result_errors{'empty_set_in_ifclear'} = '';

$result_nodes_list{'empty_set_in_ifclear'} = '';

$result_sections_list{'empty_set_in_ifclear'} = '';

$result_sectioning_root{'empty_set_in_ifclear'} = '';

$result_headings_list{'empty_set_in_ifclear'} = '';

1;
