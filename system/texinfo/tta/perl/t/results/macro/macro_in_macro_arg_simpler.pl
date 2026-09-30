use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_macro_arg_simpler'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{macrooneone}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: macrooneone\\n}
   {raw:a, macro2\\n}
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
  *@macro C4 l5
  |EXTRA
  |macro_name:{macrothree}
  |misc_args:A{text|arg}
   *arguments_line C1
    {macro_line: macrothree{text, arg}\\n}
   {raw:\\text\\\\n}
   {raw:&&&& \\arg\\\\n}
   *@end C1 l8
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
  *paragraph C2
   {a, macro2text for macro2\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@macrothree C1
     >*brace_arg C1
      >{macro_call_arg_text:@macrooneone{}text for macro2}
   >macro_expansion<start;2>
    >*macro_call@macrooneone C1
     >*brace_arg
   >macro_expansion<end;2><p:9>
   {&&&& \\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:5>
';


$result_texis{'macro_in_macro_arg_simpler'} = '@macro macrooneone
a, macro2
@end macro

@macro macrothree{text, arg}
\\text\\
&&&& \\arg\\
@end macro

a, macro2text for macro2
&&&& 
';


$result_texts{'macro_in_macro_arg_simpler'} = '

a, macro2text for macro2
&&&& 
';

$result_errors{'macro_in_macro_arg_simpler'} = '';

$result_nodes_list{'macro_in_macro_arg_simpler'} = '';

$result_sections_list{'macro_in_macro_arg_simpler'} = '';

$result_sectioning_root{'macro_in_macro_arg_simpler'} = '';

$result_headings_list{'macro_in_macro_arg_simpler'} = '';

1;
