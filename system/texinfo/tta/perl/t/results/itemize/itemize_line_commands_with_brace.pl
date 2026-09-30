use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'itemize_line_commands_with_brace'} = '*document_root C1
 *before_node_section C3
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@bullet C1 l1
      *brace_container
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {bullet\\n}
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
     *@minus C1 l5
      *brace_container
   *@item C2 l6
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {minus\\n}
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
';


$result_texis{'itemize_line_commands_with_brace'} = '@itemize @bullet{}
@item bullet
@end itemize

@itemize @minus{}
@item minus
@end itemize
';


$result_texts{'itemize_line_commands_with_brace'} = 'bullet

minus
';

$result_errors{'itemize_line_commands_with_brace'} = '';

$result_nodes_list{'itemize_line_commands_with_brace'} = '';

$result_sections_list{'itemize_line_commands_with_brace'} = '';

$result_sectioning_root{'itemize_line_commands_with_brace'} = '';

$result_headings_list{'itemize_line_commands_with_brace'} = '';


$result_converted{'plaintext'}->{'itemize_line_commands_with_brace'} = '   • bullet

   − minus
';


$result_converted{'html_text'}->{'itemize_line_commands_with_brace'} = '<ul class="itemize mark-bullet">
<li>bullet
</li></ul>

<ul class="itemize mark-minus">
<li>minus
</li></ul>
';


$result_converted{'xml'}->{'itemize_line_commands_with_brace'} = '<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend>&bullet;</itemprepend>
<listitem><prepend>&bullet;</prepend> <para>bullet
</para></listitem></itemize>

<itemize commandarg="minus" spaces=" " endspaces=" "><itemprepend>&minus;</itemprepend>
<listitem><prepend>&minus;</prepend> <para>minus
</para></listitem></itemize>
';

1;
