use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'lone_braces_in_html'} = '*document_root C1
 *before_node_section C3
  *@html C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {}\\n}
   *@end C1 l3
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
  {empty_line:\\n}
  *@html C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {{\\n}
   *@end C1 l7
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
';


$result_texis{'lone_braces_in_html'} = '@html
}
@end html

@html
{
@end html
';


$result_texts{'lone_braces_in_html'} = '}

{
';

$result_errors{'lone_braces_in_html'} = '';

$result_nodes_list{'lone_braces_in_html'} = '';

$result_sections_list{'lone_braces_in_html'} = '';

$result_sectioning_root{'lone_braces_in_html'} = '';

$result_headings_list{'lone_braces_in_html'} = '';


$result_converted{'plaintext'}->{'lone_braces_in_html'} = '';


$result_converted{'xml'}->{'lone_braces_in_html'} = '<html endspaces=" ">
}
</html>

<html endspaces=" ">
{
</html>
';


$result_converted{'html_text'}->{'lone_braces_in_html'} = '}

{
';

1;
