use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_imbricated_with_beginning_command_name'} = '*document_root C1
 *before_node_section C2
  *@macro C5 l1
  |EXTRA
  |macro_name:{foo}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: foo\\n}
   {raw:\\n}
   {raw:@macrototo\\n}
   {raw:in macrototo\\n}
   *@end C1 l5
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
';


$result_texis{'macro_imbricated_with_beginning_command_name'} = '@macro foo

@macrototo
in macrototo
@end macro

';


$result_texts{'macro_imbricated_with_beginning_command_name'} = '
';

$result_errors{'macro_imbricated_with_beginning_command_name'} = '* E l7|unmatched `@end macro\'
 unmatched `@end macro\'

';

$result_nodes_list{'macro_imbricated_with_beginning_command_name'} = '';

$result_sections_list{'macro_imbricated_with_beginning_command_name'} = '';

$result_sectioning_root{'macro_imbricated_with_beginning_command_name'} = '';

$result_headings_list{'macro_imbricated_with_beginning_command_name'} = '';

1;
