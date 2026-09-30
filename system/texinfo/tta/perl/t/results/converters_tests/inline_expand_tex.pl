use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline_expand_tex'} = '*document_root C1
 *before_node_section C5
  {empty_line:\\n}
  *paragraph C12
   *@inlinefmt C2 l2
   |EXTRA
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw: <blink>html</blink> ``}
   {, \\n}
   *@inlinefmt C2 l3
   |EXTRA
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *elided_brace_command_arg C1
     {raw: plaintext ``}
   {, \\n}
   *@inlinefmt C2 l4
   |EXTRA
   |format:{xml}
    *brace_arg C1
     {xml}
    *elided_brace_command_arg C1
     {raw: <para>xml</para> ``}
   {,\\n}
   *@inlinefmt C2 l5
   |EXTRA
   |format:{docbook}
    *brace_arg C1
     {docbook}
    *elided_brace_command_arg C1
     {raw: <emphasis>docbook</emphasis> ``}
   {, \\n}
   *@inlinefmt C2 l6
   |EXTRA
   |expand_index:{1}
   |format:{tex}
    *brace_arg C1
     {tex}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {$\\underlinea < b }
     *@code C1 l6
      *brace_container C1
       {tex \\hbox code }
   {$ ``\\n}
   *@inlinefmt C2 l7
   |EXTRA
   |format:{latex}
    *brace_arg C1
     {latex}
    *elided_brace_command_arg C1
     {raw: @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}
   {\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C12
   *@inlineraw C2 l10
   |EXTRA
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw: raw <blink>html</blink> ``}
   {, \\n}
   *@inlineraw C2 l11
   |EXTRA
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *elided_brace_command_arg C1
     {raw: raw plaintext ``}
   {, \\n}
   *@inlineraw C2 l12
   |EXTRA
   |format:{xml}
    *brace_arg C1
     {xml}
    *elided_brace_command_arg C1
     {raw: raw <para>xml</para> ``}
   {,\\n}
   *@inlineraw C2 l13
   |EXTRA
   |format:{docbook}
    *brace_arg C1
     {docbook}
    *elided_brace_command_arg C1
     {raw: raw <emphasis>docbook</emphasis> ``}
   {, \\n}
   *@inlineraw C2 l14
   |EXTRA
   |expand_index:{1}
   |format:{tex}
    *brace_arg C1
     {tex}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw $\\underline}
     *balanced_braces C3 l14
      {{a < b }
      *@code C1 l14
       *brace_container C2
        {tex \\hbox}
        *balanced_braces C1 l14
         {{ code }}
      {}}
     {$ ``}
   {\\n}
   *@inlineraw C2 l15
   |EXTRA
   |format:{latex}
    *brace_arg C1
     {latex}
    *elided_brace_command_arg C1
     {raw: raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
   {\\n}
';


$result_texis{'inline_expand_tex'} = '
@inlinefmt{html, <blink>html</blink> ``}, 
@inlinefmt{plaintext, plaintext ``}, 
@inlinefmt{xml, <para>xml</para> ``},
@inlinefmt{docbook, <emphasis>docbook</emphasis> ``}, 
@inlinefmt{tex, $\\underlinea < b @code{tex \\hbox code }}$ ``
@inlinefmt{latex, @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}


@inlineraw{html, raw <blink>html</blink> ``}, 
@inlineraw{plaintext, raw plaintext ``}, 
@inlineraw{xml, raw <para>xml</para> ``},
@inlineraw{docbook, raw <emphasis>docbook</emphasis> ``}, 
@inlineraw{tex, raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlineraw{latex, raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
';


$result_texts{'inline_expand_tex'} = '
, 
, 
,
, 
$\\underlinea < b tex \\hbox code $ "



, 
, 
,
, 
raw $\\underline{a < b tex \\hbox{ code }}$ ``

';

$result_errors{'inline_expand_tex'} = '* E l6|misplaced {
 misplaced {

* E l6|misplaced {
 misplaced {

* E l6|misplaced }
 misplaced }

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'inline_expand_tex'} = '';

$result_sections_list{'inline_expand_tex'} = '';

$result_sectioning_root{'inline_expand_tex'} = '';

$result_headings_list{'inline_expand_tex'} = '';


$result_converted{'plaintext'}->{'inline_expand_tex'} = ', , , , $\\underlinea < b ‘tex \\hbox code ’$ "

   , , , , raw $\\underline{a < b ‘tex \\hbox{ code }’}$ ``
';


$result_converted{'html_text'}->{'inline_expand_tex'} = '
<p>, 
, 
,
, 
$\\underlinea &lt; b <code class="code">tex \\hbox code </code>$ &ldquo;

</p>

<p>, 
, 
,
, 
raw $\\underline{a < b <code class="code">tex \\hbox{ code }</code>}$ ``

</p>';


$result_converted{'xml'}->{'inline_expand_tex'} = '
<para><inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> &lt;blink&gt;html&lt;/blink&gt; ``</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent> plaintext ``</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>xml</inlinefmtformat><inlinefmtcontent> &lt;para&gt;xml&lt;/para&gt; ``</inlinefmtcontent></inlinefmt>,
<inlinefmt><inlinefmtformat>docbook</inlinefmtformat><inlinefmtcontent> &lt;emphasis&gt;docbook&lt;/emphasis&gt; ``</inlinefmtcontent></inlinefmt>, 
$\\underlinea &lt; b <code>tex \\hbox code </code>$ &textldquo;
<inlinefmt><inlinefmtformat>latex</inlinefmtformat><inlinefmtcontent> @math{\\frac{a &lt; b @code{tex \\hbox{ code }}}{b}} ``</inlinefmtcontent></inlinefmt>
</para>

<para><inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> raw &lt;blink&gt;html&lt;/blink&gt; ``</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent> raw plaintext ``</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>xml</inlinerawformat><inlinerawcontent> raw &lt;para&gt;xml&lt;/para&gt; ``</inlinerawcontent></inlineraw>,
<inlineraw><inlinerawformat>docbook</inlinerawformat><inlinerawcontent> raw &lt;emphasis&gt;docbook&lt;/emphasis&gt; ``</inlinerawcontent></inlineraw>, 
raw $\\underline{a < b <code>tex \\hbox{ code }</code>}$ ``
<inlineraw><inlinerawformat>latex</inlinerawformat><inlinerawcontent> raw $\\frac{a &lt; b @code{tex \\hbox{ code }}}{b}$ ``</inlinerawcontent></inlineraw>
</para>';


$result_converted{'docbook'}->{'inline_expand_tex'} = '
<para>, 
, 
,
, 
$\\underlinea &lt; b <literal>tex \\hbox code </literal>$ &#8220;

</para>

<para>, 
, 
,
, 
raw $\\underline{a < b <literal>tex \\hbox{ code }</literal>}$ ``

</para>';


$result_converted{'latex_text'}->{'inline_expand_tex'} = '
, 
, 
,
, 
\\$\\textbackslash{}underlinea < b \\texttt{tex \\textbackslash{}hbox code }\\$ ``



, 
, 
,
, 
raw $\\underline{a < b \\texttt{tex \\hbox{ code }}}$ ``

';

1;
