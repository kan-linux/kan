use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unnumbered_no_argument'} = '*document_root C2
 *before_node_section
 *@unnumbered C1 l1
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'unnumbered_no_argument'} = '@unnumbered
';


$result_texts{'unnumbered_no_argument'} = '';

$result_errors{'unnumbered_no_argument'} = '* W l1|@unnumbered missing argument
 warning: @unnumbered missing argument

';

$result_nodes_list{'unnumbered_no_argument'} = '';

$result_sections_list{'unnumbered_no_argument'} = '1
';

$result_sectioning_root{'unnumbered_no_argument'} = 'level: 0
list:
 1|
';

$result_headings_list{'unnumbered_no_argument'} = '';

1;
