use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_with_arobase_in_macro_call'} = '*document_root C1
 *before_node_section C3
  *@macro C4 l1
  |EXTRA
  |macro_name:{showarg}
  |misc_args:A{a|b}
   *arguments_line C1
    {macro_line: showarg {a, b}\\n}
   {raw:first: \\a\\\\n}
   {raw:second: \\b\\\\n}
   *@end C1 l4
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
  *paragraph C6
   {first: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@showarg C2
     >*brace_arg C1
      >{macro_call_arg_text:@verb{, commas ,}}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@verb{@ arobase @}}
   *@verb C1 l6:@showarg
   |INFO
   |delimiter:{,}
    *brace_container C1
     {raw: commas }
   {\\n}
   {second: }
   *@verb C1 l6:@showarg
   |INFO
   |delimiter:{@}
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C1
     {raw: arobase }
   {\\n}
';


$result_texis{'verb_with_arobase_in_macro_call'} = '@macro showarg {a, b}
first: \\a\\
second: \\b\\
@end macro

first: @verb{, commas ,}
second: @verb{@ arobase @}
';


$result_texts{'verb_with_arobase_in_macro_call'} = '
first:  commas 
second:  arobase 
';

$result_errors{'verb_with_arobase_in_macro_call'} = '';

$result_nodes_list{'verb_with_arobase_in_macro_call'} = '';

$result_sections_list{'verb_with_arobase_in_macro_call'} = '';

$result_sectioning_root{'verb_with_arobase_in_macro_call'} = '';

$result_headings_list{'verb_with_arobase_in_macro_call'} = '';

1;
