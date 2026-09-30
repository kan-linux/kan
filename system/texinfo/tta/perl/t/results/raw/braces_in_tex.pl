use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'braces_in_tex'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *@tex C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C5
    {$$ \\n}
    {\\chi^2 = \\sum_{i=1}^N\\n}
    {\\left(y_i - (a + b x_i)\\n}
    {\\over \\sigma_i\\right)^2 \\n}
    {$$\\n}
   *@end C1 l8
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
  {empty_line:\\n}
  *@example C3 l11
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    *@tex C3 l12
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *rawpreformatted C5
      {$$ \\n}
      {\\chi^2 = \\sum_{i=1}^N\\n}
      {\\left(y_i - (a + b x_i)\\n}
      {\\over \\sigma_i\\right)^2 \\n}
      {$$\\n}
     *@end C1 l18
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
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
';


$result_texis{'braces_in_tex'} = '
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex


@example
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex
@end example

';


$result_texts{'braces_in_tex'} = '
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$


$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$

';

$result_errors{'braces_in_tex'} = '';

$result_nodes_list{'braces_in_tex'} = '';

$result_sections_list{'braces_in_tex'} = '';

$result_sectioning_root{'braces_in_tex'} = '';

$result_headings_list{'braces_in_tex'} = '';


$result_converted{'plaintext'}->{'braces_in_tex'} = '';


$result_converted{'xml'}->{'braces_in_tex'} = '
<tex endspaces=" ">
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
</tex>


<example endspaces=" ">
<pre xml:space="preserve"><tex endspaces=" ">
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
</tex>
</pre></example>

';

1;
