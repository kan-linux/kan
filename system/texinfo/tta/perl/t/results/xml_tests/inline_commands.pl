use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline_commands'} = '*document_root C1
 *before_node_section C5
  *paragraph C4
   *@inlineraw C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {xml}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {<sc>xml inlineraw</sc>}
   {\\n}
   *@inlineraw C2 l2
   |EXTRA
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw: <code>html</code>}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@inlinefmt C2 l4
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {xml}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@env C1 l4
      *brace_container C1
       {inlinefmt}
     {, xml}
   {\\n}
   *@inlinefmt C2 l5
   |EXTRA
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw: @env{inlinefmt}, html}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@inlinefmtifelse C3 l7
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {xml}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xml }
     *@code C1 l7
      *brace_container C1
       {inlinefmtifelse}
    *elided_brace_command_arg C1
     {raw: else xml}
   {\\n}
   *@inlinefmtifelse C3 l8
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw: html @var{inlinefmtifelse}}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {else html}
   {\\n}
';


$result_texis{'inline_commands'} = '@inlineraw{xml, <sc>xml inlineraw</sc>}
@inlineraw{html, <code>html</code>}

@inlinefmt{xml, @env{inlinefmt}, xml}
@inlinefmt{html, @env{inlinefmt}, html}

@inlinefmtifelse{xml, xml @code{inlinefmtifelse}, else xml}
@inlinefmtifelse{html, html @var{inlinefmtifelse}, else html}
';


$result_texts{'inline_commands'} = '<sc>xml inlineraw</sc>


inlinefmt, xml


xml inlinefmtifelse
else html
';

$result_errors{'inline_commands'} = '';

$result_nodes_list{'inline_commands'} = '';

$result_sections_list{'inline_commands'} = '';

$result_sectioning_root{'inline_commands'} = '';

$result_headings_list{'inline_commands'} = '';


$result_converted{'xml'}->{'inline_commands'} = '<para><sc>xml inlineraw</sc>
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> &lt;code&gt;html&lt;/code&gt;</inlinerawcontent></inlineraw>
</para>
<para><env>inlinefmt</env>, xml
<inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> @env{inlinefmt}, html</inlinefmtcontent></inlinefmt>
</para>
<para>xml <code>inlinefmtifelse</code>
<inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentif> html @var{inlinefmtifelse}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse spaces=" ">else html</inlinefmtifelsecontentelse></inlinefmtifelse>
</para>';

1;
