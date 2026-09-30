use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_in_math'} = '*document_root C3
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C2
   {Some }
   *@math C1 l2
    *brace_command_context C2
     {aa }
     *balanced_braces C3 l2
      {{x^2\\n}
      {empty_line:\\n}
      {}}
 *@section C3 l4 {sec1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec1}
  {empty_line:\\n}
  *paragraph C2
   {More }
   *@math C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C2
     {in math\\n}
     {empty_line:\\n}
 *@section C1 l8 {sec2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec2}
';


$result_texis{'section_in_math'} = '
Some @math{aa {x^2

}}@section sec1

More @math{ in math

}@section sec2
';


$result_texts{'section_in_math'} = '
Some aa {x^2

}1 sec1
======

More in math

2 sec2
======
';

$result_errors{'section_in_math'} = '* W l4|@section should not appear anywhere inside @math
 warning: @section should not appear anywhere inside @math

* E l2|misplaced {
 misplaced {

* E l2|@section seen before @math closing brace
 @section seen before @math closing brace

* W l8|@section should not appear anywhere inside @math
 warning: @section should not appear anywhere inside @math

* E l6|@section seen before @math closing brace
 @section seen before @math closing brace

';

$result_nodes_list{'section_in_math'} = '';

$result_sections_list{'section_in_math'} = '1|sec1
 section_directions:
  next->sec2
 toplevel_directions:
  next->sec2
2|sec2
 section_directions:
  prev->sec1
 toplevel_directions:
  prev->sec1
';

$result_sectioning_root{'section_in_math'} = 'level: 1
list:
 1|sec1
 2|sec2
';

$result_headings_list{'section_in_math'} = '';

1;
