use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_on_xtable_line'} = '*document_root C5
 *before_node_section C1
  *@vtable C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
 *@section C3 l1 {first}
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
    {first}
  {empty_line:\\n}
  *@table C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@TeX l3
 *@section C3 l3 {second}
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
    {second}
  {empty_line:\\n}
  *@table C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@code l5
 *@section C3 l5 {third}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {third}
  {empty_line:\\n}
  *@ftable C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
     *@ringaccent l7
     |INFO
     |spaces_after_cmd_before_arg:
      |{spaces_after_cmd_before_arg: }
 *@section C1 l7 {fourth}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fourth}
';


$result_texis{'section_on_xtable_line'} = '@vtable @section first

@table @TeX @section second

@table @code @section third

@ftable @ringaccent @section fourth
';


$result_texts{'section_on_xtable_line'} = '1 first
=======

2 second
========

3 third
=======

4 fourth
========
';

$result_errors{'section_on_xtable_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @vtable line
 warning: @section should not appear on @vtable line

* E l1|missing @vtable argument
 missing @vtable argument

* E l1|@section seen before @end vtable
 @section seen before @end vtable

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l3|@section should not appear on @table line
 warning: @section should not appear on @table line

* E l3|command @TeX not accepting argument in brace should not be on @table line
 command @TeX not accepting argument in brace should not be on @table line

* E l3|@section seen before @end table
 @section seen before @end table

* W l5|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l5|@section should not appear on @table line
 warning: @section should not appear on @table line

* E l5|@section seen before @end table
 @section seen before @end table

* E l7|@ringaccent expected braces
 @ringaccent expected braces

* W l7|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l7|@section should not appear on @ftable line
 warning: @section should not appear on @ftable line

* E l7|bad argument to @ftable: @ringaccent 
 bad argument to @ftable: @ringaccent 

* E l7|@section seen before @end ftable
 @section seen before @end ftable

';

$result_nodes_list{'section_on_xtable_line'} = '';

$result_sections_list{'section_on_xtable_line'} = '1|first
 section_directions:
  next->second
 toplevel_directions:
  next->second
2|second
 section_directions:
  next->third
  prev->first
 toplevel_directions:
  next->third
  prev->first
3|third
 section_directions:
  next->fourth
  prev->second
 toplevel_directions:
  next->fourth
  prev->second
4|fourth
 section_directions:
  prev->third
 toplevel_directions:
  prev->third
';

$result_sectioning_root{'section_on_xtable_line'} = 'level: 1
list:
 1|first
 2|second
 3|third
 4|fourth
';

$result_headings_list{'section_on_xtable_line'} = '';


$result_converted{'plaintext'}->{'section_on_xtable_line'} = '1 first
=======

2 second
========

3 third
=======

4 fourth
========

';


$result_converted{'xml'}->{'section_on_xtable_line'} = '<vtable spaces=" ">
</vtable>
<section spaces=" "><sectiontitle>first</sectiontitle>

<table spaces=" "> 
</table>
</section>
<section spaces=" "><sectiontitle>second</sectiontitle>

<table commandarg="code" spaces=" "> 
</table>
</section>
<section spaces=" "><sectiontitle>third</sectiontitle>

<ftable spaces=" ">
</ftable>
</section>
<section spaces=" "><sectiontitle>fourth</sectiontitle>
</section>
';

1;
