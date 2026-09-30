use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cartouche_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {In example\\n}
   *@cartouche C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {In cartouche in example\\n}
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
   *preformatted C1
    {end example\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'cartouche_in_example'} = '@example
In example
@cartouche
In cartouche in example
@end cartouche
end example
@end example
';


$result_texts{'cartouche_in_example'} = 'In example
In cartouche in example
end example
';

$result_errors{'cartouche_in_example'} = '';

$result_nodes_list{'cartouche_in_example'} = '';

$result_sections_list{'cartouche_in_example'} = '';

$result_sectioning_root{'cartouche_in_example'} = '';

$result_headings_list{'cartouche_in_example'} = '';


$result_converted{'plaintext'}->{'cartouche_in_example'} = '     In example
     In cartouche in example
     end example
';


$result_converted{'html_text'}->{'cartouche_in_example'} = '<div class="example">
<pre class="example-preformatted">In example
</pre><table class="cartouche"><tr><td>
<pre class="example-preformatted">In cartouche in example
</pre></td></tr></table>
<pre class="example-preformatted">end example
</pre></div>
';


$result_converted{'xml'}->{'cartouche_in_example'} = '<example endspaces=" ">
<pre xml:space="preserve">In example
</pre><cartouche endspaces=" ">
<pre xml:space="preserve">In cartouche in example
</pre></cartouche>
<pre xml:space="preserve">end example
</pre></example>
';


$result_converted{'latex_text'}->{'cartouche_in_example'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In example
\\end{Texinfopreformatted}
\\begin{mdframed}[style=Texinfocartouche]
\\begin{Texinfopreformatted}%
\\ttfamily In cartouche in example
\\end{Texinfopreformatted}
\\end{mdframed}
\\begin{Texinfopreformatted}%
\\ttfamily end example
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'cartouche_in_example'} = '<screen>In example
</screen><sidebar><screen>In cartouche in example
</screen></sidebar><screen>end example
</screen>';

1;
