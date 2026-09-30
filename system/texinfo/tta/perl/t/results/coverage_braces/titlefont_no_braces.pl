use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'titlefont_no_braces'} = '*document_root C1
 *before_node_section C1
  *@titlefont l1
';


$result_texis{'titlefont_no_braces'} = '@titlefont';


$result_texts{'titlefont_no_braces'} = '';

$result_errors{'titlefont_no_braces'} = '* E l1|@titlefont expected braces
 @titlefont expected braces

';

$result_nodes_list{'titlefont_no_braces'} = '';

$result_sections_list{'titlefont_no_braces'} = '';

$result_sectioning_root{'titlefont_no_braces'} = '';

$result_headings_list{'titlefont_no_braces'} = '';


$result_converted{'plaintext'}->{'titlefont_no_braces'} = '';


$result_converted{'html_text'}->{'titlefont_no_braces'} = '';


$result_converted{'latex_text'}->{'titlefont_no_braces'} = '';


$result_converted{'docbook'}->{'titlefont_no_braces'} = '';

1;
