use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bye_on_end_command_line'} = '*document_root C2
 *before_node_section C1
  *@cartouche C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in cartouche.\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
     {cartouche}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'bye_on_end_command_line'} = '@cartouche
in cartouche.
@end cartouche@bye
';


$result_texts{'bye_on_end_command_line'} = 'in cartouche.
';

$result_errors{'bye_on_end_command_line'} = '* W l3|@bye should only appear at the beginning of a line
 warning: @bye should only appear at the beginning of a line

* W l3|@bye should not appear in @end
 warning: @bye should not appear in @end

';

$result_nodes_list{'bye_on_end_command_line'} = '';

$result_sections_list{'bye_on_end_command_line'} = '';

$result_sectioning_root{'bye_on_end_command_line'} = '';

$result_headings_list{'bye_on_end_command_line'} = '';


$result_converted{'plaintext'}->{'bye_on_end_command_line'} = 'in cartouche.
';


$result_converted{'html_text'}->{'bye_on_end_command_line'} = '<table class="cartouche"><tr><td>
<p>in cartouche.
</p></td></tr></table>
';


$result_converted{'xml'}->{'bye_on_end_command_line'} = '<cartouche endspaces=" ">
<para>in cartouche.
</para></cartouche><bye></bye>
';


$result_converted{'latex_text'}->{'bye_on_end_command_line'} = '\\begin{mdframed}[style=Texinfocartouche]
in cartouche.
\\end{mdframed}
';


$result_converted{'docbook'}->{'bye_on_end_command_line'} = '';

1;
