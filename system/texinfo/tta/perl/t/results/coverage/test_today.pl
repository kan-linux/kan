use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_today'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@today C1 l1
    *brace_container
   {.}
';


$result_texis{'test_today'} = '@today{}.';


$result_texts{'test_today'} = 'a sunny day.';

$result_errors{'test_today'} = '';

$result_nodes_list{'test_today'} = '';

$result_sections_list{'test_today'} = '';

$result_sectioning_root{'test_today'} = '';

$result_headings_list{'test_today'} = '';


$result_converted{'plaintext'}->{'test_today'} = 'a sunny day.
';


$result_converted{'html_text'}->{'test_today'} = '<p>a sunny day.</p>';


$result_converted{'xml'}->{'test_today'} = '<para><today/>.</para>';


$result_converted{'latex_text'}->{'test_today'} = '\\today{}.';


$result_converted{'docbook'}->{'test_today'} = '<para>a sunny day.</para>';

1;
