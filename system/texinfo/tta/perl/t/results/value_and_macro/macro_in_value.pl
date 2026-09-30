use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_value'} = '*document_root C1
 *before_node_section C7
  *@macro C5 l1
  |EXTRA
  |macro_name:{ab}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: ab\\n}
   {raw:a\\n}
   {raw:\\n}
   {raw:b\\n}
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
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{flagab|@ab}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:flagab @ab}
  {empty_line:\\n}
  *paragraph C1
   {flagab: a\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:8>{@ab}
    >*@value C1
     >*brace_container C1
      >{flagab}
   >macro_expansion<start;1><p:8>
    >*macro_call@ab
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:1>
   >value_expansion<end;1><p:1>
';


$result_texis{'macro_in_value'} = '@macro ab
a

b
@end macro

@set flagab @ab

flagab: a

b
';


$result_texts{'macro_in_value'} = '

flagab: a

b
';

$result_errors{'macro_in_value'} = '';

$result_nodes_list{'macro_in_value'} = '';

$result_sections_list{'macro_in_value'} = '';

$result_sectioning_root{'macro_in_value'} = '';

$result_headings_list{'macro_in_value'} = '';

1;
