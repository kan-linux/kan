use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'center'} = '*document_root C1
 *before_node_section C3
  {empty_line:\\n}
  *@center C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {in center }
    *@code C1 l2
     *brace_container C1
      {in code}
  {empty_line:\\n}
';


$result_texis{'center'} = '
@center  in center @code{in code}

';


$result_texts{'center'} = '
in center in code

';

$result_errors{'center'} = '';

$result_nodes_list{'center'} = '';

$result_sections_list{'center'} = '';

$result_sectioning_root{'center'} = '';

$result_headings_list{'center'} = '';


$result_converted{'plaintext'}->{'center'} = '                          in center ‘in code’

';


$result_converted{'html_text'}->{'center'} = '
<div class="center">in center <code class="code">in code</code>
</div>
';


$result_converted{'xml'}->{'center'} = '
<center spaces="  ">in center <code>in code</code></center>

';


$result_converted{'latex_text'}->{'center'} = '
\\begin{center}
in center \\texttt{in code}
\\end{center}

';


$result_converted{'docbook'}->{'center'} = '
<simpara role="center">in center <literal>in code</literal></simpara>

';

1;
