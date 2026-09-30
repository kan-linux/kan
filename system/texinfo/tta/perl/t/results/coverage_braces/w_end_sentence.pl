use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'w_end_sentence'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   {a. }
   *@w C1 l1
    *brace_container C1
     {b}
';


$result_texis{'w_end_sentence'} = 'a. @w{b}';


$result_texts{'w_end_sentence'} = 'a. b';

$result_errors{'w_end_sentence'} = '';

$result_nodes_list{'w_end_sentence'} = '';

$result_sections_list{'w_end_sentence'} = '';

$result_sectioning_root{'w_end_sentence'} = '';

$result_headings_list{'w_end_sentence'} = '';


$result_converted{'plaintext'}->{'w_end_sentence'} = 'a.  b
';


$result_converted{'html_text'}->{'w_end_sentence'} = '<p>a. b<!-- /@w --></p>';


$result_converted{'latex_text'}->{'w_end_sentence'} = 'a. \\hbox{b}';


$result_converted{'docbook'}->{'w_end_sentence'} = '<para>a. b<!-- /@w --></para>';

1;
