use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'good_space_comment'} = '*document_root C1
 *before_node_section C1
  *@multitable C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0|1}
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
         |{rawline_text:space comment}
      |spaces_after_argument:
       |{spaces_after_argument:  }
       {0 1}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
     {multitable}
';


$result_texis{'good_space_comment'} = '@multitable @columnfractions 0 1  @c space comment
@end multitable';


$result_texts{'good_space_comment'} = '';

$result_errors{'good_space_comment'} = '';

$result_nodes_list{'good_space_comment'} = '';

$result_sections_list{'good_space_comment'} = '';

$result_sectioning_root{'good_space_comment'} = '';

$result_headings_list{'good_space_comment'} = '';


$result_converted{'html_text'}->{'good_space_comment'} = '';


$result_converted{'xml'}->{'good_space_comment'} = '<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0 1  @c space comment"><columnfraction value="0"></columnfraction><columnfraction value="1"></columnfraction></columnfractions><!-- c space comment -->
</multitable>';


$result_converted{'latex_text'}->{'good_space_comment'} = '\\begin{tabular}{m{0\\textwidth} m{1\\textwidth}}%
\\end{tabular}%
';

1;
