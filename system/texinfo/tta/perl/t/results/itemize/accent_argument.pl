use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accent_argument'} = '*document_root C1
 *before_node_section C5
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@~ C1 l1
      *following_arg C1
       {e}
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
     *@~ C1 l5
      *brace_container C1
       {e}
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
     *@ringaccent C1 l9
     |INFO
     |spaces_after_cmd_before_arg:
      |{spaces_after_cmd_before_arg: }
      *following_arg C1
       {a}
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
';


$result_texis{'accent_argument'} = '@itemize @~e
@item item
@end itemize

@itemize @~{e}
@item item
@end itemize

@itemize @ringaccent a
@item item
@end itemize
';


$result_texts{'accent_argument'} = 'item

item

item
';

$result_errors{'accent_argument'} = '';

$result_nodes_list{'accent_argument'} = '';

$result_sections_list{'accent_argument'} = '';

$result_sectioning_root{'accent_argument'} = '';

$result_headings_list{'accent_argument'} = '';


$result_converted{'plaintext'}->{'accent_argument'} = '   ẽ item

   ẽ item

   å item
';


$result_converted{'html_text'}->{'accent_argument'} = '<ul class="itemize" style="list-style-type: \'\\1EBD \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\1EBD \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\00E5 \'">
<li>item
</li></ul>
';


$result_converted{'xml'}->{'accent_argument'} = '<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde" bracketed="off">e</accent></itemprepend>
<listitem><prepend><accent type="tilde" bracketed="off">e</accent></prepend> <para>item
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend><accent type="tilde">e</accent></itemprepend>
<listitem><prepend><accent type="tilde">e</accent></prepend> <para>item
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend><accent type="ring" spacesaftercmd=" " bracketed="off">a</accent></itemprepend>
<listitem><prepend><accent type="ring" spacesaftercmd=" " bracketed="off">a</accent></prepend> <para>item
</para></listitem></itemize>
';

1;
