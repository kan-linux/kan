use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_on_float_line'} = '*document_root C2
 *before_node_section C1
  *@float C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{t}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{l}
   *arguments_line C2
    *block_line_arg C1
     {t}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {l}
 *@section C1 l1 {first}
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
';


$result_texis{'section_on_float_line'} = '@float t, l @section first
';


$result_texts{'section_on_float_line'} = 't, l
1 first
=======
';

$result_errors{'section_on_float_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @float line
 warning: @section should not appear on @float line

* E l1|@section seen before @end float
 @section seen before @end float

';

$result_floats{'section_on_float_line'} = 't: 1
 F1: {l}
';

$result_nodes_list{'section_on_float_line'} = '';

$result_sections_list{'section_on_float_line'} = '1|first
';

$result_sectioning_root{'section_on_float_line'} = 'level: 1
list:
 1|first
';

$result_headings_list{'section_on_float_line'} = '';


$result_converted{'plaintext'}->{'section_on_float_line'} = 't 1

1 first
=======

';


$result_converted{'xml'}->{'section_on_float_line'} = '<float identifier="l" type="t" number="1" spaces=" "><floattype>t</floattype><floatname spaces=" ">l </floatname>
</float>
<section spaces=" "><sectiontitle>first</sectiontitle>
</section>
';

1;
