use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'spurious_arg_on_line'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *@tex C3 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {argt}
   *rawpreformatted C1
    {in tex\\n}
   *@end C1 l4
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
  *@verbatim C3 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {argverbatim}
   {raw:in verbatim\\n}
   *@end C1 l8
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
  *@html C3 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {argh}
   *elided_rawpreformatted C1
    {raw:in html\\n}
   *@end C1 l12
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


$result_texis{'spurious_arg_on_line'} = '
@tex argt
in tex
@end tex

@verbatim argverbatim
in verbatim
@end verbatim

@html argh
in html
@end html
';


$result_texts{'spurious_arg_on_line'} = '
in tex

in verbatim

';

$result_errors{'spurious_arg_on_line'} = '* W l2|unexpected argument on @tex line: argt
 warning: unexpected argument on @tex line: argt

* W l6|unexpected argument on @verbatim line: argverbatim
 warning: unexpected argument on @verbatim line: argverbatim

* W l10|unexpected argument on @html line: argh
 warning: unexpected argument on @html line: argh

';

$result_nodes_list{'spurious_arg_on_line'} = '';

$result_sections_list{'spurious_arg_on_line'} = '';

$result_sectioning_root{'spurious_arg_on_line'} = '';

$result_headings_list{'spurious_arg_on_line'} = '';


$result_converted{'plaintext'}->{'spurious_arg_on_line'} = 'in verbatim

';


$result_converted{'xml'}->{'spurious_arg_on_line'} = '
<tex spaces=" " endspaces=" ">
in tex
</tex>

<verbatim xml:space="preserve" spaces=" " endspaces=" ">
in verbatim
</verbatim>

<html spaces=" " endspaces=" ">
in html
</html>
';

1;
