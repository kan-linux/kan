use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'html_expanded'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {Before\\n}
   *@html C3 l2
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *rawpreformatted C1
     {html\\n}
    *@end C1 l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{html}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {html}
   {after.\\n}
';


$result_texis{'html_expanded'} = 'Before
@html
html
@end html
after.
';


$result_texts{'html_expanded'} = 'Before
html
after.
';

$result_errors{'html_expanded'} = '';

$result_nodes_list{'html_expanded'} = '';

$result_sections_list{'html_expanded'} = '';

$result_sectioning_root{'html_expanded'} = '';

$result_headings_list{'html_expanded'} = '';


$result_converted{'plaintext'}->{'html_expanded'} = 'Before html
after.
';

1;
