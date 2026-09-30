use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'displaymath'} = '*document_root C1
 *before_node_section C11
  *paragraph C1
   {Simple\\n}
  *@displaymath C7 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {--}
   *balanced_braces C1 l3
    {{x^i}}
   {\\over}
   *balanced_braces C1 l3
    {{\\tan y}}
   {\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *paragraph C3
   {Math with }
   *@@
   {-command\\n}
  *@displaymath C8 l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@code C1 l8
    *brace_container C1
     {math code}
   { a < b \\sum}
   *@sub C1 l8
    *brace_container C1
     {i}
   { q}
   *@sup C1 l8
    *brace_container C1
     {2}
   {\\n}
   *@end C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *paragraph C1
   {Complex\\n}
  *@displaymath C10 l12
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   { \\underline}
   *balanced_braces C3 l13
    {{}
    *@code C1 l13
     *brace_container C2
      {math \\hbox}
      *balanced_braces C1 l13
       {{ code }}
    {}}
   { }
   *@\\
   {i \\sum_}
   *balanced_braces C1 l13
    {{i}}
   *balanced_braces C3 l13
    {{\\underline}
    *balanced_braces C1 l13
     {{f}}
    {}}
   {\\n}
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *paragraph C1
   {With a comment\\n}
  *@displaymath C4 l17
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:comment in displaymath}
   {a/2\\n}
   *@end C1 l20
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
';


$result_texis{'displaymath'} = 'Simple
@displaymath
--{x^i}\\over{\\tan y}
@end displaymath

Math with @@-command
@displaymath
@code{math code} a < b \\sum@sub{i} q@sup{2}
@end displaymath

Complex
@displaymath
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
@end displaymath

With a comment
@displaymath
@c comment in displaymath
a/2
@end displaymath
';


$result_texts{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

Math with @-command
math code a < b \\sumi q2

Complex
 \\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

With a comment
a/2
';

$result_errors{'displaymath'} = '';

$result_nodes_list{'displaymath'} = '';

$result_sections_list{'displaymath'} = '';

$result_sectioning_root{'displaymath'} = '';

$result_headings_list{'displaymath'} = '';


$result_converted{'plaintext'}->{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

   Math with @-command
math code a < b \\sum_{i} q^{2}

   Complex
 \\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

   With a comment
a/2
';


$result_converted{'html_text'}->{'displaymath'} = '<p>Simple
</p><pre class="displaymath">--{x^i}\\over{\\tan y}
</pre>
<p>Math with @-command
</p><pre class="displaymath"><code class="code">math code</code> a &lt; b \\sum<sub class="sub">i</sub> q<sup class="sup">2</sup>
</pre>
<p>Complex
</p><pre class="displaymath"> \\underline{<code class="code">math \\hbox{ code }</code>} \\i \\sum_{i}{\\underline{f}}
</pre>
<p>With a comment
</p><pre class="displaymath">a/2
</pre>';


$result_converted{'xml'}->{'displaymath'} = '<para>Simple
</para><displaymath endspaces=" ">
--{x^i}\\over{\\tan y}
</displaymath>

<para>Math with &arobase;-command
</para><displaymath endspaces=" ">
<code>math code</code> a &lt; b \\sum<sub>i</sub> q<sup>2</sup>
</displaymath>

<para>Complex
</para><displaymath endspaces=" ">
 \\underline{<code>math \\hbox{ code }</code>} &backslash;i \\sum_{i}{\\underline{f}}
</displaymath>

<para>With a comment
</para><displaymath endspaces=" ">
<!-- c comment in displaymath -->
a/2
</displaymath>
';


$result_converted{'latex_text'}->{'displaymath'} = 'Simple
\\[
--{x^i}\\over{\\tan y}
\\]

Math with @-command
\\[
\\mathtt{math code} a < b \\sum_{i} q^{2}
\\]

Complex
\\[
 \\underline{\\mathtt{math \\hbox{ code }}} \\backslash{}i \\sum_{i}{\\underline{f}}
\\]

With a comment
\\[
a/2
\\]
';


$result_converted{'docbook'}->{'displaymath'} = '<para>Simple
</para><informalequation><mathphrase>--{x^i}\\over{\\tan y}
</mathphrase></informalequation>
<para>Math with @-command
</para><informalequation><mathphrase><literal>math code</literal> a &lt; b \\sum<subscript>i</subscript> q<superscript>2</superscript>
</mathphrase></informalequation>
<para>Complex
</para><informalequation><mathphrase> \\underline{<literal>math \\hbox{ code }</literal>} \\i \\sum_{i}{\\underline{f}}
</mathphrase></informalequation>
<para>With a comment
</para><informalequation><mathphrase><!-- comment in displaymath -->
a/2
</mathphrase></informalequation>';

1;
