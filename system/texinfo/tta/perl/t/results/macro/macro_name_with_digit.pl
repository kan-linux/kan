use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_name_with_digit'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{macro1}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: macro1\\n}
   {raw:macro1\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@macro C3 l5
  |EXTRA
  |macro_name:{macro11}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: macro11 {arg}\\n}
   {raw:expand \\arg\\\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *paragraph C1
   {expand some thing macro1\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call_line@macro11 C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*line_arg C1
      >{some thing @macro1{}}
   >macro_expansion<start;2><p:18>
    >*macro_call@macro1 C1
     >*brace_arg
   >macro_expansion<end;2><p:24>
   >macro_expansion<end;1><p:24>
';


$result_texis{'macro_name_with_digit'} = '@macro macro1
macro1
@end macro

@macro macro11 {arg}
expand \\arg\\
@end macro

expand some thing macro1
';


$result_texts{'macro_name_with_digit'} = '

expand some thing macro1
';

$result_errors{'macro_name_with_digit'} = '';

$result_nodes_list{'macro_name_with_digit'} = '';

$result_sections_list{'macro_name_with_digit'} = '';

$result_sectioning_root{'macro_name_with_digit'} = '';

$result_headings_list{'macro_name_with_digit'} = '';

1;
