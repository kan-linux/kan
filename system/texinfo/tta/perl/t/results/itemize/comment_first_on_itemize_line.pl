use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_first_on_itemize_line'} = '*document_root C1
 *before_node_section C1
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
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
       |{rawline_text:comment on itemize line}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {first\\n}
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
';


$result_texis{'comment_first_on_itemize_line'} = '@itemize @c comment on itemize line
@item first
@end itemize
';


$result_texts{'comment_first_on_itemize_line'} = 'first
';

$result_errors{'comment_first_on_itemize_line'} = '';

$result_nodes_list{'comment_first_on_itemize_line'} = '';

$result_sections_list{'comment_first_on_itemize_line'} = '';

$result_sectioning_root{'comment_first_on_itemize_line'} = '';

$result_headings_list{'comment_first_on_itemize_line'} = '';


$result_converted{'plaintext'}->{'comment_first_on_itemize_line'} = '   • first
';


$result_converted{'html_text'}->{'comment_first_on_itemize_line'} = '<ul class="itemize mark-bullet">
<li>first
</li></ul>
';


$result_converted{'xml'}->{'comment_first_on_itemize_line'} = '<itemize spaces=" " endspaces=" "><!-- c comment on itemize line -->
<listitem><prepend>&bullet;</prepend> <para>first
</para></listitem></itemize>
';

1;
