use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_syn_indices'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@syncodeindex C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{cp|fn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cp fn}
   {empty_line:\\n}
 *@node C1 l3 {Top}
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
 *@top C2 l4 {top}
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
 *@node C1 l6 {Chapter index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{Chapter-index}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter index}
 *@chapter C55 l7 {Index}
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
    {Index}
  {empty_line:\\n}
  *paragraph C3
   {definedx truc\\n}
   *@defindex C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{truc}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {truc}
   {after\\n}
  {empty_line:\\n}
  *index_entry_command@trucindex C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{truc,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index truc}
  {empty_line:\\n}
  *@defcodeindex C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{codeidx}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {codeidx}
  {empty_line:\\n}
  *index_entry_command@codeidxindex C1 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{codeidx,1}
   *line_arg C6
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a }
    *@var C1 l17
     *brace_container C1
      {index entry}
    { t}
    *@~ C1 l17
     *following_arg C1
      {e}
    { }
    *@^ C1 l17
     *brace_container C1
      *@dotless C1 l17
       *brace_container C1
        {i}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cindex entry}
  {empty_line:\\n}
  *@syncodeindex C1 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{ky|pg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ky pg}
  {empty_line:\\n}
  *index_entry_command@kindex C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{ky,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc kindex}
  *index_entry_command@pindex C1 l24
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{pg,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {pindex codeidx}
  {empty_line:\\n}
  *@synindex C1 l26
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{truc|cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc cp}
  {empty_line:\\n}
  *@defindex C1 l28
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{abc}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {abc}
  *@defindex C1 l29
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{defg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {defg}
  {empty_line:\\n}
  *@synindex C1 l31
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{abc|defg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {abc defg}
  *@synindex C1 l32
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{defg|ky}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {defg ky}
  {empty_line:\\n}
  *index_entry_command@defgindex C1 l34
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{defg,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {defg index entry}
  {empty_line:\\n}
  *index_entry_command@abcindex C1 l36
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Chapter-index}
  |index_entry:I{abc,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {abc index entry}
  {empty_line:\\n}
  *paragraph C1
   {pg\\n}
  *@printindex C1 l39
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{pg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {pg}
  {empty_line:\\n}
  *paragraph C1
   {ky\\n}
  *@printindex C1 l42
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{ky}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ky}
  {empty_line:\\n}
  *paragraph C1
   {truc\\n}
  *@printindex C1 l45
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{truc}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc}
  {empty_line:\\n}
  *paragraph C1
   {value truc\\n}
  *@printindex C1 l48
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{truc}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {truc}
  {empty_line:\\n}
  *paragraph C1
   {cp\\n}
  *@printindex C1 l51
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *paragraph C1
   {value cp\\n}
  *@printindex C1 l54
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *paragraph C1
   {defg\\n}
  *@printindex C1 l57
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{defg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {defg}
  {empty_line:\\n}
  *paragraph C1
   {abc\\n}
  *@printindex C1 l60
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{8}
  |misc_args:A{abc}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {abc}
  {empty_line:\\n}
  *paragraph C1
   {fn\\n}
  *@printindex C1 l63
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{9}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
';


$result_texis{'def_syn_indices'} = '@syncodeindex cp fn

@node Top
@top top

@node Chapter index
@chapter Index

definedx truc
@defindex truc
after

@trucindex index truc

@defcodeindex codeidx

@codeidxindex a @var{index entry} t@~e @^{@dotless{i}}

@cindex cindex entry

@syncodeindex ky pg

@kindex truc kindex
@pindex pindex codeidx

@synindex truc cp

@defindex abc
@defindex defg

@synindex abc defg
@synindex defg ky

@defgindex defg index entry

@abcindex abc index entry

pg
@printindex pg

ky
@printindex ky

truc
@printindex truc

value truc
@printindex truc

cp
@printindex cp

value cp
@printindex cp

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
';


$result_texts{'def_syn_indices'} = '
top
***

1 Index
*******

definedx truc
after












pg

ky

truc

value truc

cp

value cp

defg

abc

fn
';

$result_errors{'def_syn_indices'} = '* W l42|printing an index `ky\' merged in another one, `pg\'
 warning: printing an index `ky\' merged in another one, `pg\'

* W l45|printing an index `truc\' merged in another one, `fn\'
 warning: printing an index `truc\' merged in another one, `fn\'

* W l48|printing an index `truc\' merged in another one, `fn\'
 warning: printing an index `truc\' merged in another one, `fn\'

* W l51|printing an index `cp\' merged in another one, `fn\'
 warning: printing an index `cp\' merged in another one, `fn\'

* W l54|printing an index `cp\' merged in another one, `fn\'
 warning: printing an index `cp\' merged in another one, `fn\'

* W l57|printing an index `defg\' merged in another one, `pg\'
 warning: printing an index `defg\' merged in another one, `pg\'

* W l60|printing an index `abc\' merged in another one, `pg\'
 warning: printing an index `abc\' merged in another one, `pg\'

';

$result_indices{'def_syn_indices'} = 'abc ->pg
codeidx C
cp C ->fn
defg ->pg
fn C
ky C ->pg
pg C
tp C
truc ->fn
vr C
';

$result_nodes_list{'def_syn_indices'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter index
2|Chapter index
 associated_section: 1 Index
 associated_title_command: 1 Index
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'def_syn_indices'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Index
 section_children:
  1|Index
2|Index
 associated_anchor_command: Chapter index
 associated_node: Chapter index
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'def_syn_indices'} = 'level: -1
list:
 1|top
';

$result_headings_list{'def_syn_indices'} = '';

$result_indices_sort_strings{'def_syn_indices'} = 'codeidx:
 a index entry tẽ î
fn:
 cindex entry
 index truc
pg:
 abc index entry
 defg index entry
 pindex codeidx
 truc kindex
';


$result_converted{'info'}->{'def_syn_indices'} = 'This is , produced from .


File: ,  Node: Top,  Next: Chapter index,  Up: (dir)

top
***

* Menu:

* Chapter index::


File: ,  Node: Chapter index,  Prev: Top,  Up: Top

1 Index
*******

definedx truc after

   pg

 [index ]
* Menu:

* abc index entry:                       Chapter index.         (line 8)
* defg index entry:                      Chapter index.         (line 8)
* pindex codeidx:                        Chapter index.         (line 8)
* truc kindex:                           Chapter index.         (line 8)

   ky

   truc

   value truc

   cp

   value cp

   defg

   abc

   fn

 [index ]
* Menu:

* cindex entry:                          Chapter index.         (line 8)
* index truc:                            Chapter index.         (line 8)


Tag Table:
Node: Top27
Node: Chapter index120

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'def_syn_indices'} = 'top
***

1 Index
*******

definedx truc after

   pg

* Menu:

* abc index entry:                       Chapter index.         (line 8)
* defg index entry:                      Chapter index.         (line 8)
* pindex codeidx:                        Chapter index.         (line 8)
* truc kindex:                           Chapter index.         (line 8)

   ky

   truc

   value truc

   cp

   value cp

   defg

   abc

   fn

* Menu:

* cindex entry:                          Chapter index.         (line 8)
* index truc:                            Chapter index.         (line 8)

';


$result_converted{'html_text'}->{'def_syn_indices'} = '
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#Chapter-index" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#Chapter-index">Index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chapter-index">
<p class="nav-panel">
<span class="nav-button">[<a href="#Chapter-index" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Index"><span>1 Index<a class="copiable-link" href="#Index"> &para;</a></span></h2>

<p>definedx truc
after
</p>
<a class="index-entry-id" id="index-index-truc"></a>


<a class="index-entry-id" id="index-a-index-entry-te-i"></a>

<a class="index-entry-id" id="index-cindex-entry"></a>


<a class="index-entry-id" id="index-truc-kindex"></a>
<a class="index-entry-id" id="index-pindex-codeidx"></a>




<a class="index-entry-id" id="index-defg-index-entry"></a>

<a class="index-entry-id" id="index-abc-index-entry"></a>

<p>pg
</p><div class="printindex pg-printindex">
<table class="index-letters-header-printindex pg-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_pg_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex pg-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-abc-index-entry">abc index entry</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-defg-index-entry">defg index entry</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-P">P</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-pindex-codeidx"><code>pindex codeidx</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-T">T</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-truc-kindex"><code>truc kindex</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex pg-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_pg_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
</div>

<p>ky
</p>
<p>truc
</p>
<p>value truc
</p>
<p>cp
</p>
<p>value cp
</p>
<p>defg
</p>
<p>abc
</p>
<p>fn
</p><div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_fn_letter-I"><b>I</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Chapter-index_fn_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-cindex-entry"><code>cindex entry</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Chapter-index_fn_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-index-truc">index truc</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_fn_letter-I"><b>I</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'def_syn_indices'} = '<syncodeindex spaces=" " from="cp" to="fn" line="cp fn"></syncodeindex>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">Chapter index</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="Chapter-index" spaces=" "><nodename>Chapter index</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Index</sectiontitle>

<para>definedx truc
<defindex spaces=" " value="truc" line="truc"></defindex>
after
</para>
<indexcommand command="trucindex" index="truc" spaces=" "><indexterm index="truc" number="1" incode="0" mergedindex="fn">index truc</indexterm></indexcommand>

<defcodeindex spaces=" " value="codeidx" line="codeidx"></defcodeindex>

<indexcommand command="codeidxindex" index="codeidx" spaces=" "><indexterm index="codeidx" number="1" incode="1">a <var>index entry</var> t<accent type="tilde" bracketed="off">e</accent> <accent type="circ"><dotless>i</dotless></accent></indexterm></indexcommand>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1" incode="1" mergedindex="fn">cindex entry</indexterm></cindex>

<syncodeindex spaces=" " from="ky" to="pg" line="ky pg"></syncodeindex>

<kindex index="ky" spaces=" "><indexterm index="ky" number="1" mergedindex="pg">truc kindex</indexterm></kindex>
<pindex index="pg" spaces=" "><indexterm index="pg" number="1">pindex codeidx</indexterm></pindex>

<synindex spaces=" " from="truc" to="cp" line="truc cp"></synindex>

<defindex spaces=" " value="abc" line="abc"></defindex>
<defindex spaces=" " value="defg" line="defg"></defindex>

<synindex spaces=" " from="abc" to="defg" line="abc defg"></synindex>
<synindex spaces=" " from="defg" to="ky" line="defg ky"></synindex>

<indexcommand command="defgindex" index="defg" spaces=" "><indexterm index="defg" number="1" incode="0" mergedindex="pg">defg index entry</indexterm></indexcommand>

<indexcommand command="abcindex" index="abc" spaces=" "><indexterm index="abc" number="1" incode="0" mergedindex="pg">abc index entry</indexterm></indexcommand>

<para>pg
</para><printindex spaces=" " value="pg" line="pg"></printindex>

<para>ky
</para><printindex spaces=" " value="ky" line="ky"></printindex>

<para>truc
</para><printindex spaces=" " value="truc" line="truc"></printindex>

<para>value truc
</para><printindex spaces=" " value="truc" line="truc"></printindex>

<para>cp
</para><printindex spaces=" " value="cp" line="cp"></printindex>

<para>value cp
</para><printindex spaces=" " value="cp" line="cp"></printindex>

<para>defg
</para><printindex spaces=" " value="defg" line="defg"></printindex>

<para>abc
</para><printindex spaces=" " value="abc" line="abc"></printindex>

<para>fn
</para><printindex spaces=" " value="fn" line="fn"></printindex>
</chapter>
';


$result_converted{'latex'}->{'def_syn_indices'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=codeidx,title=]%
\\makeindex[name=fn,title=]%
\\makeindex[name=pg,title=]%

% style command for var in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextvar[1]{{\\normalfont{}\\textsl{#1}}}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%


\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Index}}
\\label{anchor:Chapter-index}%

definedx truc
after

\\index[fn]{index truc@index truc}%


\\index[codeidx]{a index entry tẽ î@\\texttt{a \\Texinfocommandstyletextvar{index entry}\\ t\\~{e}\\ \\^{\\i{}}}}%

\\index[fn]{cindex entry@\\texttt{cindex entry}}%


\\index[pg]{truc kindex@\\texttt{truc kindex}}%
\\index[pg]{pindex codeidx@\\texttt{pindex codeidx}}%




\\index[pg]{defg index entry@defg index entry}%

\\index[pg]{abc index entry@abc index entry}%

pg
\\printindex[pg]

ky

truc

value truc

cp

value cp

defg

abc

fn
\\printindex[fn]
\\end{document}
';

1;
