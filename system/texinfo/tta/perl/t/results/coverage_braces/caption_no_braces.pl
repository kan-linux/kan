use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'caption_no_braces'} = '*document_root C1
 *before_node_section C1
  *@caption l1
';


$result_texis{'caption_no_braces'} = '@caption';


$result_texts{'caption_no_braces'} = '';

$result_errors{'caption_no_braces'} = '* E l1|@caption expected braces
 @caption expected braces

';

$result_nodes_list{'caption_no_braces'} = '';

$result_sections_list{'caption_no_braces'} = '';

$result_sectioning_root{'caption_no_braces'} = '';

$result_headings_list{'caption_no_braces'} = '';


$result_converted{'plaintext'}->{'caption_no_braces'} = '';


$result_converted{'html_text'}->{'caption_no_braces'} = '';


$result_converted{'latex_text'}->{'caption_no_braces'} = '';


$result_converted{'docbook'}->{'caption_no_braces'} = '';

1;
