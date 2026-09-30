use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'good'} = '*document_root C1
 *before_node_section C1
  *@multitable C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0.4|.6|5.}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {0.4 .6 5.}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
     {multitable}
';


$result_texis{'good'} = '@multitable @columnfractions 0.4 .6 5.
@end multitable';


$result_texts{'good'} = '';

$result_errors{'good'} = '';

$result_nodes_list{'good'} = '';

$result_sections_list{'good'} = '';

$result_sectioning_root{'good'} = '';

$result_headings_list{'good'} = '';


$result_converted{'html_text'}->{'good'} = '';


$result_converted{'xml'}->{'good'} = '<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0.4 .6 5."><columnfraction value="0.4"></columnfraction><columnfraction value=".6"></columnfraction><columnfraction value="5."></columnfraction></columnfractions>
</multitable>';


$result_converted{'latex_text'}->{'good'} = '\\begin{tabular}{m{0.4\\textwidth} m{.6\\textwidth} m{5.\\textwidth}}%
\\end{tabular}%
';

1;
