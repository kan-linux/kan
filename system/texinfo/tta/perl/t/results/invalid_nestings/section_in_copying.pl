use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_in_copying'} = '*document_root C2
 *before_node_section C1
  *@copying C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {in copying\\n}
   {empty_line:\\n}
 *@section C1 l5 {section}
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
    {section}
';


$result_texis{'section_in_copying'} = '@copying

in copying

@section section
';


$result_texts{'section_in_copying'} = '1 section
=========
';

$result_errors{'section_in_copying'} = '* E l5|@section seen before @end copying
 @section seen before @end copying

';

$result_nodes_list{'section_in_copying'} = '';

$result_sections_list{'section_in_copying'} = '1|section
';

$result_sectioning_root{'section_in_copying'} = 'level: 1
list:
 1|section
';

$result_headings_list{'section_in_copying'} = '';

1;
