use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_expands_to_empty'} = '*document_root C1
 *before_node_section C4
  *@macro C3 l1
  |EXTRA
  |macro_name:{foo}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: foo {arg}\\n}
   {raw:\\arg\\\\n}
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
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call@foo C1
    >*brace_arg
  >macro_expansion<end;1>
  *paragraph C1
   {aa\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@foo C1
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;2><p:2>
';


$result_texis{'macro_expands_to_empty'} = '@macro foo {arg}
\\arg\\
@end macro


aa
';


$result_texts{'macro_expands_to_empty'} = '

aa
';

$result_errors{'macro_expands_to_empty'} = '';

$result_nodes_list{'macro_expands_to_empty'} = '';

$result_sections_list{'macro_expands_to_empty'} = '';

$result_sectioning_root{'macro_expands_to_empty'} = '';

$result_headings_list{'macro_expands_to_empty'} = '';

1;
