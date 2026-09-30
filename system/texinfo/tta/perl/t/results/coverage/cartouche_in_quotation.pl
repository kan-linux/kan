use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cartouche_in_quotation'} = '*document_root C1
 *before_node_section C1
  *@quotation C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {In quotation\\n}
   *@cartouche C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {In cartouche in quotation\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{cartouche}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {cartouche}
   *paragraph C1
    {end quotation\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'cartouche_in_quotation'} = '@quotation
In quotation
@cartouche
In cartouche in quotation
@end cartouche
end quotation
@end quotation
';


$result_texts{'cartouche_in_quotation'} = 'In quotation
In cartouche in quotation
end quotation
';

$result_errors{'cartouche_in_quotation'} = '';

$result_nodes_list{'cartouche_in_quotation'} = '';

$result_sections_list{'cartouche_in_quotation'} = '';

$result_sectioning_root{'cartouche_in_quotation'} = '';

$result_headings_list{'cartouche_in_quotation'} = '';


$result_converted{'plaintext'}->{'cartouche_in_quotation'} = '     In quotation
     In cartouche in quotation
     end quotation
';


$result_converted{'html_text'}->{'cartouche_in_quotation'} = '<blockquote class="quotation">
<p>In quotation
</p><table class="cartouche"><tr><td>
<p>In cartouche in quotation
</p></td></tr></table>
<p>end quotation
</p></blockquote>
';


$result_converted{'xml'}->{'cartouche_in_quotation'} = '<quotation endspaces=" ">
<para>In quotation
</para><cartouche endspaces=" ">
<para>In cartouche in quotation
</para></cartouche>
<para>end quotation
</para></quotation>
';


$result_converted{'latex_text'}->{'cartouche_in_quotation'} = '\\begin{quote}
In quotation
\\begin{mdframed}[style=Texinfocartouche]
In cartouche in quotation
\\end{mdframed}
end quotation
\\end{quote}
';


$result_converted{'docbook'}->{'cartouche_in_quotation'} = '<blockquote><para>In quotation
</para><sidebar><para>In cartouche in quotation
</para></sidebar><para>end quotation
</para></blockquote>';

1;
