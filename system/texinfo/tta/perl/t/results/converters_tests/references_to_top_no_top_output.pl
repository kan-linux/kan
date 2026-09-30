use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'references_to_top_no_top_output'} = '*document_root C5
 *before_node_section C2
  *preamble_before_setfilename C1
   *preamble_before_beginning C1
    {text_before_beginning:\\n}
  *preamble_before_content C4
   *@setfilename C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{references_to_top_no_top_output.info}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {references_to_top_no_top_output.info}
   {empty_line:\\n}
   *@copying C3 l4
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C3
     {Copying\\n}
     *@anchor C1 l6
     |EXTRA
     |is_target:{1}
     |normalized:{a-in-copying}
      *brace_arg C1
      |EXTRA
      |element_region:{copying}
       {a in copying}
     {spaces_after_close_brace:\\n}
    *@end C1 l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
 *@node C1 l9 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C19 l10 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *paragraph C1
   {Begin Top\\n}
  {empty_line:\\n}
  *@anchor C1 l14
  |EXTRA
  |is_target:{1}
  |normalized:{a-in-top}
   *brace_arg C1
    {a in top}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Paragraph }
   *@anchor C1 l16
   |EXTRA
   |is_target:{1}
   |normalized:{a-in-paragraph-in-top}
    *brace_arg C1
     {a in paragraph in top}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@footnote C1 l18
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C2
      {in footnote }
      *@anchor C1 l18
      |EXTRA
      |is_target:{1}
      |normalized:{a-in-footnote}
       *brace_arg C1
        {a in footnote}
   {\\n}
  {empty_line:\\n}
  *@insertcopying C1 l20
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@float C5 l22
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{list}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{My-Flist}
   *arguments_line C2
    *block_line_arg C1
     {list}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {My Flist}
   *paragraph C3
    {In Flist\\n}
    *@anchor C1 l24
    |EXTRA
    |is_target:{1}
    |normalized:{a-in-float}
     *brace_arg C1
      {a in float}
    {.\\n}
   *@caption C1 l25
    *brace_command_context C1
     *paragraph C2
      {Caption Flist. }
      *@anchor C1 l25
      |EXTRA
      |is_target:{1}
      |normalized:{a-in-caption}
       *brace_arg C1
        {a in caption}
   {spaces_after_close_brace:\\n}
   *@end C1 l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l28
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index in Top}
  {empty_line:\\n}
  *paragraph C1
   {End of Top\\n}
  {empty_line:\\n}
 *@node C1 l32 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C11 l33 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
  {empty_line:\\n}
  *paragraph C12
   *@pxref C1 l35
    *brace_arg C1
    |EXTRA
    |node_content:{a in copying}
    |normalized:{a-in-copying}
     {a in copying}
   {.\\n}
   *@pxref C1 l36
    *brace_arg C1
    |EXTRA
    |node_content:{a in top}
    |normalized:{a-in-top}
     {a in top}
   {\\n}
   *@pxref C1 l37
    *brace_arg C1
    |EXTRA
    |node_content:{a in footnote}
    |normalized:{a-in-footnote}
     {a in footnote}
   {\\n}
   *@pxref C1 l38
    *brace_arg C1
    |EXTRA
    |node_content:{a in float}
    |normalized:{a-in-float}
     {a in float}
   {\\n}
   *@pxref C1 l39
    *brace_arg C1
    |EXTRA
    |node_content:{a in caption}
    |normalized:{a-in-caption}
     {a in caption}
   {\\n}
   *@pxref C1 l40
    *brace_arg C1
    |EXTRA
    |node_content:{a in paragraph in top}
    |normalized:{a-in-paragraph-in-top}
     {a in paragraph in top}
   {\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l42
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap index}
  {empty_line:\\n}
  *@printindex C1 l44
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *@float C5 l46
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1.1}
  |float_type:{list}
  |global_command_number:{2}
  |is_target:{1}
  |normalized:{Main-Flist}
   *arguments_line C2
    *block_line_arg C1
     {list}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Main Flist}
   *paragraph C1
    {In Main\\n}
   *@caption C1 l48
    *brace_command_context C1
     *paragraph C1
      {Caption Main}
   {spaces_after_close_brace:\\n}
   *@end C1 l49
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l51
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{list}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {list}
';


$result_texis{'references_to_top_no_top_output'} = '
@setfilename references_to_top_no_top_output.info

@copying
Copying
@anchor{a in copying}
@end copying

@node Top
@top top

Begin Top

@anchor{a in top}

Paragraph @anchor{a in paragraph in top}.

@footnote{in footnote @anchor{a in footnote}}

@insertcopying

@float list, My Flist
In Flist
@anchor{a in float}.
@caption{Caption Flist. @anchor{a in caption}}
@end float

@cindex index in Top

End of Top

@node chapter
@chapter Chap

@pxref{a in copying}.
@pxref{a in top}
@pxref{a in footnote}
@pxref{a in float}
@pxref{a in caption}
@pxref{a in paragraph in top}

@cindex chap index

@printindex cp

@float list, Main Flist
In Main
@caption{Caption Main}
@end float

@listoffloats list
';


$result_texts{'references_to_top_no_top_output'} = '

top
***

Begin Top


Paragraph .




list, My Flist
In Flist
.


End of Top

1 Chap
******

a in copying.
a in top
a in footnote
a in float
a in caption
a in paragraph in top



list, Main Flist
In Main

';

$result_errors{'references_to_top_no_top_output'} = '';

$result_floats{'references_to_top_no_top_output'} = 'list: 2
 F1: {My-Flist}
  C: Caption Flist. @anchor{a in caption}
 F1.1: {Main-Flist}
  C: Caption Main
';

$result_nodes_list{'references_to_top_no_top_output'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'references_to_top_no_top_output'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'references_to_top_no_top_output'} = 'level: -1
list:
 1|top
';

$result_headings_list{'references_to_top_no_top_output'} = '';

$result_indices_sort_strings{'references_to_top_no_top_output'} = 'cp:
 chap index
 index in Top
';


$result_converted{'html_text'}->{'references_to_top_no_top_output'} = '

<a class="node" id="Top"></a><p class="nav-panel">
<span class="nav-button">[<a href="#chapter" title="Index" rel="index">Index</a>]</span></p>
<a class="top" id="top"></a><ul class="mini-toc">
<li><a href="#chapter">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>see <a class="pxref" href="#a-in-copying">a in copying</a>.
see <a class="pxref" href="#a-in-top">a in top</a>
see <a class="pxref" href="#a-in-footnote">a in footnote</a>
see <a class="pxref" href="#a-in-float">a in float</a>
see <a class="pxref" href="#a-in-caption">a in caption</a>
see <a class="pxref" href="#a-in-paragraph-in-top">a in paragraph in top</a>
</p>
<a class="index-entry-id" id="index-chap-index"></a>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter_cp_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-chap-index">chap index</a></td><td class="printindex-index-section"><a href="#chapter">chapter</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<div class="float" id="Main-Flist">
<p>In Main
</p><div class="caption"><p><strong class="strong">list 1.1: </strong>Caption Main</p></div></div>
<dl class="listoffloats">
<dt><a href="#My-Flist">list 1</a></dt><dd class="caption-in-listoffloats"><p>Caption Flist. </p></dd>
<dt><a href="#Main-Flist">list 1.1</a></dt><dd class="caption-in-listoffloats"><p>Caption Main</p></dd>
</dl>
</div>
';

1;
