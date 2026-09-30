use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'w_in_multitable'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {aaaaaaaaa}
     { }
     *bracketed_arg C1 l1
      {bbbbbbbbbbb}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@w C1 l2
        *brace_container C2
         {aaaaaaaa\\n}
         {bbbbbbbbbb}
       {\\n}
     *@tab C2 l4
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {gg\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
';


$result_texis{'w_in_multitable'} = '@multitable {aaaaaaaaa} {bbbbbbbbbbb}
@item @w{aaaaaaaa
bbbbbbbbbb}
@tab gg
@end multitable
';


$result_texts{'w_in_multitable'} = 'aaaaaaaa
bbbbbbbbbb
gg
';

$result_errors{'w_in_multitable'} = '';

$result_nodes_list{'w_in_multitable'} = '';

$result_sections_list{'w_in_multitable'} = '';

$result_sectioning_root{'w_in_multitable'} = '';

$result_headings_list{'w_in_multitable'} = '';


$result_converted{'plaintext'}->{'w_in_multitable'} = 'aaaaaaaa bbbbbbbbbbgg
';


$result_converted{'html_text'}->{'w_in_multitable'} = '<table class="multitable">
<tbody><tr><td>aaaaaaaa&nbsp;bbbbbbbbbb<!-- /@w --></td><td>gg</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'w_in_multitable'} = '<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">aaaaaaaaa</columnprototype> <columnprototype bracketed="on">bbbbbbbbbbb</columnprototype></columnprototypes>
<tbody><row><entry command="item"> <para><w>aaaaaaaa
bbbbbbbbbb</w>
</para></entry><entry command="tab"> <para>gg
</para></entry></row></tbody></multitable>
';

1;
