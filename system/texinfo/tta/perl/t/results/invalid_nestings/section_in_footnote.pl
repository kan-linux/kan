use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_in_footnote'} = '*document_root C2
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C2
   {Text}
   *@footnote C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
    *brace_command_context C1
     {empty_line:\\n}
 *@section C1 l4 {a section}
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
    {a section}
';


$result_texis{'section_in_footnote'} = '
Text@footnote{

}@section a section
';


$result_texts{'section_in_footnote'} = '
Text1 a section
===========
';

$result_errors{'section_in_footnote'} = '* E l2|@section seen before @footnote closing brace
 @section seen before @footnote closing brace

';

$result_nodes_list{'section_in_footnote'} = '';

$result_sections_list{'section_in_footnote'} = '1|a section
';

$result_sectioning_root{'section_in_footnote'} = 'level: 1
list:
 1|a section
';

$result_headings_list{'section_in_footnote'} = '';

1;
