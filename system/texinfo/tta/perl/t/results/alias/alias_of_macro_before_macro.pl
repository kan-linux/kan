use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'alias_of_macro_before_macro'} = '*document_root C1
 *before_node_section C5
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{new|mymacro}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new = mymacro}
  {empty_line:\\n}
  *@macro C3 l3
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{thearg}
   *arguments_line C1
    {macro_line: mymacro {thearg}\\n}
   {raw:||\\thearg||\\n}
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
  *paragraph C1
   {||thearg||\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C1
    >|INFO
    >|alias_of:{new}
     >*brace_arg C1
      >{macro_call_arg_text:tt}
   >macro_expansion<end;1><p:10>
';


$result_texis{'alias_of_macro_before_macro'} = '@alias new = mymacro

@macro mymacro {thearg}
||\\thearg||
@end macro

||thearg||
';


$result_texts{'alias_of_macro_before_macro'} = '

||thearg||
';

$result_errors{'alias_of_macro_before_macro'} = '';

$result_nodes_list{'alias_of_macro_before_macro'} = '';

$result_sections_list{'alias_of_macro_before_macro'} = '';

$result_sectioning_root{'alias_of_macro_before_macro'} = '';

$result_headings_list{'alias_of_macro_before_macro'} = '';

1;
