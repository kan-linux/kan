use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@multitable C4 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0.6|0.4}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {0.6 0.4}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@headitem C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable headitem }
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {another tab\\n}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable item }
     *@tab C2 l4
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {multitable tab\\n}
       *@c C1
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {rawline_text:comment in multitable}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l6
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable item 2 }
     *@tab C2 l6
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {multitable tab 2\\n}
       *index_entry_command@cindex C1 l7
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |index_entry:I{cp,1}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {index entry within multitable}
    *row C1
    |EXTRA
    |row_number:{4}
     *@item C2 l8
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {lone mu--ltitable item\\n}
   *@end C1 l9
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
  {empty_line:\\n}
  *@multitable C3 l11
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
     *bracketed_arg C1 l11
      {truc}
     { }
     *bracketed_arg C1 l11
      {bidule}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l12
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {truc }
     *@tab C2 l12
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {bidule\\n}
   *@end C1 l13
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


$result_texis{'multitable'} = '
@multitable @columnfractions 0.6 0.4
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable

@multitable {truc} {bidule}
@item truc @tab bidule
@end multitable
';


$result_texts{'multitable'} = '
mu-ltitable headitem another tab
mu-ltitable item multitable tab
mu-ltitable item 2 multitable tab 2
lone mu-ltitable item

truc bidule
';

$result_errors{'multitable'} = '* W l7|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'multitable'} = '';

$result_sections_list{'multitable'} = '';

$result_sectioning_root{'multitable'} = '';

$result_headings_list{'multitable'} = '';

$result_indices_sort_strings{'multitable'} = 'cp:
 index entry within multitable
';


$result_converted{'plaintext'}->{'multitable'} = 'mu-ltitable headitem                        another tab
--------------------------------------------------------------------------
mu-ltitable item                            multitable tab
mu-ltitable item 2                          multitable tab 2
lone mu-ltitable item

truc   bidule
';


$result_converted{'html_text'}->{'multitable'} = '
<table class="multitable">
<thead><tr><th width="60%">mu&ndash;ltitable headitem</th><th width="40%">another tab</th></tr></thead>
<tbody><tr><td width="60%">mu&ndash;ltitable item</td><td width="40%">multitable tab</td></tr>
<tr><td width="60%">mu&ndash;ltitable item 2</td><td width="40%">multitable tab 2
<a class="index-entry-id" id="index-index-entry-within-multitable"></a></td></tr>
<tr><td width="60%">lone mu&ndash;ltitable item</td></tr>
</tbody>
</table>

<table class="multitable">
<tbody><tr><td>truc</td><td>bidule</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'multitable'} = '
<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0.6 0.4"><columnfraction value="0.6"></columnfraction><columnfraction value="0.4"></columnfraction></columnfractions>
<thead><row><entry command="headitem"> <para>mu&textndash;ltitable headitem </para></entry><entry command="tab"> <para>another tab
</para></entry></row></thead><tbody><row><entry command="item"> <para>mu&textndash;ltitable item </para></entry><entry command="tab"> <para>multitable tab
<!-- c comment in multitable -->
</para></entry></row><row><entry command="item"> <para>mu&textndash;ltitable item 2 </para></entry><entry command="tab"> <para>multitable tab 2
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry within multitable</indexterm></cindex>
</para></entry></row><row><entry command="item"> <para>lone mu&textndash;ltitable item
</para></entry></row></tbody></multitable>

<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">truc</columnprototype> <columnprototype bracketed="on">bidule</columnprototype></columnprototypes>
<tbody><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row></tbody></multitable>
';


$result_converted{'latex_text'}->{'multitable'} = '
\\begin{tabular}{m{0.6\\textwidth} m{0.4\\textwidth}}%
mu--ltitable headitem &another tab\\\\
mu--ltitable item &multitable tab\\\\
mu--ltitable item 2 &multitable tab 2
\\index[cp]{index entry within multitable@index entry within multitable}%
\\\\
lone mu--ltitable item&\\\\
\\end{tabular}%

\\begin{tabular}{m{0.4\\textwidth} m{0.6\\textwidth}}%
truc &bidule\\\\
\\end{tabular}%
';


$result_converted{'docbook'}->{'multitable'} = '
<informaltable><tgroup cols="2"><colspec colwidth="60*"></colspec><colspec colwidth="40*"></colspec><thead><row><entry><para>mu&#8211;ltitable headitem </para></entry><entry><para>another tab
</para></entry></row></thead><tbody><row><entry><para>mu&#8211;ltitable item </para></entry><entry><para>multitable tab
<!-- comment in multitable -->
</para></entry></row><row><entry><para>mu&#8211;ltitable item 2 </para></entry><entry><para>multitable tab 2
<indexterm role="cp"><primary>index entry within multitable</primary></indexterm>
</para></entry></row><row><entry><para>lone mu&#8211;ltitable item
</para></entry></row></tbody></tgroup></informaltable>
<informaltable><tgroup cols="2"><colspec colwidth="4*"></colspec><colspec colwidth="6*"></colspec><tbody><row><entry><para>truc </para></entry><entry><para>bidule
</para></entry></row></tbody></tgroup></informaltable>';

1;
