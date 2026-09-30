use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C9
    {A }
    *@inlineraw C2 l2
    |EXTRA
    |expand_index:{1}
    |format:{plaintext}
     *brace_arg C1
      {plaintext}
     *brace_arg C5
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {plaintext \\n}
      {empty_line:\\n}
      {`` }
      *@lbracechar C1 l4
       *brace_container
      { }
    { a.\\n}
    *@inlinefmt C2 l5
    |EXTRA
    |expand_index:{1}
    |format:{plaintext}
     *brace_arg C1
      {plaintext}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {`` }
    {.\\n}
    {empty_line:\\n}
    {  Now html\\n}
    *@inlineraw C2 l8
    |EXTRA
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {html}
     *brace_arg C4
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: \\n}
      {empty_line:\\n}
      {in <i>}
      *@acronym C1 l10
       *brace_arg C1
        {HTML}
      {</i>}
    {.\\n}
   *@end C1 l11
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


$result_texis{'inline_in_example'} = '@example
A @inlineraw{plaintext, plaintext 

`` @lbracechar{} } a.
@inlinefmt{plaintext, `` }.

  Now html
@inlineraw{html, 

in <i>@acronym{HTML}</i>}.
@end example
';


$result_texts{'inline_in_example'} = 'A plaintext 

`` {  a.
`` .

  Now html

in <i>HTML</i>.
';

$result_errors{'inline_in_example'} = '';

$result_nodes_list{'inline_in_example'} = '';

$result_sections_list{'inline_in_example'} = '';

$result_sectioning_root{'inline_in_example'} = '';

$result_headings_list{'inline_in_example'} = '';


$result_converted{'plaintext'}->{'inline_in_example'} = '     A plaintext

     `` {  a.
     `` .

       Now html
     .
';


$result_converted{'xml'}->{'inline_in_example'} = '<example endspaces=" ">
<pre xml:space="preserve">A <inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent spaces=" ">plaintext 

`` &lbracechar; </inlinerawcontent></inlineraw> a.
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent spaces=" ">`` </inlinefmtcontent></inlinefmt>.

  Now html
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent spaces=" \\n">
in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinerawcontent></inlineraw>.
</pre></example>
';

1;
