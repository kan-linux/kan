use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_for_ignored_line_command'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{pagemacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: pagemacro\\n}
   {raw:@page\\n}
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@pagemacro C1
    >*brace_arg
  *@page C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   |>SOURCEMARKS
   |>macro_expansion<end;1>
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:on the line}
';


$result_texis{'macro_for_ignored_line_command'} = '@macro pagemacro
@page
@end macro

@page on the line
';


$result_texts{'macro_for_ignored_line_command'} = '

';

$result_errors{'macro_for_ignored_line_command'} = '* W l5:@pagemacro|remaining argument on @page line: on the line
 warning: remaining argument on @page line: on the line (possibly involving @pagemacro)

';

$result_nodes_list{'macro_for_ignored_line_command'} = '';

$result_sections_list{'macro_for_ignored_line_command'} = '';

$result_sectioning_root{'macro_for_ignored_line_command'} = '';

$result_headings_list{'macro_for_ignored_line_command'} = '';

1;
