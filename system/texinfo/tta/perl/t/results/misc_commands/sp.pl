use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sp'} = '*document_root C1
 *before_node_section C8
  {empty_line:\\n}
  *paragraph C1
   {Text line followed on the same line and another below }
  *@sp C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  *@sp C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  *paragraph C1
   {Text line after the sp followed by a sp }
  *@sp C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  *paragraph C1
   {Text line after the text line followed by the sp.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:50>
    >*@ifnottex C1 l6
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
  *@sp C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  >SOURCEMARKS
  >expanded_conditional_command<end;1>
   >*@end C1 l8
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
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2 a number after sp}
';


$result_texis{'sp'} = '
Text line followed on the same line and another below @sp 1
@sp 2
Text line after the sp followed by a sp @sp 1
Text line after the text line followed by the sp.
@sp 2 a number after sp
';


$result_texts{'sp'} = '
Text line followed on the same line and another below 


Text line after the sp followed by a sp 
Text line after the text line followed by the sp.
';

$result_errors{'sp'} = '* W l2|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* W l4|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* E l7|@sp arg must be numeric, not `2 a number after sp\'
 @sp arg must be numeric, not `2 a number after sp\'

';

$result_nodes_list{'sp'} = '';

$result_sections_list{'sp'} = '';

$result_sectioning_root{'sp'} = '';

$result_headings_list{'sp'} = '';

1;
