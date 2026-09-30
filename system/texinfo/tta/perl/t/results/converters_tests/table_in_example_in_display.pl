use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_in_example_in_display'} = '*document_root C1
 *before_node_section C1
  *@display C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@example C3 l2
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@table C3 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *arguments_line C1
      *block_line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@asis l3
     *table_entry C2
      *table_term C1
       *@item C1 l4
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {item}
      *table_definition C1
       *preformatted C1
        {Line\\n}
     *@end C1 l6
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{table}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {table}
    *@end C1 l7
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
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{display}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {display}
';


$result_texis{'table_in_example_in_display'} = '@display
@example
@table @asis
@item item
Line
@end table
@end example
@end display
';


$result_texts{'table_in_example_in_display'} = 'item
Line
';

$result_errors{'table_in_example_in_display'} = '';

$result_nodes_list{'table_in_example_in_display'} = '';

$result_sections_list{'table_in_example_in_display'} = '';

$result_sectioning_root{'table_in_example_in_display'} = '';

$result_headings_list{'table_in_example_in_display'} = '';


$result_converted{'plaintext'}->{'table_in_example_in_display'} = '          item
               Line
';


$result_converted{'html_text'}->{'table_in_example_in_display'} = '<div class="display">
<div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code">item</code></dt>
<dd><pre class="example-preformatted">Line
</pre></dd>
</dl>
</div>
</div>
';


$result_converted{'xml'}->{'table_in_example_in_display'} = '<display endspaces=" ">
<example endspaces=" ">
<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">Line
</pre></tableitem></tableentry></table>
</example>
</display>
';


$result_converted{'docbook'}->{'table_in_example_in_display'} = '<variablelist><varlistentry><term>item
</term><listitem><screen>Line
</screen></listitem></varlistentry></variablelist>';


$result_converted{'latex_text'}->{'table_in_example_in_display'} = '\\begin{Texinfoindented}
\\begin{Texinfoindented}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
item}}]
\\begin{Texinfopreformatted}%
\\ttfamily Line
\\end{Texinfopreformatted}
\\end{description}
\\end{Texinfoindented}
\\end{Texinfoindented}
';

1;
