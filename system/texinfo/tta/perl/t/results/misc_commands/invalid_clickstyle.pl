use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_clickstyle'} = '*document_root C1
 *before_node_section C12
  {empty_line:\\n}
  *@clickstyle C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{@result}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@result on the same line}
  {empty_line:\\n}
  *paragraph C3
   {A }
   *@result C1 l4
   |INFO
   |alias_of:{click}
    *brace_container
   { (result on the same line).\\n}
  {empty_line:\\n}
  *@clickstyle C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{@nocmd}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@nocmd}
  {empty_line:\\n}
  *paragraph C1
   {A  (nocmd).\\n}
  {empty_line:\\n}
  *@clickstyle C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:something}
  {empty_line:\\n}
  *paragraph C1
   {A  (something).\\n}
';


$result_texis{'invalid_clickstyle'} = '
@clickstyle @result on the same line

A @result{} (result on the same line).

@clickstyle @nocmd

A  (nocmd).

@clickstyle something

A  (something).
';


$result_texts{'invalid_clickstyle'} = '

A => (result on the same line).


A  (nocmd).


A  (something).
';

$result_errors{'invalid_clickstyle'} = '* W l2|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l2|remaining argument on @clickstyle line: on the same line
 warning: remaining argument on @clickstyle line: on the same line

* W l6|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* E l8|unknown command `nocmd\'
 unknown command `nocmd\'

* E l8|misplaced {
 misplaced {

* E l8|misplaced }
 misplaced }

* W l10|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* E l10|@clickstyle should only accept an @-command as argument, not ` something
\'
 @clickstyle should only accept an @-command as argument, not ` something
\'

* E l12|unknown command `nocmd\'
 unknown command `nocmd\'

* E l12|misplaced {
 misplaced {

* E l12|misplaced }
 misplaced }

';

$result_nodes_list{'invalid_clickstyle'} = '';

$result_sections_list{'invalid_clickstyle'} = '';

$result_sectioning_root{'invalid_clickstyle'} = '';

$result_headings_list{'invalid_clickstyle'} = '';

1;
