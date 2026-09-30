use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_command_before_end_table'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@table C3 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l2
   *table_entry C2
    *table_term C2
     *@item C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in item}
     *@itemx C1 l4
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in itemx}
    *table_definition C3
     *paragraph C1
      {aaaaa\\n}
     {empty_line:\\n}
     *index_entry_command@vindex C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |index_entry:I{vr,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {var}
   *@end C1 l8
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


$result_texis{'index_command_before_end_table'} = '
@table @code
@item in item
@itemx in itemx
aaaaa

@vindex var
@end table
';


$result_texts{'index_command_before_end_table'} = '
in item
in itemx
aaaaa

';

$result_errors{'index_command_before_end_table'} = '* W l7|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

';

$result_nodes_list{'index_command_before_end_table'} = '';

$result_sections_list{'index_command_before_end_table'} = '';

$result_sectioning_root{'index_command_before_end_table'} = '';

$result_headings_list{'index_command_before_end_table'} = '';

$result_indices_sort_strings{'index_command_before_end_table'} = 'vr:
 var
';


$result_converted{'plaintext'}->{'index_command_before_end_table'} = '‘in item’
‘in itemx’
     aaaaa

';


$result_converted{'html_text'}->{'index_command_before_end_table'} = '
<dl class="table">
<dt><code class="code">in item</code></dt>
<dt><code class="code">in itemx</code></dt>
<dd><p>aaaaa
</p>
<a class="index-entry-id" id="index-var"></a>
</dd>
</dl>
';


$result_converted{'xml'}->{'index_command_before_end_table'} = '
<table commandarg="code" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="code">in item</itemformat></item>
<itemx spaces=" "><itemformat command="code">in itemx</itemformat></itemx>
</tableterm><tableitem><para>aaaaa
</para>
<vindex index="vr" spaces=" "><indexterm index="vr" number="1">var</indexterm></vindex>
</tableitem></tableentry></table>
';


$result_converted{'docbook'}->{'index_command_before_end_table'} = '
<variablelist><varlistentry><term><literal>in item</literal>
</term><term><literal>in itemx</literal>
</term><listitem><para>aaaaa
</para>
<indexterm role="vr"><primary>var</primary></indexterm>
</listitem></varlistentry></variablelist>';

1;
