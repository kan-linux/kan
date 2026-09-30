use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'commands_in_flushright'} = '*document_root C1
 *before_node_section C1
  *@flushright C26 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *@group C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {in group\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{group}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {group}
   {empty_line:\\n}
   *@quotation C3 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *arguments_line C1
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {type}
    *paragraph C1
     {in quotation\\n}
    *@end C1 l9
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
   *@enumerate C4 l11
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@item C3 l12
    |EXTRA
    |item_number:{1}
     {ignorable_spaces_after_command: }
     *paragraph C1
      {item\\n}
     {empty_line:\\n}
    *@item C2 l14
    |EXTRA
    |item_number:{2}
     {ignorable_spaces_after_command: }
     *paragraph C1
      {other item\\n}
    *@end C1 l15
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{enumerate}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {enumerate}
   {empty_line:\\n}
   *@table C3 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *arguments_line C1
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *@emph l17
    *table_entry C2
     *table_term C2
      *@item C1 l18
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {table item}
      *@itemx C1 l19
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {table itemx}
     *table_definition C3
      *paragraph C1
       {Table text\\n}
      {empty_line:\\n}
      *paragraph C1
       {Text.\\n}
    *@end C1 l23
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{table}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {table}
   {empty_line:\\n}
   *@multitable C3 l25
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |max_columns:{2}
    *arguments_line C1
     *block_line_arg C1
      *@columnfractions C1 l25
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |misc_args:A{0.5|0.5}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {0.5 0.5}
    *multitable_body C2
     *row C2
     |EXTRA
     |row_number:{1}
      *@item C2 l26
      |EXTRA
      |cell_number:{1}
       {ignorable_spaces_after_command: }
       *paragraph C1
        {col1 }
      *@tab C2 l26
      |EXTRA
      |cell_number:{2}
       {ignorable_spaces_after_command: }
       *paragraph C1
        {col2\\n}
     *row C2
     |EXTRA
     |row_number:{2}
      *@item C4 l27
      |EXTRA
      |cell_number:{1}
       {ignorable_spaces_after_command: }
       *paragraph C1
        {text\\n}
       {empty_line:\\n}
       *paragraph C1
        {in multitable\\n}
      *@tab C3 l30
      |EXTRA
      |cell_number:{2}
       {ignorable_spaces_after_command: \\n}
       {empty_line:\\n}
       *paragraph C1
        {text col2\\n}
    *@end C1 l33
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{multitable}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {multitable}
   {empty_line:\\n}
   *@float C7 l35
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |float_number:{1}
   |float_type:{label}
   |global_command_number:{1}
   |is_target:{1}
   |normalized:{type}
    *arguments_line C2
     *block_line_arg C1
      {label}
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
     |spaces_before_argument:
      |{spaces_before_argument: }
      {type}
    {empty_line:\\n}
    *paragraph C1
     {in float\\n}
    {empty_line:\\n}
    *@caption C1 l39
     *brace_command_context C1
      *paragraph C1
       {in caption}
    {spaces_after_close_brace:\\n}
    *@end C1 l40
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{float}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {float}
   {empty_line:\\n}
   *paragraph C1
    {Sp:\\n}
   *@sp C1 l43
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{2}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {2}
   {empty_line:\\n}
   *@smallexample C3 l45
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {in example\\n}
    *@end C1 l47
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{smallexample}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {smallexample}
   {empty_line:\\n}
   *@format C3 l49
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {in format\\n}
    *@end C1 l51
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
   {empty_line:\\n}
   *@flushleft C3 l53
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {in flushleft\\n}
    *@end C1 l55
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{flushleft}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {flushleft}
   {empty_line:\\n}
   *@center C1 l57
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in center}
   {empty_line:\\n}
   *@end C1 l59
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushright}
';


$result_texis{'commands_in_flushright'} = '@flushright

@group
in group
@end group

@quotation type
in quotation
@end quotation

@enumerate
@item item

@item other item
@end enumerate

@table @emph
@item table item
@itemx table itemx
Table text

Text.
@end table

@multitable @columnfractions 0.5 0.5
@item col1 @tab col2
@item text

in multitable
@tab 

text col2
@end multitable

@float label, type

in float

@caption{in caption}
@end float

Sp:
@sp 2

@smallexample
in example
@end smallexample

@format
in format
@end format

@flushleft
in flushleft
@end flushleft

@center in center

@end flushright
';


$result_texts{'commands_in_flushright'} = '
in group

type
in quotation

1. item

2. other item

table item
table itemx
Table text

Text.

col1 col2
text

in multitable

text col2

label, type

in float


Sp:



in example

in format

in flushleft

in center

';

$result_errors{'commands_in_flushright'} = '';

$result_floats{'commands_in_flushright'} = 'label: 1
 F1: {type}
  C: in caption
';

$result_nodes_list{'commands_in_flushright'} = '';

$result_sections_list{'commands_in_flushright'} = '';

$result_sectioning_root{'commands_in_flushright'} = '';

$result_headings_list{'commands_in_flushright'} = '';


$result_converted{'plaintext'}->{'commands_in_flushright'} = '                                                               in group

     type:                                                            in quotation

  1.                                                                    item

  2.                                                              other item

_table item_
_table itemx_
                                                             Table text

                                                                  Text.

                             col1                                 col2
                             text                            text col2

                    in multitable

in float

label 1: in caption

                                                                    Sp:


     in example

in format

in flushleft

                               in center

';


$result_converted{'html_text'}->{'commands_in_flushright'} = '<div class="flushright">
<div class="group"><p class="flushright-paragraph">in group
</p></div>
<blockquote class="quotation">
<p class="flushright-paragraph"><b class="b">type:</b> in quotation
</p></blockquote>

<ol class="enumerate">
<li> item

</li><li> other item
</li></ol>

<dl class="table">
<dt><em class="emph">table item</em></dt>
<dt><em class="emph">table itemx</em></dt>
<dd><p class="flushright-paragraph">Table text
</p>
<p class="flushright-paragraph">Text.
</p></dd>
</dl>

<table class="multitable">
<tbody><tr><td width="50%">col1</td><td width="50%">col2</td></tr>
<tr><td width="50%">text

<p class="flushright-paragraph">in multitable
</p></td><td width="50%">text col2</td></tr>
</tbody>
</table>

<div class="float" id="type">

<p>in float
</p>
<div class="caption"><p><strong class="strong">label 1: </strong>in caption</p></div></div>
<p class="flushright-paragraph">Sp:
</p><br>
<br>

<div class="example smallexample">
<pre class="example-preformatted">in example
</pre></div>

<div class="format">
<pre class="format-preformatted">in format
</pre></div>

<div class="flushleft"><p class="flushleft-paragraph">in flushleft
</p></div>
<div class="center">in center
</div>
</div>';

1;
