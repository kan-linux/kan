use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'line_end_accent_command_macro_call'} = '*document_root C1
 *before_node_section C12
  *@macro C3 l1
  |EXTRA
  |macro_name:{expand}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: expand {}\\n}
   {raw:@center A @ringaccent \\n}
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
   >*macro_call@expand C1
    >*brace_arg
  *@center C1 l5:@expand
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A }
    *@ringaccent l5:@expand
    |INFO
    |spaces_after_cmd_before_arg:
     |{spaces_after_cmd_before_arg: }
     |>SOURCEMARKS
     |>macro_expansion<end;1><p:1>
  {spaces_before_paragraph: }
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *@macro C3 l8
  |EXTRA
  |macro_name:{nospace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: nospace {}\\n}
   {raw:@center B @ringaccent\\n}
   *@end C1 l10
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
  >macro_expansion<start;2><p:1>
   >*macro_call@nospace C1
    >*brace_arg
  *@center C1 l12:@nospace
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {B }
    *@ringaccent l12:@nospace
    |INFO
    |spaces_after_cmd_before_arg:
     |{spaces_after_cmd_before_arg:}
     |>SOURCEMARKS
     |>macro_expansion<end;2>
  {spaces_before_paragraph: }
  *paragraph C1
   {A\\n}
  {empty_line:\\n}
';


$result_texis{'line_end_accent_command_macro_call'} = '@macro expand {}
@center A @ringaccent 
@end macro

@center A @ringaccent 
 a

@macro nospace {}
@center B @ringaccent
@end macro

@center B @ringaccent
 A

';


$result_texts{'line_end_accent_command_macro_call'} = '
A *
a


B *
A

';

$result_errors{'line_end_accent_command_macro_call'} = '* W l5|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l12|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

';

$result_nodes_list{'line_end_accent_command_macro_call'} = '';

$result_sections_list{'line_end_accent_command_macro_call'} = '';

$result_sectioning_root{'line_end_accent_command_macro_call'} = '';

$result_headings_list{'line_end_accent_command_macro_call'} = '';

1;
