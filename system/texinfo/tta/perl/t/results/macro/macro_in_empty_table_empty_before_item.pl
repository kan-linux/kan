use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_empty_table_empty_before_item'} = '*document_root C1
 *before_node_section C3
  *@macro C2 l1
  |EXTRA
  |macro_name:{emptymacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: emptymacro\\n}
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
  *@table C3 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l4
   *before_item
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@emptymacro C1
     >*brace_arg
   >macro_expansion<end;1>
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
';


$result_texis{'macro_in_empty_table_empty_before_item'} = '@macro emptymacro
@end macro

@table @code
@end table
';


$result_texts{'macro_in_empty_table_empty_before_item'} = '
';

$result_errors{'macro_in_empty_table_empty_before_item'} = '';

$result_nodes_list{'macro_in_empty_table_empty_before_item'} = '';

$result_sections_list{'macro_in_empty_table_empty_before_item'} = '';

$result_sectioning_root{'macro_in_empty_table_empty_before_item'} = '';

$result_headings_list{'macro_in_empty_table_empty_before_item'} = '';

1;
