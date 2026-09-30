use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_command_comment'} = '*document_root C1
 *before_node_section C1
  *@table C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:in comment}
     *@code l1
   *table_entry C1
    *table_term C1
     *@item C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
     {table}
';


$result_texis{'table_command_comment'} = '@table @code@c in comment
@item item
@end table';


$result_texts{'table_command_comment'} = 'item
';

$result_errors{'table_command_comment'} = '';

$result_nodes_list{'table_command_comment'} = '';

$result_sections_list{'table_command_comment'} = '';

$result_sectioning_root{'table_command_comment'} = '';

$result_headings_list{'table_command_comment'} = '';


$result_converted{'plaintext'}->{'table_command_comment'} = '‘item’
';


$result_converted{'html_text'}->{'table_command_comment'} = '<dl class="table">
<dt><code class="code">item</code></dt>
</dl>
';


$result_converted{'xml'}->{'table_command_comment'} = '<table commandarg="code" spaces=" " endspaces=" "><!-- c in comment -->
<tableentry><tableterm><item spaces=" "><itemformat command="code">item</itemformat></item>
</tableterm></tableentry></table>';


$result_converted{'latex_text'}->{'table_command_comment'} = '\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{item}}}]
\\end{description}
';


$result_converted{'docbook'}->{'table_command_comment'} = '<variablelist><varlistentry><term><literal>item</literal>
</term></varlistentry></variablelist>';

1;
