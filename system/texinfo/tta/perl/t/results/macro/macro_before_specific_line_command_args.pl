use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_before_specific_line_command_args'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{cpfn}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: cpfn\\n}
   {raw: cp fn\\n}
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
  *@syncodeindex C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   |>SOURCEMARKS
   |>macro_expansion<start;1>
    |>*macro_call@cpfn C1
     |>*brace_arg
  |EXTRA
  |misc_args:A{cp|fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp fn}
    >SOURCEMARKS
    >macro_expansion<end;1><p:5>
';


$result_texis{'macro_before_specific_line_command_args'} = '@macro cpfn
 cp fn
@end macro

@syncodeindex cp fn
';


$result_texts{'macro_before_specific_line_command_args'} = '
';

$result_errors{'macro_before_specific_line_command_args'} = '';

$result_indices{'macro_before_specific_line_command_args'} = 'cp C ->fn
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'macro_before_specific_line_command_args'} = '';

$result_sections_list{'macro_before_specific_line_command_args'} = '';

$result_sectioning_root{'macro_before_specific_line_command_args'} = '';

$result_headings_list{'macro_before_specific_line_command_args'} = '';

1;
