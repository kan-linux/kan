use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_argument'} = '*document_root C1
 *before_node_section C7
  *@macro C3 l1
  |EXTRA
  |invalid_syntax:{1}
   *arguments_line C1
    {macro_line:\\n}
   {raw:in macro\\n}
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
  *@rmacro C3 l5
  |EXTRA
  |invalid_syntax:{1}
  |macro_name:{abar}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: abar aaa\\n}
   {raw:in\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{rmacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rmacro}
  {empty_line:\\n}
  *@macro C3 l9
  |EXTRA
  |invalid_syntax:{1}
  |macro_name:{aftername}
  |misc_args:A{ggg}
   *arguments_line C1
    {macro_line: aftername {ggg} more  \\n}
   {raw:in macro\\n}
   *@end C1 l11
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
  *@macro C3 l13
  |EXTRA
  |invalid_syntax:{1}
   *arguments_line C1
    {macro_line: #badname\\n}
   {raw:in #\\n}
   *@end C1 l15
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
';


$result_texis{'bad_argument'} = '@macro
in macro
@end macro

@rmacro abar aaa
in
@end rmacro

@macro aftername {ggg} more  
in macro
@end macro

@macro #badname
in #
@end macro
';


$result_texts{'bad_argument'} = '


';

$result_errors{'bad_argument'} = '* E l1|@macro requires a name
 @macro requires a name

* E l5|bad syntax for @rmacro argument: aaa
 bad syntax for @rmacro argument: aaa

* E l9|bad syntax for @macro argument: more  
 bad syntax for @macro argument: more  

* E l13|@macro requires a name
 @macro requires a name

';

$result_nodes_list{'bad_argument'} = '';

$result_sections_list{'bad_argument'} = '';

$result_sectioning_root{'bad_argument'} = '';

$result_headings_list{'bad_argument'} = '';

1;
