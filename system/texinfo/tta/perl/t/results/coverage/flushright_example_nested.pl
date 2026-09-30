use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'flushright_example_nested'} = '*document_root C1
 *before_node_section C3
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@flushright C3 l2
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C2
     {in   --- flushright\\n}
     {empty_line:\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{flushright}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {flushright}
   *@end C1 l6
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
  *@flushright C3 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@example C3 l9
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C3
     {in   --- example\\n}
     {empty_line:\\n}
     {flush then example\\n}
    *@end C1 l13
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
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushright}
';


$result_texis{'flushright_example_nested'} = '@example
@flushright
in   --- flushright

@end flushright
@end example

@flushright
@example
in   --- example

flush then example
@end example
@end flushright
';


$result_texts{'flushright_example_nested'} = 'in   --- flushright


in   --- example

flush then example
';

$result_errors{'flushright_example_nested'} = '';

$result_nodes_list{'flushright_example_nested'} = '';

$result_sections_list{'flushright_example_nested'} = '';

$result_sectioning_root{'flushright_example_nested'} = '';

$result_headings_list{'flushright_example_nested'} = '';


$result_converted{'plaintext'}->{'flushright_example_nested'} = '                                                    in   --- flushright

     in   --- example

     flush then example
';


$result_converted{'html_text'}->{'flushright_example_nested'} = '<div class="example">
<div class="flushright"><pre class="example-preformatted">in   --- flushright

</pre></div></div>

<div class="flushright"><div class="example">
<pre class="example-preformatted">in   --- example

flush then example
</pre></div>
</div>';


$result_converted{'xml'}->{'flushright_example_nested'} = '<example endspaces=" ">
<flushright endspaces=" ">
<pre xml:space="preserve">in   --- flushright

</pre></flushright>
</example>

<flushright endspaces=" ">
<example endspaces=" ">
<pre xml:space="preserve">in   --- example

flush then example
</pre></example>
</flushright>
';


$result_converted{'latex_text'}->{'flushright_example_nested'} = '\\begin{Texinfoindented}
\\begin{flushright}
\\begin{Texinfopreformatted}%
\\begin{Texinfopreformatted}%
\\ttfamily in   {-}{-}{-} flushright

\\end{Texinfopreformatted}
\\end{Texinfopreformatted}
\\end{flushright}
\\end{Texinfoindented}

\\begin{flushright}
\\begin{Texinfopreformatted}%
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in   {-}{-}{-} example

flush then example
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfopreformatted}
\\end{flushright}
';


$result_converted{'docbook'}->{'flushright_example_nested'} = '<screen>in   --- flushright

</screen>
<screen>in   --- example

flush then example
</screen>';

1;
