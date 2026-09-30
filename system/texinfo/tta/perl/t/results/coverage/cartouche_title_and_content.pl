use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cartouche_title_and_content'} = '*document_root C1
 *before_node_section C1
  *@cartouche C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Box title on }
     *@emph C1 l1
      *brace_container C1
       {documentation}
   *paragraph C2
    {Text on documentation explaining something important out of the main\\n}
    {flow of the text.\\n}
   *@end C1 l4
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
';


$result_texis{'cartouche_title_and_content'} = '@cartouche Box title on @emph{documentation}
Text on documentation explaining something important out of the main
flow of the text.
@end cartouche
';


$result_texts{'cartouche_title_and_content'} = 'Box title on documentation
Text on documentation explaining something important out of the main
flow of the text.
';

$result_errors{'cartouche_title_and_content'} = '';

$result_nodes_list{'cartouche_title_and_content'} = '';

$result_sections_list{'cartouche_title_and_content'} = '';

$result_sectioning_root{'cartouche_title_and_content'} = '';

$result_headings_list{'cartouche_title_and_content'} = '';


$result_converted{'plaintext'}->{'cartouche_title_and_content'} = '                     Box title on _documentation_
Text on documentation explaining something important out of the main
flow of the text.
';


$result_converted{'html_text'}->{'cartouche_title_and_content'} = '<table class="cartouche"><tr><th>
Box title on <em class="emph">documentation</em></th></tr><tr><td>
<p>Text on documentation explaining something important out of the main
flow of the text.
</p></td></tr></table>
';


$result_converted{'xml'}->{'cartouche_title_and_content'} = '<cartouche spaces=" " endspaces=" "><cartouchetitle>Box title on <emph>documentation</emph></cartouchetitle>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></cartouche>
';


$result_converted{'latex_text'}->{'cartouche_title_and_content'} = '\\begin{mdframed}[style=Texinfocartouche, frametitle={Box title on \\emph{documentation}}]
Text on documentation explaining something important out of the main
flow of the text.
\\end{mdframed}
';


$result_converted{'docbook'}->{'cartouche_title_and_content'} = '<sidebar><title>Box title on <emphasis>documentation</emphasis></title>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></sidebar>';

1;
