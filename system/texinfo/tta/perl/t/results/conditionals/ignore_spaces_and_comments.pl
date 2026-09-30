use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ignore_spaces_and_comments'} = '*document_root C1
 *before_node_section C9
  *@ignore C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:No space no comment\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  {empty_line:\\n}
  *@ignore C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
   {raw:Spaces no comment\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  {empty_line:\\n}
  *@ignore C3 l9
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
       |{rawline_text:no space comment}
   {raw:Comment\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  {empty_line:\\n}
  *@ignore C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@comment C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:space comment}
   {raw:Space Comment\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  {empty_line:\\n}
  *@ignore C3 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:}
   {raw:Space Comment no argument\\n}
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
';


$result_texis{'ignore_spaces_and_comments'} = '@ignore
No space no comment
@end ignore

@ignore  
Spaces no comment
@end ignore

@ignore@c no space comment
Comment
@end ignore

@ignore  @comment space comment
Space Comment
@end ignore

@ignore @c
Space Comment no argument
@end ignore
';


$result_texts{'ignore_spaces_and_comments'} = '



';

$result_errors{'ignore_spaces_and_comments'} = '';

$result_nodes_list{'ignore_spaces_and_comments'} = '';

$result_sections_list{'ignore_spaces_and_comments'} = '';

$result_sectioning_root{'ignore_spaces_and_comments'} = '';

$result_headings_list{'ignore_spaces_and_comments'} = '';

1;
