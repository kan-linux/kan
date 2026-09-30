use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_macro_definition'} = '*document_root C1
 *before_node_section C3
  *@macro C2 l1
  |EXTRA
  |macro_name:{foo}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: foo\\n}
   *@end C1 l2
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
  *@macro C2 l4
  |EXTRA
  |macro_name:{foo}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: foo\\n}
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
';


$result_texis{'double_macro_definition'} = '@macro foo
@end macro

@macro foo
@end macro
';


$result_texts{'double_macro_definition'} = '
';

$result_errors{'double_macro_definition'} = '* W l4|macro `foo\' previously defined
 warning: macro `foo\' previously defined

* W l1|here is the previous definition of `foo\'
 warning: here is the previous definition of `foo\'

';

$result_nodes_list{'double_macro_definition'} = '';

$result_sections_list{'double_macro_definition'} = '';

$result_sectioning_root{'double_macro_definition'} = '';

$result_headings_list{'double_macro_definition'} = '';

1;
