use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_accent_argument'} = '*document_root C1
 *before_node_section C7
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@comment C1
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:}
     *@~ l1
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  {empty_line:\\n}
  *@itemize C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@~ l5
   *@item C2 l6
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  {empty_line:\\n}
  *@itemize C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@~ C1 l9
      *brace_container
   *@item C2 l10
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  {empty_line:\\n}
  *@itemize C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     *@~ l13
   *@item C2 l14
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
';


$result_texis{'empty_accent_argument'} = '@itemize @~@comment
@item item
@end itemize

@itemize @~
@item item
@end itemize

@itemize @~{}
@item item
@end itemize

@itemize @~ 
@item item
@end itemize
';


$result_texts{'empty_accent_argument'} = 'item

item

item

item
';

$result_errors{'empty_accent_argument'} = '* E l1|@~ expected braces
 @~ expected braces

* W l1|accent command `@~\' not allowed as @itemize argument
 warning: accent command `@~\' not allowed as @itemize argument

* W l5|command `@~\' must not be followed by new line
 warning: command `@~\' must not be followed by new line

* W l5|accent command `@~\' not allowed as @itemize argument
 warning: accent command `@~\' not allowed as @itemize argument

* W l9|accent command `@~\' not allowed as @itemize argument
 warning: accent command `@~\' not allowed as @itemize argument

* W l13|command `@~\' must not be followed by new line
 warning: command `@~\' must not be followed by new line

* W l13|accent command `@~\' not allowed as @itemize argument
 warning: accent command `@~\' not allowed as @itemize argument

';

$result_nodes_list{'empty_accent_argument'} = '';

$result_sections_list{'empty_accent_argument'} = '';

$result_sectioning_root{'empty_accent_argument'} = '';

$result_headings_list{'empty_accent_argument'} = '';


$result_converted{'plaintext'}->{'empty_accent_argument'} = '   ̃  item

   ̃  item

   ̃  item

   ̃  item
';


$result_converted{'html_text'}->{'empty_accent_argument'} = '<ul class="itemize" style="list-style-type: \'\\0303 \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\0303 \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\0303 \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\0303 \'">
<li>item
</li></ul>
';


$result_converted{'xml'}->{'empty_accent_argument'} = '<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde"></accent></itemprepend><!-- comment -->
<listitem><prepend><accent type="tilde"></accent></prepend> <para>item
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde"></accent></itemprepend>
<listitem><prepend><accent type="tilde"></accent></prepend> <para>item
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde"></accent></itemprepend>
<listitem><prepend><accent type="tilde"></accent></prepend> <para>item
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde"></accent> </itemprepend>
<listitem><prepend><accent type="tilde"></accent></prepend> <para>item
</para></listitem></itemize>
';

1;
