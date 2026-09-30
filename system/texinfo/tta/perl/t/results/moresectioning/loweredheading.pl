use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'loweredheading'} = '*document_root C3
 *before_node_section C1
  *@lowersections C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
 *@section C2 l2 {Foo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |level_modifier:{-1}
 |section_heading_number:{1}
 |section_level:{3}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Foo}
  *@heading C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
  |level_modifier:{-1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Bar}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'loweredheading'} = '@lowersections
@section Foo
@heading Bar
@bye
';


$result_texts{'loweredheading'} = '1 Foo
-----
Bar
---
';

$result_errors{'loweredheading'} = '';

$result_nodes_list{'loweredheading'} = '';

$result_sections_list{'loweredheading'} = '1|Foo
';

$result_sectioning_root{'loweredheading'} = 'level: 2
list:
 1|Foo
';

$result_headings_list{'loweredheading'} = '1|Bar
';

1;
