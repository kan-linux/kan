use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'math'} = '*document_root C1
 *before_node_section C10
  *paragraph C3
   {Simple math\\n}
   *@math C1 l2
    *brace_command_context C4
     {--}
     *balanced_braces C1 l2
      {{x^i}}
     {\\over}
     *balanced_braces C1 l2
      {{\\tan y}}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {Math with }
   *@@
   {-command\\n}
   *@math C1 l5
    *brace_command_context C5
     *@code C1 l5
      *brace_container C1
       {math code}
     { a < b \\sum}
     *@sub C1 l5
      *brace_container C1
       {i}
     { q}
     *@sup C1 l5
      *brace_container C1
       {2}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Complex\\n}
   *@math C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C7
     {\\underline}
     *balanced_braces C3 l8
      {{}
      *@code C1 l8
       *brace_container C2
        {math \\hbox}
        *balanced_braces C1 l8
         {{ code }}
      {}}
     { }
     *@\\
     {i \\sum_}
     *balanced_braces C1 l8
      {{i}}
     *balanced_braces C3 l8
      {{\\underline}
      *balanced_braces C1 l8
       {{f}}
      {}}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@@
   {\\ outside of math\\n}
   *@\\
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {The 3}
   *@sup C1 l13
    *brace_container C1
     {rd}
   {is the I}
   *@sub C1 l13
    *brace_container C1
     {r}
   {.\\n}
  {empty_line:\\n}
';


$result_texis{'math'} = 'Simple math
@math{--{x^i}\\over{\\tan y}}

Math with @@-command
@math{@code{math code} a < b \\sum@sub{i} q@sup{2}}

Complex
@math{ \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}}

@@\\ outside of math
@\\

The 3@sup{rd}is the I@sub{r}.

';


$result_texts{'math'} = 'Simple math
--{x^i}\\over{\\tan y}

Math with @-command
math code a < b \\sumi q2

Complex
\\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

@\\ outside of math
\\

The 3rdis the Ir.

';

$result_errors{'math'} = '* W l11|@\\ should only appear in math context
 warning: @\\ should only appear in math context

';

$result_nodes_list{'math'} = '';

$result_sections_list{'math'} = '';

$result_sectioning_root{'math'} = '';

$result_headings_list{'math'} = '';


$result_converted{'plaintext'}->{'math'} = 'Simple math --{x^i}\\over{\\tan y}

   Math with @-command ‘math code’ a < b \\sum_{i} q^{2}

   Complex \\underline{‘math \\hbox{ code }’} \\i \\sum_{i}{\\underline{f}}

   @\\ outside of math \\

   The 3^{rd}is the I_{r}.

';


$result_converted{'html_text'}->{'math'} = '<p>Simple math
<em class="math">--{x^i}\\over{\\tan y}</em>
</p>
<p>Math with @-command
<em class="math"><code class="code">math code</code> a &lt; b \\sum<sub class="sub">i</sub> q<sup class="sup">2</sup></em>
</p>
<p>Complex
<em class="math">\\underline{<code class="code">math \\hbox{ code }</code>} \\i \\sum_{i}{\\underline{f}}</em>
</p>
<p>@\\ outside of math
\\
</p>
<p>The 3<sup class="sup">rd</sup>is the I<sub class="sub">r</sub>.
</p>
';


$result_converted{'xml'}->{'math'} = '<para>Simple math
<math>--{x^i}\\over{\\tan y}</math>
</para>
<para>Math with &arobase;-command
<math><code>math code</code> a &lt; b \\sum<sub>i</sub> q<sup>2</sup></math>
</para>
<para>Complex
<math spaces=" ">\\underline{<code>math \\hbox{ code }</code>} &backslash;i \\sum_{i}{\\underline{f}}</math>
</para>
<para>&arobase;\\ outside of math
&backslash;
</para>
<para>The 3<sup>rd</sup>is the I<sub>r</sub>.
</para>
';


$result_converted{'latex_text'}->{'math'} = 'Simple math
$--{x^i}\\over{\\tan y}$

Math with @-command
$\\mathtt{math code} a < b \\sum_{i} q^{2}$

Complex
$\\underline{\\mathtt{math \\hbox{ code }}} \\backslash{}i \\sum_{i}{\\underline{f}}$

@\\textbackslash{} outside of math
\\textbackslash{}

The 3\\textsuperscript{rd}is the I\\textsubscript{r}.

';


$result_converted{'docbook'}->{'math'} = '<para>Simple math
<inlineequation><mathphrase>--{x^i}\\over{\\tan y}</mathphrase></inlineequation>
</para>
<para>Math with @-command
<inlineequation><mathphrase><literal>math code</literal> a &lt; b \\sum<subscript>i</subscript> q<superscript>2</superscript></mathphrase></inlineequation>
</para>
<para>Complex
<inlineequation><mathphrase>\\underline{<literal>math \\hbox{ code }</literal>} \\i \\sum_{i}{\\underline{f}}</mathphrase></inlineequation>
</para>
<para>@\\ outside of math
\\
</para>
<para>The 3<superscript>rd</superscript>is the I<subscript>r</subscript>.
</para>
';

1;
