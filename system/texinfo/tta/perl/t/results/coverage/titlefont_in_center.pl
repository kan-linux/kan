use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'titlefont_in_center'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@center C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@titlefont C1 l2
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {A manual}
';


$result_texis{'titlefont_in_center'} = '
@center @titlefont{A manual}
';


$result_texts{'titlefont_in_center'} = '
A manual
';

$result_errors{'titlefont_in_center'} = '';

$result_nodes_list{'titlefont_in_center'} = '';

$result_sections_list{'titlefont_in_center'} = '';

$result_sectioning_root{'titlefont_in_center'} = '';

$result_headings_list{'titlefont_in_center'} = '';


$result_converted{'plaintext'}->{'titlefont_in_center'} = '                               A manual
                               ********
';


$result_converted{'html_text'}->{'titlefont_in_center'} = '
<div class="center"><h1 class="titlefont">A manual</h1>
</div>';


$result_converted{'xml'}->{'titlefont_in_center'} = '
<center spaces=" "><titlefont>A manual</titlefont></center>
';


$result_converted{'latex_text'}->{'titlefont_in_center'} = '
\\begin{center}
{\\huge \\bfseries A manual}
\\end{center}
';


$result_converted{'docbook'}->{'titlefont_in_center'} = '
<simpara role="center">A manual</simpara>
';

1;
