use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_w'} = '*document_root C1
 *before_node_section C1
  *paragraph C4
   *@w C1 l1
    *brace_container
   { }
   *@w C1 l1
    *brace_container C1
     {a b}
   {.}
';


$result_texis{'empty_w'} = '@w{} @w{a b}.';


$result_texts{'empty_w'} = ' a b.';

$result_errors{'empty_w'} = '';

$result_nodes_list{'empty_w'} = '';

$result_sections_list{'empty_w'} = '';

$result_sectioning_root{'empty_w'} = '';

$result_headings_list{'empty_w'} = '';


$result_converted{'plaintext'}->{'empty_w'} = ' a b.
';


$result_converted{'html_text'}->{'empty_w'} = '<p><!-- /@w --> a&nbsp;b<!-- /@w -->.</p>';


$result_converted{'xml'}->{'empty_w'} = '<para><w></w> <w>a b</w>.</para>';


$result_converted{'latex_text'}->{'empty_w'} = '\\hbox{} \\hbox{a b}.';


$result_converted{'docbook'}->{'empty_w'} = '<para><!-- /@w --> a&amp;#160;b<!-- /@w -->.</para>';

1;
