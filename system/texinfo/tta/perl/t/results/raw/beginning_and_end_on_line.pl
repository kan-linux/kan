use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'beginning_and_end_on_line'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *@tex C2 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {in tex}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
  {empty_line:\\n}
  *@verbatim C2 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {in verbatim}
   *@end C1 l4
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
  {empty_line:\\n}
  *@html C2 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {in html}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html}
';


$result_texis{'beginning_and_end_on_line'} = '
@tex in tex @end tex

@verbatim in verbatim @end verbatim

@html in html @end html
';


$result_texts{'beginning_and_end_on_line'} = '


';

$result_errors{'beginning_and_end_on_line'} = '* W l2|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l2|unexpected argument on @tex line: in tex
 warning: unexpected argument on @tex line: in tex

* W l4|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l4|unexpected argument on @verbatim line: in verbatim
 warning: unexpected argument on @verbatim line: in verbatim

* W l6|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l6|unexpected argument on @html line: in html
 warning: unexpected argument on @html line: in html

';

$result_nodes_list{'beginning_and_end_on_line'} = '';

$result_sections_list{'beginning_and_end_on_line'} = '';

$result_sectioning_root{'beginning_and_end_on_line'} = '';

$result_headings_list{'beginning_and_end_on_line'} = '';


$result_converted{'plaintext'}->{'beginning_and_end_on_line'} = '';


$result_converted{'xml'}->{'beginning_and_end_on_line'} = '
<tex spaces=" " endspaces=" "> 
</tex>

<verbatim xml:space="preserve" spaces=" " endspaces=" "> 
</verbatim>

<html spaces=" " endspaces=" "> 
</html>
';

1;
