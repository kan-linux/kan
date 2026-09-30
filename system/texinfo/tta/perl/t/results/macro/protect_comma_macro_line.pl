use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_comma_macro_line'} = '*document_root C1
 *before_node_section C5
  *@macro C6 l1
  |EXTRA
  |macro_name:{macrotwo}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: macrotwo { arg }\\n}
   {raw:we get \\arg\\ and another \\arg\\\\n}
   {raw:and another one on another line \\arg\\\\n}
   {raw:\\n}
   {raw:and a last in another paragraph\\n}
   *@end C1 l6
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
   {we get arg,  comma \\, and another arg,  comma \\,\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call_line@macrotwo C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument:  }
     >*line_arg C1
      >{arg,  comma \\,}
   {and another one on another line arg,  comma \\,\\n}
  {empty_line:\\n}
  *paragraph C1
   {and a last in another paragraph\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:31>
';


$result_texis{'protect_comma_macro_line'} = '@macro macrotwo { arg }
we get \\arg\\ and another \\arg\\
and another one on another line \\arg\\

and a last in another paragraph
@end macro

we get arg,  comma \\, and another arg,  comma \\,
and another one on another line arg,  comma \\,

and a last in another paragraph
';


$result_texts{'protect_comma_macro_line'} = '
we get arg,  comma \\, and another arg,  comma \\,
and another one on another line arg,  comma \\,

and a last in another paragraph
';

$result_errors{'protect_comma_macro_line'} = '';

$result_nodes_list{'protect_comma_macro_line'} = '';

$result_sections_list{'protect_comma_macro_line'} = '';

$result_sectioning_root{'protect_comma_macro_line'} = '';

$result_headings_list{'protect_comma_macro_line'} = '';

1;
