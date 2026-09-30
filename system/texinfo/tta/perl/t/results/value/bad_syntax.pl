use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_syntax'} = '*document_root C1
 *before_node_section C16
  {empty_line:\\n}
  *@set C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *@set C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:?}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text::-/ hey!}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:a@b}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text::-" bad}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:} no}
  {empty_line:\\n}
  *@clear C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:aaa ggg}
  *@clear C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:and{other}
  {empty_line:\\n}
  *paragraph C1
   {gurgl\\n}
  {empty_line:\\n}
  *@value C1
   *brace_container C1
    {unknown}
  {\\n}
';


$result_texis{'bad_syntax'} = '
@set
@set 
@set ?
@set :-/ hey!
@set a@b
@set :-" bad
@set } no

@clear aaa ggg
@clear and{other

gurgl

@value{unknown}
';


$result_texts{'bad_syntax'} = '


gurgl

unknown
';

$result_errors{'bad_syntax'} = '* E l2|@set requires a name
 @set requires a name

* E l3|@set requires a name
 @set requires a name

* E l4|bad name for @set
 bad name for @set

* E l5|bad name for @set
 bad name for @set

* E l6|bad name for @set
 bad name for @set

* E l7|bad name for @set
 bad name for @set

* E l8|bad name for @set
 bad name for @set

* E l10|bad name for @clear
 bad name for @clear

* E l11|bad name for @clear
 bad name for @clear

* E l13|bad syntax for @value
 bad syntax for @value

* E l13|misplaced {
 misplaced {

* W l15|undefined flag: unknown
 warning: undefined flag: unknown

';

$result_nodes_list{'bad_syntax'} = '';

$result_sections_list{'bad_syntax'} = '';

$result_sectioning_root{'bad_syntax'} = '';

$result_headings_list{'bad_syntax'} = '';

1;
