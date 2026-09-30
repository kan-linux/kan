use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_no_arg_bad_expansion'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{testone}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: testone\\n}
   {raw:res1\\n}
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
   {res1 abc\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@testone
   >macro_expansion<end;1><p:4>
';


$result_texis{'macro_no_arg_bad_expansion'} = '@macro testone
res1
@end macro

res1 abc
';


$result_texts{'macro_no_arg_bad_expansion'} = '
res1 abc
';

$result_errors{'macro_no_arg_bad_expansion'} = '';

$result_nodes_list{'macro_no_arg_bad_expansion'} = '';

$result_sections_list{'macro_no_arg_bad_expansion'} = '';

$result_sectioning_root{'macro_no_arg_bad_expansion'} = '';

$result_headings_list{'macro_no_arg_bad_expansion'} = '';

1;
