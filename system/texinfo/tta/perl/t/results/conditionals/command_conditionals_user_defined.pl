use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_conditionals_user_defined'} = '*document_root C1
 *before_node_section C15
  *@macro C3 l1
  |EXTRA
  |macro_name:{truc}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: truc\\n}
   {raw:machin\\n}
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
  *@defindex C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{auth}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {auth}
  {empty_line:\\n}
  *@definfoenclose C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{infoencl|:|:}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {infoencl, :,:}
  {empty_line:\\n}
  *@alias C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{strongalias|strong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {strongalias = strong}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifcommanddefined C1 l11
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{truc}
  *paragraph C2
   *@@
   {macro truc is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:23>
    >*@end C1 l13
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
   >ignored_conditional_block<1><p:23>
    >*@ifcommandnotdefined C3 l14
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*arguments_line C1
      >*block_line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{truc}
     >{raw:@@macro truc is wrongly not defined\\n}
     >*@end C1 l16
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifcommandnotdefined}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*@ifcommanddefined C1 l18
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{authindex}
  *paragraph C3
   {index command }
   *@@
   {authindex is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:22>
    >*@end C1 l20
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
   >ignored_conditional_block<2><p:22>
    >*@ifcommandnotdefined C3 l21
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*arguments_line C1
      >*block_line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{authindex}
     >{raw:index command @@authindex is wrongly not defined\\n}
     >*@end C1 l23
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifcommandnotdefined}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*@ifcommanddefined C1 l25
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{infoencl}
  *paragraph C3
   {definfoenclose }
   *@@
   {infoencl is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:21>
    >*@end C1 l27
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
   >ignored_conditional_block<3><p:21>
    >*@ifcommandnotdefined C3 l28
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*arguments_line C1
      >*block_line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{infoencl}
     >{raw:definfoenclose @@infoencl is wrongly not defined\\n}
     >*@end C1 l30
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifcommandnotdefined}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;4><p:1>
   >*@ifcommanddefined C1 l32
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{strongalias}
  *paragraph C3
   {strongalias }
   *@@
   {alias is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:18>
    >*@end C1 l34
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
   >ignored_conditional_block<4><p:18>
    >*@ifcommandnotdefined C3 l35
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*arguments_line C1
      >*block_line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{strongalias}
     >{raw:strongalias @@alias is wrongly not defined\\n}
     >*@end C1 l37
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifcommandnotdefined}
';


$result_texis{'command_conditionals_user_defined'} = '@macro truc
machin
@end macro

@defindex auth

@definfoenclose infoencl, :,:

@alias strongalias = strong

@@macro truc is defined.

index command @@authindex is defined.

definfoenclose @@infoencl is defined.

strongalias @@alias is defined.
';


$result_texts{'command_conditionals_user_defined'} = '



@macro truc is defined.

index command @authindex is defined.

definfoenclose @infoencl is defined.

strongalias @alias is defined.
';

$result_errors{'command_conditionals_user_defined'} = '* W l7|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_indices{'command_conditionals_user_defined'} = 'auth
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'command_conditionals_user_defined'} = '';

$result_sections_list{'command_conditionals_user_defined'} = '';

$result_sectioning_root{'command_conditionals_user_defined'} = '';

$result_headings_list{'command_conditionals_user_defined'} = '';

1;
