use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'root_command_in_conditional'} = '*document_root C2
 *before_node_section C1
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifnottex C1 l1
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
 *@node C1 l2 {Getting Started}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Getting-Started}
  *arguments_line C4
   *line_arg C1
    {Getting Started}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Tutorial}
   |normalized:{Tutorial}
    {Tutorial}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
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
    {Top}
';


$result_texis{'root_command_in_conditional'} = '@node Getting Started, Tutorial, Top, Top
';


$result_texts{'root_command_in_conditional'} = '';

$result_errors{'root_command_in_conditional'} = '* E l2|Next reference to nonexistent `Tutorial\'
 Next reference to nonexistent `Tutorial\'

* E l2|Prev reference to nonexistent `Top\'
 Prev reference to nonexistent `Top\'

* E l2|Up reference to nonexistent `Top\'
 Up reference to nonexistent `Top\'

';

$result_nodes_list{'root_command_in_conditional'} = '1|Getting Started
';

$result_sections_list{'root_command_in_conditional'} = '';

$result_sectioning_root{'root_command_in_conditional'} = '';

$result_headings_list{'root_command_in_conditional'} = '';

1;
