use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'raw_block_commands_expand_tex'} = '*document_root C1
 *before_node_section C10
  {empty_line:\\n}
  *@html C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {<blink>html</blink> ``}\\n}
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
  {empty_line:\\n}
  *@xml C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {<para>xml</para> ``}\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{xml}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {xml}
  {empty_line:\\n}
  *@docbook C3 l10
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {<emphasis>docbook</emphasis> ``}\\n}
   *@end C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{docbook}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {docbook}
  {empty_line:\\n}
  *@tex C3 l14
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C3
    {$\\underline{a < b }
    *@code C1 l15
     *brace_container C2
      {tex \\hbox}
      *balanced_braces C1 l15
       {{ code }}
    {}$ ``\\n}
   *@end C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
  {empty_line:\\n}
  *@latex C3 l18
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C3
    {$\\frac{a < b }
    *@code C1 l19
     *brace_container C2
      {tex \\hbox}
      *balanced_braces C1 l19
       {{ code }}
    {}{b}$ ``\\n}
   *@end C1 l20
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{latex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {latex}
';


$result_texis{'raw_block_commands_expand_tex'} = '
@html
<blink>html</blink> ``}
@end html

@xml
<para>xml</para> ``}
@end xml

@docbook
<emphasis>docbook</emphasis> ``}
@end docbook

@tex
$\\underline{a < b @code{tex \\hbox{ code }}}$ ``
@end tex

@latex
$\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``
@end latex
';


$result_texts{'raw_block_commands_expand_tex'} = '
<blink>html</blink> ``}

<para>xml</para> ``}

<emphasis>docbook</emphasis> ``}

$\\underline{a < b tex \\hbox{ code }}$ ``

$\\frac{a < b tex \\hbox{ code }}{b}$ ``
';

$result_errors{'raw_block_commands_expand_tex'} = '';

$result_nodes_list{'raw_block_commands_expand_tex'} = '';

$result_sections_list{'raw_block_commands_expand_tex'} = '';

$result_sectioning_root{'raw_block_commands_expand_tex'} = '';

$result_headings_list{'raw_block_commands_expand_tex'} = '';


$result_converted{'plaintext'}->{'raw_block_commands_expand_tex'} = '$\\underline{a < b ‘tex \\hbox{ code }’}$ ``

';


$result_converted{'html_text'}->{'raw_block_commands_expand_tex'} = '



$\\underline{a &lt; b &lt;code class=&quot;code&quot;&gt;tex \\hbox{ code }&lt;/code&gt;}$ ``

';

$result_converted_errors{'html_text'}->{'raw_block_commands_expand_tex'} = '* W l14|raw format tex is not converted
 warning: raw format tex is not converted

';


$result_converted{'xml'}->{'raw_block_commands_expand_tex'} = '
<html endspaces=" ">
&lt;blink&gt;html&lt;/blink&gt; &textldquo;}
</html>

<xml endspaces=" ">
&lt;para&gt;xml&lt;/para&gt; &textldquo;}
</xml>

<docbook endspaces=" ">
&lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;}
</docbook>

$\\underline{a < b <code>tex \\hbox{ code }</code>}$ ``

<latex endspaces=" ">
$\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}$ &textldquo;
</latex>
';


$result_converted{'docbook'}->{'raw_block_commands_expand_tex'} = '



$\\underline{a < b <literal>tex \\hbox{ code }</literal>}$ ``

';


$result_converted{'latex_text'}->{'raw_block_commands_expand_tex'} = '



$\\underline{a < b \\texttt{tex \\hbox{ code }}}$ ``

';

1;
