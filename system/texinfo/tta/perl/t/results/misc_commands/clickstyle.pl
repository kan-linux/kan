use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'clickstyle'} = '*document_root C1
 *before_node_section C8
  *@clickstyle C1 l1
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
    {rawline_text:@result}
  {empty_line:\\n}
  *paragraph C3
   {A }
   *@result C1 l3
   |INFO
   |alias_of:{click}
    *brace_container
   { (result).\\n}
  {empty_line:\\n}
  *@clickstyle C1 l5
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{@equiv}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@equiv}
  {empty_line:\\n}
  *paragraph C3
   {A }
   *@equiv C1 l7
   |INFO
   |alias_of:{click}
    *brace_container
   { (equiv no space)\\n}
  {empty_line:\\n}
';


$result_texis{'clickstyle'} = '@clickstyle @result

A @result{} (result).

@clickstyle@equiv

A @equiv{} (equiv no space)

';


$result_texts{'clickstyle'} = '
A => (result).


A == (equiv no space)

';

$result_errors{'clickstyle'} = '* W l1|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l5|@clickstyle is obsolete
 warning: @clickstyle is obsolete

';

$result_nodes_list{'clickstyle'} = '';

$result_sections_list{'clickstyle'} = '';

$result_sectioning_root{'clickstyle'} = '';

$result_headings_list{'clickstyle'} = '';

1;
