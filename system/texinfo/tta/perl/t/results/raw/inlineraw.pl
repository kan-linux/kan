use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlineraw'} = '*document_root C1
 *before_node_section C1
  *paragraph C5
   {A }
   *@inlineraw C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {plaintext `` }
     *@lbracechar C1 l1
      *brace_container
     { }
   { a.  Now html\\n}
   *@inlineraw C2 l2
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {in <i>}
     *@acronym C1 l2
      *brace_arg C1
       {HTML}
     {</i>}
   {.\\n}
';


$result_texis{'inlineraw'} = 'A @inlineraw{plaintext, plaintext `` @lbracechar{} } a.  Now html
@inlineraw{html, in <i>@acronym{HTML}</i>}.
';


$result_texts{'inlineraw'} = 'A plaintext `` {  a.  Now html
in <i>HTML</i>.
';

$result_errors{'inlineraw'} = '';

$result_nodes_list{'inlineraw'} = '';

$result_sections_list{'inlineraw'} = '';

$result_sectioning_root{'inlineraw'} = '';

$result_headings_list{'inlineraw'} = '';


$result_converted{'plaintext'}->{'inlineraw'} = 'A plaintext `` { a.  Now html .
';


$result_converted{'xml'}->{'inlineraw'} = '<para>A <inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent spaces=" ">plaintext &textldquo; &lbracechar; </inlinerawcontent></inlineraw> a.  Now html
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent spaces=" ">in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinerawcontent></inlineraw>.
</para>';

1;
