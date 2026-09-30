use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'misc_raw_comments'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *@html C3 l2
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
       |{rawline_text:comment space}
   *rawpreformatted C1
    {in html }
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html}
    *line_arg C1
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
       |{rawline_text:comment no space}
     {html}
  {empty_line:\\n}
  *@tex C2 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in tex}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
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
       |{rawline_text:comment after end tex}
    |spaces_after_argument:
     |{spaces_after_argument:    }
     {tex}
  {empty_line:\\n}
  *@verbatim C4 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:in verbatim @c in verbatim\\n}
   {raw:in verbatim2\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {verbatim}
';


$result_texis{'misc_raw_comments'} = '
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
';


$result_texts{'misc_raw_comments'} = '
in html 

in verbatim @c in verbatim
in verbatim2
';

$result_errors{'misc_raw_comments'} = '* W l3|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l5|unexpected argument on @tex line: in tex
 warning: unexpected argument on @tex line: in tex

';

$result_nodes_list{'misc_raw_comments'} = '';

$result_sections_list{'misc_raw_comments'} = '';

$result_sectioning_root{'misc_raw_comments'} = '';

$result_headings_list{'misc_raw_comments'} = '';


$result_converted{'plaintext'}->{'misc_raw_comments'} = 'in verbatim @c in verbatim
in verbatim2
';


$result_converted{'xml'}->{'misc_raw_comments'} = '
<html spaces=" " endspaces=" "><!-- c comment space -->
in html </html><!-- c comment no space -->

<tex spaces=" " endspaces=" ">
</tex>    <!-- c comment after end tex -->

<verbatim xml:space="preserve" endspaces=" ">
in verbatim @c in verbatim
in verbatim2
</verbatim>
';

1;
