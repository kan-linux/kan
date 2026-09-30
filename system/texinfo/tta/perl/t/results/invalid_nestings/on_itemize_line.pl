use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'on_itemize_line'} = '*document_root C1
 *before_node_section C3
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C8
     *@indent l1
     {ignorable_spaces_after_command: }
     *@titlefont C1 l1
     |EXTRA
     |global_command_number:{1}
      *brace_container C1
       {in titlefont}
     { }
     *@anchor C1 l1
     |EXTRA
     |is_target:{1}
     |normalized:{in-anchor}
      *brace_arg C1
       {in anchor}
     *@footnote C1 l1
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {footnote}
     { }
     *@exdent C1 l1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {exdent}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {in item.\\n}
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
  *@itemize C2 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {on line }
     {ignorable_spaces_after_command: }
     {in item}
   *@end C1 l6
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


$result_texis{'on_itemize_line'} = '@itemize @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
@item in item.
@end itemize

@itemize on line  in item
@end itemize
';


$result_texts{'on_itemize_line'} = 'in item.

';

$result_errors{'on_itemize_line'} = '* W l1|@indent should not appear on @itemize line
 warning: @indent should not appear on @itemize line

* W l1|@titlefont should not appear on @itemize line
 warning: @titlefont should not appear on @itemize line

* W l1|@anchor should not appear on @itemize line
 warning: @anchor should not appear on @itemize line

* W l1|@footnote should not appear on @itemize line
 warning: @footnote should not appear on @itemize line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @itemize line
 warning: @exdent should not appear on @itemize line

* W l5|@item should not appear on @itemize line
 warning: @item should not appear on @itemize line

* E l5|@item outside of table or list
 @item outside of table or list

';

$result_nodes_list{'on_itemize_line'} = '';

$result_sections_list{'on_itemize_line'} = '';

$result_sectioning_root{'on_itemize_line'} = '';

$result_headings_list{'on_itemize_line'} = '';

1;
