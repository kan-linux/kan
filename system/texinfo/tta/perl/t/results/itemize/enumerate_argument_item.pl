use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'enumerate_argument_item'} = '*document_root C1
 *before_node_section C7
  *@enumerate C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {1}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {numeric first\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {numeric second\\n}
   *@end C1 l4
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
  *@enumerate C4 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment}
     {A}
   *@item C2 l7
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {upper case first\\n}
   *@item C2 l8
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {upper case second\\n}
   *@end C1 l9
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
  *@enumerate C4 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {z}
   *@item C2 l12
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {lower case first\\n}
   *@item C2 l13
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {lower case second\\n}
   *@end C1 l14
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
  *@enumerate C4 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {0}
   *@item C2 l17
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {numeric zero first\\n}
   *@item C2 l18
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {numeric zero second\\n}
   *@end C1 l19
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
';


$result_texis{'enumerate_argument_item'} = '@enumerate 1
@item numeric first
@item numeric second
@end enumerate

@enumerate A@c comment
@item upper case first
@item upper case second
@end enumerate

@enumerate z @c comment
@item lower case first
@item lower case second
@end enumerate

@enumerate 0
@item numeric zero first
@item numeric zero second
@end enumerate
';


$result_texts{'enumerate_argument_item'} = '1. numeric first
2. numeric second

A. upper case first
B. upper case second

z. lower case first
aa. lower case second

0. numeric zero first
1. numeric zero second
';

$result_errors{'enumerate_argument_item'} = '';

$result_nodes_list{'enumerate_argument_item'} = '';

$result_sections_list{'enumerate_argument_item'} = '';

$result_sectioning_root{'enumerate_argument_item'} = '';

$result_headings_list{'enumerate_argument_item'} = '';


$result_converted{'plaintext'}->{'enumerate_argument_item'} = '  1. numeric first
  2. numeric second

  A. upper case first
  B. upper case second

  z. lower case first
  aa. lower case second

  0. numeric zero first
  1. numeric zero second
';


$result_converted{'html_text'}->{'enumerate_argument_item'} = '<ol class="enumerate">
<li> numeric first
</li><li> numeric second
</li></ol>

<ol class="enumerate" type="A" start="1">
<li> upper case first
</li><li> upper case second
</li></ol>

<ol class="enumerate" type="a" start="26">
<li> lower case first
</li><li> lower case second
</li></ol>

<ol class="enumerate" start="0">
<li> numeric zero first
</li><li> numeric zero second
</li></ol>
';


$result_converted{'xml'}->{'enumerate_argument_item'} = '<enumerate first="1" spaces=" " endspaces=" "><enumeratefirst>1</enumeratefirst>
<listitem> <para>numeric first
</para></listitem><listitem> <para>numeric second
</para></listitem></enumerate>

<enumerate first="A" spaces=" " endspaces=" "><enumeratefirst>A</enumeratefirst><!-- c comment -->
<listitem> <para>upper case first
</para></listitem><listitem> <para>upper case second
</para></listitem></enumerate>

<enumerate first="z" spaces=" " endspaces=" "><enumeratefirst>z </enumeratefirst><!-- c comment -->
<listitem> <para>lower case first
</para></listitem><listitem> <para>lower case second
</para></listitem></enumerate>

<enumerate first="0" spaces=" " endspaces=" "><enumeratefirst>0</enumeratefirst>
<listitem> <para>numeric zero first
</para></listitem><listitem> <para>numeric zero second
</para></listitem></enumerate>
';

1;
