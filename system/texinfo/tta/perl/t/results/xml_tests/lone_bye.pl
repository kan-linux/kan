use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'lone_bye'} = '*document_root C2
 *before_node_section
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'lone_bye'} = '@bye
';


$result_texts{'lone_bye'} = '';

$result_errors{'lone_bye'} = '';

$result_nodes_list{'lone_bye'} = '';

$result_sections_list{'lone_bye'} = '';

$result_sectioning_root{'lone_bye'} = '';

$result_headings_list{'lone_bye'} = '';


$result_converted{'xml'}->{'lone_bye'} = '<bye></bye>
';

1;
