use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_after_paragraph'} = '*document_root C1
 *before_node_section C5
  *@macro C4 l1
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: mymacro\\n}
   {raw:\\n}
   {raw:after end of line\\n}
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
  *paragraph C1
   {In text.\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call@mymacro C1
    >*brace_arg
  *paragraph C1
   {after end of line\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:17>
';


$result_texis{'macro_after_paragraph'} = '@macro mymacro

after end of line
@end macro

In text.

after end of line
';


$result_texts{'macro_after_paragraph'} = '
In text.

after end of line
';

$result_errors{'macro_after_paragraph'} = '';

$result_nodes_list{'macro_after_paragraph'} = '';

$result_sections_list{'macro_after_paragraph'} = '';

$result_sectioning_root{'macro_after_paragraph'} = '';

$result_headings_list{'macro_after_paragraph'} = '';

1;
