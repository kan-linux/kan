use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sections'} = '*document_root C2
 *before_node_section
 *@chapter C1 l1 {a chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a chapter}
';


$result_texis{'sections'} = '@chapter a chapter
';


$result_texts{'sections'} = '1 a chapter
***********
';

$result_errors{'sections'} = '';

$result_nodes_list{'sections'} = '';

$result_sections_list{'sections'} = '1|a chapter
';

$result_sectioning_root{'sections'} = 'level: 0
list:
 1|a chapter
';

$result_headings_list{'sections'} = '';

1;
