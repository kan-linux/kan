use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'texinfo_command_alias'} = '*document_root C1
 *before_node_section C10
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
  *paragraph C1
   {!!aa!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mystrong C1
    >|INFO
    >|alias_of:{strong}
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
  *@definfoenclose C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{mystrong|;|:}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {mystrong,;,:}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@mystrong C1 l11
   |INFO
   |alias_of:{strong}
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {bb}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'texinfo_command_alias'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias strong = mystrong

!!aa!!

@definfoenclose mystrong,;,:

@mystrong{bb}

';


$result_texts{'texinfo_command_alias'} = '

!!aa!!


bb

';

$result_errors{'texinfo_command_alias'} = '* W l9|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'texinfo_command_alias'} = '';

$result_sections_list{'texinfo_command_alias'} = '';

$result_sectioning_root{'texinfo_command_alias'} = '';

$result_headings_list{'texinfo_command_alias'} = '';


$result_converted{'plaintext'}->{'texinfo_command_alias'} = '!!aa!!

   ;bb:

';

1;
