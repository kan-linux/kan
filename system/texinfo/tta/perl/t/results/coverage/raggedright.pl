use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'raggedright'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@raggedright C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in raggedright\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{raggedright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {raggedright}
';


$result_texis{'raggedright'} = '
@raggedright
in raggedright
@end raggedright
';


$result_texts{'raggedright'} = '
in raggedright
';

$result_errors{'raggedright'} = '';

$result_nodes_list{'raggedright'} = '';

$result_sections_list{'raggedright'} = '';

$result_sectioning_root{'raggedright'} = '';

$result_headings_list{'raggedright'} = '';


$result_converted{'plaintext'}->{'raggedright'} = 'in raggedright
';


$result_converted{'html_text'}->{'raggedright'} = '
<div class="raggedright"><p class="raggedright-paragraph">in raggedright
</p></div>';


$result_converted{'xml'}->{'raggedright'} = '
<raggedright endspaces=" ">
<para>in raggedright
</para></raggedright>
';


$result_converted{'latex_text'}->{'raggedright'} = '
\\begin{flushleft}
in raggedright
\\end{flushleft}
';


$result_converted{'docbook'}->{'raggedright'} = '
<para>in raggedright
</para>';

1;
