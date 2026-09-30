use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_one_arg_end_of_file'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{onearg}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: onearg{arg}\\n}
   {raw:Arg \\arg\\.\\n}
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
  *paragraph C1
   {Arg .}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call_line@onearg C1
     >*line_arg
   >macro_expansion<end;1><p:5>
';


$result_texis{'macro_one_arg_end_of_file'} = '@macro onearg{arg}
Arg \\arg\\.
@end macro

Arg .';


$result_texts{'macro_one_arg_end_of_file'} = '
Arg .';

$result_errors{'macro_one_arg_end_of_file'} = '';

$result_nodes_list{'macro_one_arg_end_of_file'} = '';

$result_sections_list{'macro_one_arg_end_of_file'} = '';

$result_sectioning_root{'macro_one_arg_end_of_file'} = '';

$result_headings_list{'macro_one_arg_end_of_file'} = '';

1;
