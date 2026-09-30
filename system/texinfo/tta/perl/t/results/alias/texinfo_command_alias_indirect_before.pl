use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'texinfo_command_alias_indirect_before'} = '*document_root C1
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
  |misc_args:A{new|strong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new = strong}
  {empty_line:\\n}
  *@alias C1 l7
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
  *paragraph C2
   *@strong C1 l9
   |INFO
   |alias_of:{new}
    *brace_container C1
     {aa}
   {\\n}
';


$result_texis{'texinfo_command_alias_indirect_before'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias new = strong

@alias strong = mystrong

@strong{aa}
';


$result_texts{'texinfo_command_alias_indirect_before'} = '


aa
';

$result_errors{'texinfo_command_alias_indirect_before'} = '';

$result_nodes_list{'texinfo_command_alias_indirect_before'} = '';

$result_sections_list{'texinfo_command_alias_indirect_before'} = '';

$result_sectioning_root{'texinfo_command_alias_indirect_before'} = '';

$result_headings_list{'texinfo_command_alias_indirect_before'} = '';


$result_converted{'plaintext'}->{'texinfo_command_alias_indirect_before'} = '*aa*
';

1;
