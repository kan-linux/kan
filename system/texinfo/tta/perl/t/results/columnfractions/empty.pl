use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty'} = '*document_root C1
 *before_node_section C1
  *@multitable C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l1
      *line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: \\n}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
     {multitable}
';


$result_texis{'empty'} = '@multitable @columnfractions 
@end multitable';


$result_texts{'empty'} = '';

$result_errors{'empty'} = '* E l1|@columnfractions missing argument
 @columnfractions missing argument

';

$result_nodes_list{'empty'} = '';

$result_sections_list{'empty'} = '';

$result_sectioning_root{'empty'} = '';

$result_headings_list{'empty'} = '';


$result_converted{'html_text'}->{'empty'} = '';


$result_converted{'xml'}->{'empty'} = '<multitable spaces=" " endspaces=" "><columnfractions line=" "></columnfractions>
</multitable>';


$result_converted{'latex_text'}->{'empty'} = '\\begin{tabular}{}%
\\end{tabular}%
';

1;
