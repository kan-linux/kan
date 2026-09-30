use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'standard_quotations'} = '*document_root C1
 *before_node_section C11
  *@quotation C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Note}
   *paragraph C1
    {A Note\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {note}
   *paragraph C1
    {A note\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Caution}
   *paragraph C1
    {Caution\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Important}
   *paragraph C1
    {Important\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Tip}
   *paragraph C1
    {a Tip\\n}
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Warning}
   *paragraph C1
    {a Warning.\\n}
   *@end C1 l23
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'standard_quotations'} = '@quotation Note
A Note
@end quotation

@quotation note
A note
@end quotation

@quotation Caution
Caution
@end quotation

@quotation Important
Important
@end quotation

@quotation Tip
a Tip
@end quotation

@quotation Warning
a Warning.
@end quotation
';


$result_texts{'standard_quotations'} = 'Note
A Note

note
A note

Caution
Caution

Important
Important

Tip
a Tip

Warning
a Warning.
';

$result_errors{'standard_quotations'} = '';

$result_nodes_list{'standard_quotations'} = '';

$result_sections_list{'standard_quotations'} = '';

$result_sectioning_root{'standard_quotations'} = '';

$result_headings_list{'standard_quotations'} = '';


$result_converted{'plaintext'}->{'standard_quotations'} = '     Note: A Note

     note: A note

     Caution: Caution

     Important: Important

     Tip: a Tip

     Warning: a Warning.
';


$result_converted{'html_text'}->{'standard_quotations'} = '<blockquote class="quotation">
<p><b class="b">Note:</b> A Note
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">note:</b> A note
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Caution:</b> Caution
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Important:</b> Important
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Tip:</b> a Tip
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Warning:</b> a Warning.
</p></blockquote>
';


$result_converted{'xml'}->{'standard_quotations'} = '<quotation spaces=" " endspaces=" "><quotationtype>Note</quotationtype>
<para>A Note
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>note</quotationtype>
<para>A note
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>Caution</quotationtype>
<para>Caution
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>Important</quotationtype>
<para>Important
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>Tip</quotationtype>
<para>a Tip
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>Warning</quotationtype>
<para>a Warning.
</para></quotation>
';


$result_converted{'docbook'}->{'standard_quotations'} = '<note><para>A Note
</para></note>
<note><para>A note
</para></note>
<caution><para>Caution
</para></caution>
<important><para>Important
</para></important>
<tip><para>a Tip
</para></tip>
<warning><para>a Warning.
</para></warning>';

1;
