use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bye'} = '*document_root C2
 *before_node_section
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'bye'} = '@bye
';


$result_texts{'bye'} = '';

$result_errors{'bye'} = '';

$result_nodes_list{'bye'} = '';

$result_sections_list{'bye'} = '';

$result_sectioning_root{'bye'} = '';

$result_headings_list{'bye'} = '';

1;
