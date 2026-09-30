use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'preformatted'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@example C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C3
    {e--xample  some  \\n}
    {empty_line:\\n}
    {   text\\n}
   *@end C1 l6
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
  {empty_line:\\n}
  *@format C3 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@vtable C3 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *arguments_line C1
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *@code l9
    *table_entry C2
     *table_term C1
      *@item C1 l10
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |index_entry:I{vr,1}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {item in table in format}
     *table_definition C1
      *preformatted C2
       {empty_line:\\n}
       {in table in format\\n}
    *@end C1 l13
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{vtable}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {vtable}
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{format}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {format}
';


$result_texis{'preformatted'} = '
@example
e--xample  some  

   text
@end example

@format
@vtable @code
@item item in table in format

in table in format
@end vtable
@end format
';


$result_texts{'preformatted'} = '
e--xample  some  

   text

item in table in format

in table in format
';

$result_errors{'preformatted'} = '* W l10|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

';

$result_nodes_list{'preformatted'} = '';

$result_sections_list{'preformatted'} = '';

$result_sectioning_root{'preformatted'} = '';

$result_headings_list{'preformatted'} = '';

$result_indices_sort_strings{'preformatted'} = 'vr:
 item in table in format
';


$result_converted{'plaintext'}->{'preformatted'} = '     e--xample  some

        text

‘item in table in format’

     in table in format
';


$result_converted{'html_text'}->{'preformatted'} = '
<div class="example">
<pre class="example-preformatted">e--xample  some  

   text
</pre></div>

<div class="format">
<dl class="vtable">
<dt><a id="index-item-in-table-in-format"></a><span><code class="code">item in table in format</code><a class="copiable-link" href="#index-item-in-table-in-format"> &para;</a></span></dt>
<dd><pre class="format-preformatted">

in table in format
</pre></dd>
</dl>
</div>
';


$result_converted{'xml'}->{'preformatted'} = '
<example endspaces=" ">
<pre xml:space="preserve">e--xample  some  

   text
</pre></example>

<format endspaces=" ">
<vtable commandarg="code" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="code"><indexterm index="vr" number="1">item in table in format</indexterm>item in table in format</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">
in table in format
</pre></tableitem></tableentry></vtable>
</format>
';


$result_converted{'latex_text'}->{'preformatted'} = '
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily e{-}{-}xample  some  

\\   text
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{item in table in format}
\\index[vr]{item in table in format@\\texttt{item in table in format}}%
}}]
\\begin{Texinfopreformatted}%

in table in format
\\end{Texinfopreformatted}
\\end{description}
';


$result_converted{'docbook'}->{'preformatted'} = '
<screen>e--xample  some  

   text
</screen>
<variablelist><varlistentry><term><indexterm role="vr"><primary>item in table in format</primary></indexterm><literal>item in table in format</literal>
</term><listitem><literallayout>
in table in format
</literallayout></listitem></varlistentry></variablelist>';

1;
