use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline'} = '*document_root C1
 *before_node_section C5
  {empty_line:\\n}
  *paragraph C12
   *@inlinefmt C2 l2
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {<blink>html</blink> ``}
   {, \\n}
   *@inlinefmt C2 l3
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {plaintext ``}
   {, \\n}
   *@inlinefmt C2 l4
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {xml}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {<para>xml</para> ``}
   {,\\n}
   *@inlinefmt C2 l5
   |EXTRA
   |expand_index:{1}
   |format:{docbook}
    *brace_arg C1
     {docbook}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {<emphasis>docbook</emphasis> ``}
   {, \\n}
   *@inlinefmt C2 l6
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw: $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
   {\\n}
   *@inlinefmt C2 l7
   |EXTRA
   |expand_index:{1}
   |format:{latex}
    *brace_arg C1
     {latex}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@math C1 l7
      *brace_command_context C3
       {\\frac}
       *balanced_braces C3 l7
        {{a < b }
        *@code C1 l7
         *brace_container C2
          {tex \\hbox}
          *balanced_braces C1 l7
           {{ code }}
        {}}
       *balanced_braces C1 l7
        {{b}}
     { ``}
   {\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C12
   *@inlineraw C2 l10
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw <blink>html</blink> ``}
   {, \\n}
   *@inlineraw C2 l11
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw plaintext ``}
   {, \\n}
   *@inlineraw C2 l12
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {xml}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw <para>xml</para> ``}
   {,\\n}
   *@inlineraw C2 l13
   |EXTRA
   |expand_index:{1}
   |format:{docbook}
    *brace_arg C1
     {docbook}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw <emphasis>docbook</emphasis> ``}
   {, \\n}
   *@inlineraw C2 l14
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw: raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
   {\\n}
   *@inlineraw C2 l15
   |EXTRA
   |expand_index:{1}
   |format:{latex}
    *brace_arg C1
     {latex}
    *brace_arg C4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {raw $\\frac}
     *balanced_braces C3 l15
      {{a < b }
      *@code C1 l15
       *brace_container C2
        {tex \\hbox}
        *balanced_braces C1 l15
         {{ code }}
      {}}
     *balanced_braces C1 l15
      {{b}}
     {$ ``}
   {\\n}
';


$result_texis{'inline'} = '
@inlinefmt{html, <blink>html</blink> ``}, 
@inlinefmt{plaintext, plaintext ``}, 
@inlinefmt{xml, <para>xml</para> ``},
@inlinefmt{docbook, <emphasis>docbook</emphasis> ``}, 
@inlinefmt{tex, $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlinefmt{latex, @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}


@inlineraw{html, raw <blink>html</blink> ``}, 
@inlineraw{plaintext, raw plaintext ``}, 
@inlineraw{xml, raw <para>xml</para> ``},
@inlineraw{docbook, raw <emphasis>docbook</emphasis> ``}, 
@inlineraw{tex, raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlineraw{latex, raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
';


$result_texts{'inline'} = '
<blink>html</blink> ", 
plaintext ", 
<para>xml</para> ",
<emphasis>docbook</emphasis> ", 

\\frac{a < b tex \\hbox{ code }}{b} "


raw <blink>html</blink> ``, 
raw plaintext ``, 
raw <para>xml</para> ``,
raw <emphasis>docbook</emphasis> ``, 

raw $\\frac{a < b tex \\hbox{ code }}{b}$ ``
';

$result_errors{'inline'} = '';

$result_nodes_list{'inline'} = '';

$result_sections_list{'inline'} = '';

$result_sectioning_root{'inline'} = '';

$result_headings_list{'inline'} = '';


$result_converted{'plaintext'}->{'inline'} = ', plaintext ", , ,

   , raw plaintext ``, , ,
';


$result_converted{'html_text'}->{'inline'} = '
<p>&lt;blink&gt;html&lt;/blink&gt; &ldquo;, 
, 
,
, 


</p>

<p>raw <blink>html</blink> ``, 
, 
,
, 


</p>';


$result_converted{'xml'}->{'inline'} = '
<para><inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent spaces=" ">&lt;blink&gt;html&lt;/blink&gt; &textldquo;</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent spaces=" ">plaintext &textldquo;</inlinefmtcontent></inlinefmt>, 
&lt;para&gt;xml&lt;/para&gt; &textldquo;,
<inlinefmt><inlinefmtformat>docbook</inlinefmtformat><inlinefmtcontent spaces=" ">&lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>tex</inlinefmtformat><inlinefmtcontent> $\\underline{a &lt; b @code{tex \\hbox{ code }}}$ ``</inlinefmtcontent></inlinefmt>
<inlinefmt><inlinefmtformat>latex</inlinefmtformat><inlinefmtcontent spaces=" "><math>\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}</math> &textldquo;</inlinefmtcontent></inlinefmt>
</para>

<para><inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent spaces=" ">raw &lt;blink&gt;html&lt;/blink&gt; &textldquo;</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent spaces=" ">raw plaintext &textldquo;</inlinerawcontent></inlineraw>, 
raw <para>xml</para> ``,
<inlineraw><inlinerawformat>docbook</inlinerawformat><inlinerawcontent spaces=" ">raw &lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>tex</inlinerawformat><inlinerawcontent> raw $\\underline{a &lt; b @code{tex \\hbox{ code }}}$ ``</inlinerawcontent></inlineraw>
<inlineraw><inlinerawformat>latex</inlinerawformat><inlinerawcontent spaces=" ">raw $\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}$ &textldquo;</inlinerawcontent></inlineraw>
</para>';


$result_converted{'docbook'}->{'inline'} = '
<para>, 
, 
,
&lt;emphasis&gt;docbook&lt;/emphasis&gt; &#8220;, 


</para>

<para>, 
, 
,
raw <emphasis>docbook</emphasis> ``, 


</para>';


$result_converted{'latex_text'}->{'inline'} = '
, 
, 
,
, 

$\\frac{a < b \\mathtt{tex \\hbox{ code }}}{b}$ ``


, 
, 
,
, 

raw $\\frac{a < b \\texttt{tex \\hbox{ code }}}{b}$ ``
';

1;
