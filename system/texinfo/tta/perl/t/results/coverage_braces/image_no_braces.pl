use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_no_braces'} = '*document_root C1
 *before_node_section C1
  *@image l1
  |INFO
  |spaces_after_cmd_before_arg:
   |{spaces_after_cmd_before_arg: }
';


$result_texis{'image_no_braces'} = '@image ';


$result_texts{'image_no_braces'} = '';

$result_errors{'image_no_braces'} = '* E l1|@image expected braces
 @image expected braces

';

$result_nodes_list{'image_no_braces'} = '';

$result_sections_list{'image_no_braces'} = '';

$result_sectioning_root{'image_no_braces'} = '';

$result_headings_list{'image_no_braces'} = '';


$result_converted{'plaintext'}->{'image_no_braces'} = '';


$result_converted{'html_text'}->{'image_no_braces'} = '';


$result_converted{'latex_text'}->{'image_no_braces'} = '';


$result_converted{'docbook'}->{'image_no_braces'} = '';

1;
