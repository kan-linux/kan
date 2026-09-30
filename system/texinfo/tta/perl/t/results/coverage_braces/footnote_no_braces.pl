use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_no_braces'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@footnote l1
';


$result_texis{'footnote_no_braces'} = '@footnote';


$result_texts{'footnote_no_braces'} = '';

$result_errors{'footnote_no_braces'} = '* E l1|@footnote expected braces
 @footnote expected braces

';

$result_nodes_list{'footnote_no_braces'} = '';

$result_sections_list{'footnote_no_braces'} = '';

$result_sectioning_root{'footnote_no_braces'} = '';

$result_headings_list{'footnote_no_braces'} = '';


$result_converted{'plaintext'}->{'footnote_no_braces'} = '(1)

   ---------- Footnotes ----------

   (1) 
';


$result_converted{'html_text'}->{'footnote_no_braces'} = '';


$result_converted{'latex_text'}->{'footnote_no_braces'} = '\\footnote{}';


$result_converted{'docbook'}->{'footnote_no_braces'} = '<para></para>';

1;
