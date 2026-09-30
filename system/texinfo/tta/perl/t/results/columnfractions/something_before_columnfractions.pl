use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'something_before_columnfractions'} = '*document_root C1
 *before_node_section C1
  *@multitable C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C2
     {aaa }
     *@columnfractions C1 l1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0.3|0.7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {0.3 0.7}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
     {multitable}
';


$result_texis{'something_before_columnfractions'} = '@multitable aaa @columnfractions 0.3 0.7
@end multitable';


$result_texts{'something_before_columnfractions'} = '';

$result_errors{'something_before_columnfractions'} = '* W l1|unexpected argument on @multitable line: @columnfractions 0.3 0.7

 warning: unexpected argument on @multitable line: @columnfractions 0.3 0.7


* W l1|empty multitable
 warning: empty multitable

';

$result_nodes_list{'something_before_columnfractions'} = '';

$result_sections_list{'something_before_columnfractions'} = '';

$result_sectioning_root{'something_before_columnfractions'} = '';

$result_headings_list{'something_before_columnfractions'} = '';


$result_converted{'html_text'}->{'something_before_columnfractions'} = '';


$result_converted{'xml'}->{'something_before_columnfractions'} = '<multitable spaces=" " endspaces=" "><columnprototypes>aaa <columnfractions spaces=" " line="0.3 0.7"><columnfraction value="0.3"></columnfraction><columnfraction value="0.7"></columnfraction></columnfractions>
</columnprototypes></multitable>';


$result_converted{'latex_text'}->{'something_before_columnfractions'} = '\\begin{tabular}{}%
\\end{tabular}%
';

1;
