use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'texinfo_command_alias_indirect'} = '*document_root C1
 *before_node_section C7
  *@macro C3 l1
  |EXTRA
  |macro_name:{mystrong}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: mystrong {arg}\\n}
   {raw:!!\\arg\\!!\\n}
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
  *@alias C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{strong|mystrong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {strong = mystrong}
  {empty_line:\\n}
  *@alias C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{new|strong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new = strong}
  {empty_line:\\n}
  *paragraph C1
   {!!aa!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mystrong C1
    >|INFO
    >|alias_of:{new}
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;1><p:6>
';


$result_texis{'texinfo_command_alias_indirect'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias strong = mystrong

@alias new = strong

!!aa!!
';


$result_texts{'texinfo_command_alias_indirect'} = '


!!aa!!
';

$result_errors{'texinfo_command_alias_indirect'} = '';

$result_nodes_list{'texinfo_command_alias_indirect'} = '';

$result_sections_list{'texinfo_command_alias_indirect'} = '';

$result_sectioning_root{'texinfo_command_alias_indirect'} = '';

$result_headings_list{'texinfo_command_alias_indirect'} = '';


$result_converted{'plaintext'}->{'texinfo_command_alias_indirect'} = '!!aa!!
';

1;
