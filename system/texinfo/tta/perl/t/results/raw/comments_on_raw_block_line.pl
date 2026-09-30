use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comments_on_raw_block_line'} = '*document_root C1
 *before_node_section C3
  *@html C3 l1
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
       |{rawline_text:Hcomment}
   *elided_rawpreformatted C1
    {raw:In HTML\\n}
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
       |{rawline_text:Hafter end}
     {html}
  {empty_line:\\n}
  *@tex C3 l5
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
       |{rawline_text:Tcomment}
   *rawpreformatted C1
    {In TeX\\n}
   *@end C1 l7
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
       |{rawline_text:Tafter end}
     {tex}
';


$result_texis{'comments_on_raw_block_line'} = '@html@c Hcomment
In HTML
@end html@c Hafter end

@tex@c Tcomment
In TeX
@end tex@c Tafter end
';


$result_texts{'comments_on_raw_block_line'} = '
In TeX
';

$result_errors{'comments_on_raw_block_line'} = '';

$result_nodes_list{'comments_on_raw_block_line'} = '';

$result_sections_list{'comments_on_raw_block_line'} = '';

$result_sectioning_root{'comments_on_raw_block_line'} = '';

$result_headings_list{'comments_on_raw_block_line'} = '';


$result_converted{'plaintext'}->{'comments_on_raw_block_line'} = '';


$result_converted{'xml'}->{'comments_on_raw_block_line'} = '<html endspaces=" "><!-- c Hcomment -->
In HTML
</html><!-- c Hafter end -->

<tex endspaces=" "><!-- c Tcomment -->
In TeX
</tex><!-- c Tafter end -->
';

1;
