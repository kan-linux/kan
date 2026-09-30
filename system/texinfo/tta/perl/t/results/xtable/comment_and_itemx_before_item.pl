use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_and_itemx_before_item'} = '*document_root C1
 *before_node_section C1
  *@table C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l1
   *table_entry C1
    *table_term C2
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:comment}
     *@itemx C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in itemx}
   *@end C1 l4
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
';


$result_texis{'comment_and_itemx_before_item'} = '@table @code
@c comment
@itemx in itemx
@end table
';


$result_texts{'comment_and_itemx_before_item'} = 'in itemx
';

$result_errors{'comment_and_itemx_before_item'} = '* E l3|@itemx should not begin @table
 @itemx should not begin @table

';

$result_nodes_list{'comment_and_itemx_before_item'} = '';

$result_sections_list{'comment_and_itemx_before_item'} = '';

$result_sectioning_root{'comment_and_itemx_before_item'} = '';

$result_headings_list{'comment_and_itemx_before_item'} = '';


$result_converted{'plaintext'}->{'comment_and_itemx_before_item'} = '‘in itemx’
';


$result_converted{'html_text'}->{'comment_and_itemx_before_item'} = '<dl class="table">
<dt><dt><code class="code">in itemx</code></dt>
</dl>
';


$result_converted{'xml'}->{'comment_and_itemx_before_item'} = '<table commandarg="code" spaces=" " endspaces=" ">
<tableentry><tableterm><!-- c comment -->
<itemx spaces=" "><itemformat command="code">in itemx</itemformat></itemx>
</tableterm></tableentry></table>
';


$result_converted{'docbook'}->{'comment_and_itemx_before_item'} = '<variablelist><varlistentry><term><!-- comment -->
<term><literal>in itemx</literal>
</term></varlistentry></variablelist>';

1;
