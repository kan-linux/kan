use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@multitable C3 l2
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
      *bracketed_arg C1 l2
       {AAA}
      {  }
      *bracketed_arg C1 l2
       {BBB}
    *multitable_body C2
     *row C2
     |EXTRA
     |row_number:{1}
      *@item C1 l3
      |EXTRA
      |cell_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {truc }
      *@tab C1 l3
      |EXTRA
      |cell_number:{2}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {bidule example\\n}
     *row C2
     |EXTRA
     |row_number:{2}
      *@item C1 l4
      |EXTRA
      |cell_number:{1}
       *preformatted C5
        {ignorable_spaces_after_command: }
        {begin item example\\n}
        {empty_line:\\n}
        {new paragraph in item. example\\n}
        {empty_line:\\n}
      *@tab C1 l8
      |EXTRA
      |cell_number:{2}
       *preformatted C4
        {ignorable_spaces_after_command: }
        {begin tab example\\n}
        {empty_line:\\n}
        {new paragraph in tab. example\\n}
    *@end C1 l11
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
   *@end C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
     {example}
';


$result_texis{'multitable_in_example'} = '@example
@multitable {AAA}  {BBB}
@item truc @tab bidule example
@item begin item example

new paragraph in item. example

@tab begin tab example

new paragraph in tab. example
@end multitable
@end example';


$result_texts{'multitable_in_example'} = 'truc bidule example
begin item example

new paragraph in item. example

begin tab example

new paragraph in tab. example
';

$result_errors{'multitable_in_example'} = '';

$result_nodes_list{'multitable_in_example'} = '';

$result_sections_list{'multitable_in_example'} = '';

$result_sectioning_root{'multitable_in_example'} = '';

$result_headings_list{'multitable_in_example'} = '';


$result_converted{'plaintext'}->{'multitable_in_example'} = '     truc  bidule example
     begin item examplebegin tab example
           
     new paragraph in item. examplenew paragraph in tab. example

';


$result_converted{'html_text'}->{'multitable_in_example'} = '<div class="example">
<table class="multitable">
<tbody><tr><td><pre class="example-preformatted">truc</pre></td><td><pre class="example-preformatted">bidule example</pre></td></tr>
<tr><td><pre class="example-preformatted">begin item example

new paragraph in item. example</pre></td><td><pre class="example-preformatted">begin tab example

new paragraph in tab. example</pre></td></tr>
</tbody>
</table>
</div>
';


$result_converted{'xml'}->{'multitable_in_example'} = '<example endspaces=" ">
<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">AAA</columnprototype>  <columnprototype bracketed="on">BBB</columnprototype></columnprototypes>
<tbody><row><entry command="item"><pre xml:space="preserve"> truc </pre></entry><entry command="tab"><pre xml:space="preserve"> bidule example
</pre></entry></row><row><entry command="item"><pre xml:space="preserve"> begin item example

new paragraph in item. example

</pre></entry><entry command="tab"><pre xml:space="preserve"> begin tab example

new paragraph in tab. example
</pre></entry></row></tbody></multitable>
</example>';

1;
