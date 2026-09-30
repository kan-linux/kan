use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'defcondx_Dbar'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C5
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:test def*x in a conditional}
   {empty_line:\\n}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:set this from the command line.}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:set bar}
   {empty_line:\\n}
 *@top C4 defxcond.texi:l8 {deffnx inside conditional}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {deffnx inside conditional}
  {empty_line:\\n}
  *@deffn C5 defxcond.texi:l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 defxcond.texi:l10
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {foo}
   *inter_def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >expanded_conditional_command<start;1><p:1>
     >*@ifset C1 defxcond.texi:l12
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*arguments_line C1
       >*block_line_arg C1
       >|INFO
       >|spaces_after_argument:
        >|{spaces_after_argument:\\n}
        >{bar}
   *@deffnx C1 defxcond.texi:l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*@end C1 defxcond.texi:l14
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {bar}
   *def_item C3
    {empty_line:\\n}
    *paragraph C1
     {Documentation.\\n}
    {empty_line:\\n}
   *@end C1 defxcond.texi:l18
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'defcondx_Dbar'} = '\\input texinfo

@c test def*x in a conditional

@c set this from the command line.
@c set bar

@top deffnx inside conditional

@deffn foo

@deffnx bar

Documentation.

@end deffn

@bye
';


$result_texts{'defcondx_Dbar'} = '

deffnx inside conditional
*************************

foo: 

bar: 

Documentation.


';

$result_errors{'defcondx_Dbar'} = '* W defxcond.texi:l10|missing name for @deffn
 warning: missing name for @deffn

* W defxcond.texi:l13|missing name for @deffnx
 warning: missing name for @deffnx

';

$result_nodes_list{'defcondx_Dbar'} = '';

$result_sections_list{'defcondx_Dbar'} = '1|deffnx inside conditional
';

$result_sectioning_root{'defcondx_Dbar'} = 'level: -1
list:
 1|deffnx inside conditional
';

$result_headings_list{'defcondx_Dbar'} = '';

1;
