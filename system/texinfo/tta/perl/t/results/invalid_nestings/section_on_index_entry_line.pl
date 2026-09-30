use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_on_index_entry_line'} = '*document_root C2
 *before_node_section C1
  *index_entry_command@cindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {a}
 *@section C3 l1 {b}
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
    {b}
  {empty_line:\\n}
  *paragraph C1
   {Somethin\\n}
';


$result_texis{'section_on_index_entry_line'} = '@cindex a @section b

Somethin
';


$result_texts{'section_on_index_entry_line'} = '1 b
===

Somethin
';

$result_errors{'section_on_index_entry_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @cindex line
 warning: @section should not appear on @cindex line

* W l1|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'section_on_index_entry_line'} = '';

$result_sections_list{'section_on_index_entry_line'} = '1|b
';

$result_sectioning_root{'section_on_index_entry_line'} = 'level: 1
list:
 1|b
';

$result_headings_list{'section_on_index_entry_line'} = '';

$result_indices_sort_strings{'section_on_index_entry_line'} = 'cp:
 a
';

1;
