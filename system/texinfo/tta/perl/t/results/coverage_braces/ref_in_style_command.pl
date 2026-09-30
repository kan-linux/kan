use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ref_in_style_command'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@samp C1 l1
    *brace_container C1
     *@ref C1 l1
      *brace_arg C4
      |EXTRA
      |manual_content:{manula}
      |node_content:{other node}
       {(}
       {manula}
       {)}
       {other node}
   {.}
';


$result_texis{'ref_in_style_command'} = '@samp{@ref{(manula)other node}}.';


$result_texts{'ref_in_style_command'} = '(manula)other node.';

$result_errors{'ref_in_style_command'} = '';

$result_nodes_list{'ref_in_style_command'} = '';

$result_sections_list{'ref_in_style_command'} = '';

$result_sectioning_root{'ref_in_style_command'} = '';

$result_headings_list{'ref_in_style_command'} = '';


$result_converted{'plaintext'}->{'ref_in_style_command'} = '‘(manula)other node’.
';


$result_converted{'html_text'}->{'ref_in_style_command'} = '<p>&lsquo;<samp class="samp"><a data-manual="manula" href="manula.html#other-node">(manula)other node</a></samp>&rsquo;.</p>';


$result_converted{'latex_text'}->{'ref_in_style_command'} = '`\\texttt{(manula)other node}\'.';


$result_converted{'docbook'}->{'ref_in_style_command'} = '<para>&#8216;<literal><link>(manula)other node</link></literal>&#8217;.</para>';

1;
