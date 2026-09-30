use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'normal_font_in_monospace'} = '*document_root C1
 *before_node_section C3
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C3
    {in example }
    *@r C1 l2
     *brace_container C2
      {in r---now }
      *@code C1 l2
       *brace_container C1
        {in co---de}
    {\\n}
   *@end C1 l3
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
  *paragraph C2
   *@command C1 l5
    *brace_container C2
     {in command---c }
     *@r C1 l5
      *brace_container C2
       {in r---r }
       *@file C1 l5
        *brace_container C1
         {in file---}
   {.\\n}
';


$result_texis{'normal_font_in_monospace'} = '@example
in example @r{in r---now @code{in co---de}}
@end example

@command{in command---c @r{in r---r @file{in file---}}}.
';


$result_texts{'normal_font_in_monospace'} = 'in example in r---now in co---de

in command---c in r---r in file---.
';

$result_errors{'normal_font_in_monospace'} = '';

$result_nodes_list{'normal_font_in_monospace'} = '';

$result_sections_list{'normal_font_in_monospace'} = '';

$result_sectioning_root{'normal_font_in_monospace'} = '';

$result_headings_list{'normal_font_in_monospace'} = '';


$result_converted{'plaintext'}->{'normal_font_in_monospace'} = '     in example in r--now ‘in co---de’

   ‘in command---c in r--r ‘in file---’’.
';


$result_converted{'html_text'}->{'normal_font_in_monospace'} = '<div class="example">
<pre class="example-preformatted">in example <span class="r">in r&mdash;now <code class="code">in co---de</code></span>
</pre></div>

<p><code class="command">in command---c <span class="r">in r&mdash;r <samp class="file">in file---</samp></span></code>.
</p>';


$result_converted{'xml'}->{'normal_font_in_monospace'} = '<example endspaces=" ">
<pre xml:space="preserve">in example <r>in r&textmdash;now <code>in co---de</code></r>
</pre></example>

<para><command>in command---c <r>in r&textmdash;r <file>in file---</file></r></command>.
</para>';


$result_converted{'docbook'}->{'normal_font_in_monospace'} = '<screen>in example in r&#8212;now <literal>in co---de</literal>
</screen>
<para><command>in command---c in r&#8212;r <filename>in file---</filename></command>.
</para>';


$result_converted{'latex_text'}->{'normal_font_in_monospace'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example \\textnormal{in r---now \\texttt{in co{-}{-}{-}de}}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\texttt{in command{-}{-}{-}c \\textnormal{in r---r \\texttt{in file{-}{-}{-}}}}.
';

1;
