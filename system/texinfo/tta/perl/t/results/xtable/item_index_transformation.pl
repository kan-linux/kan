use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'item_index_transformation'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C9 l2 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
  {empty_line:\\n}
  *@table C4 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l4
   *table_entry C2
    *table_term C6
     *index_entry_command@cindex C1 l9
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {After1}
     *index_entry_command@cindex C1 l10
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {After2}
     *index_entry_command@cindex C1 l5
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {Before1}
     *@item C1 l6
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |associated_index_entry:I{cp,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {one}
     *@itemx C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {onex}
     *@itemx C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {oney}
    *table_definition C1
     *paragraph C1
      {AAA\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l12
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {two}
    *table_definition C1
     *paragraph C1
      {BBB\\n}
   *@end C1 l14
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
  {empty_line:\\n}
  *@table C4 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l16
   *table_entry C2
    *table_term C5
     *index_entry_command@cindex C1 l20
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,4}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {after1}
     *index_entry_command@cindex C1 l21
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,5}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {after2}
     *@item C1 l17
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |associated_index_entry:I{cp,4}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {three}
     *@itemx C1 l18
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {threex}
     *@itemx C1 l19
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {zzzz}
    *table_definition C1
     *paragraph C1
      {CCCC\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l23
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {zzzz2}
    *table_definition C1
     *paragraph C1
      {DDDDD\\n}
   *@end C1 l25
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
  {empty_line:\\n}
  *@table C4 l27
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l27
   *table_entry C2
    *table_term C4
     *index_entry_command@cindex C1 l28
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,6}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {before1}
     *index_entry_command@cindex C1 l29
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {before2}
     *@item C1 l30
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |associated_index_entry:I{cp,6}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {four}
     *@itemx C1 l31
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {fourx}
    *table_definition C1
     *paragraph C1
      {EEEE\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l33
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {foour}
    *table_definition C1
     *paragraph C1
      {FFFFf\\n}
   *@end C1 l35
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
  {empty_line:\\n}
  *@table C4 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l37
   *table_entry C2
    *table_term C1
     *@item C1 l38
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {five}
    *table_definition C1
     *paragraph C1
      {GGGG\\n}
   *table_entry C2
    *table_term C4
     *index_entry_command@cindex C1 l42
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,8}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {after6}
     *index_entry_command@cindex C1 l43
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,9}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {after7}
     *@item C1 l40
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |associated_index_entry:I{cp,8}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {six}
     *@itemx C1 l41
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {sixx}
    *table_definition C1
     *paragraph C1
      {HHHHHH\\n}
   *@end C1 l45
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


$result_texis{'item_index_transformation'} = '@node chap
@chapter Chapter

@table @asis
@cindex After1
@cindex After2
@cindex Before1
@item one
@itemx onex
@itemx oney
AAA
@item two
BBB
@end table

@table @asis
@cindex after1
@cindex after2
@item three
@itemx threex
@itemx zzzz
CCCC
@item zzzz2
DDDDD
@end table

@table @asis
@cindex before1
@cindex before2
@item four
@itemx fourx
EEEE
@item foour
FFFFf
@end table

@table @asis
@item five
GGGG
@cindex after6
@cindex after7
@item six
@itemx sixx
HHHHHH
@end table
';


$result_texts{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
AAA
two
BBB

three
threex
zzzz
CCCC
zzzz2
DDDDD

four
fourx
EEEE
foour
FFFFf

five
GGGG
six
sixx
HHHHHH
';

$result_errors{'item_index_transformation'} = '';

$result_nodes_list{'item_index_transformation'} = '1|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
';

$result_sections_list{'item_index_transformation'} = '1|Chapter
 associated_anchor_command: chap
 associated_node: chap
';

$result_sectioning_root{'item_index_transformation'} = 'level: 0
list:
 1|Chapter
';

$result_headings_list{'item_index_transformation'} = '';

$result_indices_sort_strings{'item_index_transformation'} = 'cp:
 After1
 after1
 After2
 after2
 after6
 after7
 Before1
 before1
 before2
';


$result_converted{'plaintext'}->{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
     AAA
two
     BBB

three
threex
zzzz
     CCCC
zzzz2
     DDDDD

four
fourx
     EEEE
foour
     FFFFf

five
     GGGG
six
sixx
     HHHHHH
';


$result_converted{'html_text'}->{'item_index_transformation'} = '<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="table">
<dt><a class="index-entry-id" id="index-After2"></a>
<a class="index-entry-id" id="index-Before1"></a>
<a id="index-After1"></a><span>one<a class="copiable-link" href="#index-After1"> &para;</a></span></dt>
<dt>onex</dt>
<dt>oney</dt>
<dd><p>AAA
</p></dd>
<dt>two</dt>
<dd><p>BBB
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-after2"></a>
<a id="index-after1"></a><span>three<a class="copiable-link" href="#index-after1"> &para;</a></span></dt>
<dt>threex</dt>
<dt>zzzz</dt>
<dd><p>CCCC
</p></dd>
<dt>zzzz2</dt>
<dd><p>DDDDD
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-before2"></a>
<a id="index-before1"></a><span>four<a class="copiable-link" href="#index-before1"> &para;</a></span></dt>
<dt>fourx</dt>
<dd><p>EEEE
</p></dd>
<dt>foour</dt>
<dd><p>FFFFf
</p></dd>
</dl>

<dl class="table">
<dt>five</dt>
<dd><p>GGGG
</p></dd>
<dt><a class="index-entry-id" id="index-after7"></a>
<a id="index-after6"></a><span>six<a class="copiable-link" href="#index-after6"> &para;</a></span></dt>
<dt>sixx</dt>
<dd><p>HHHHHH
</p></dd>
</dl>
</div>
';


$result_converted{'xml'}->{'item_index_transformation'} = '<node identifier="chap" spaces=" "><nodename>chap</nodename></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="2">After1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="3">After2</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">Before1</indexterm></cindex>
<item spaces=" "><itemformat command="asis">one</itemformat></item>
<itemx spaces=" "><itemformat command="asis">onex</itemformat></itemx>
<itemx spaces=" "><itemformat command="asis">oney</itemformat></itemx>
</tableterm><tableitem><para>AAA
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">two</itemformat></item>
</tableterm><tableitem><para>BBB
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="4">after1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="5">after2</indexterm></cindex>
<item spaces=" "><itemformat command="asis">three</itemformat></item>
<itemx spaces=" "><itemformat command="asis">threex</itemformat></itemx>
<itemx spaces=" "><itemformat command="asis">zzzz</itemformat></itemx>
</tableterm><tableitem><para>CCCC
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">zzzz2</itemformat></item>
</tableterm><tableitem><para>DDDDD
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="6">before1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="7">before2</indexterm></cindex>
<item spaces=" "><itemformat command="asis">four</itemformat></item>
<itemx spaces=" "><itemformat command="asis">fourx</itemformat></itemx>
</tableterm><tableitem><para>EEEE
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">foour</itemformat></item>
</tableterm><tableitem><para>FFFFf
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">five</itemformat></item>
</tableterm><tableitem><para>GGGG
</para></tableitem></tableentry><tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="8">after6</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="9">after7</indexterm></cindex>
<item spaces=" "><itemformat command="asis">six</itemformat></item>
<itemx spaces=" "><itemformat command="asis">sixx</itemformat></itemx>
</tableterm><tableitem><para>HHHHHH
</para></tableitem></tableentry></table>
</chapter>
';


$result_converted{'docbook'}->{'item_index_transformation'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<variablelist><varlistentry><term><indexterm role="cp"><primary>After1</primary></indexterm>
<indexterm role="cp"><primary>After2</primary></indexterm>
<indexterm role="cp"><primary>Before1</primary></indexterm>
one
</term><term>onex
</term><term>oney
</term><listitem><para>AAA
</para></listitem></varlistentry><varlistentry><term>two
</term><listitem><para>BBB
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>after1</primary></indexterm>
<indexterm role="cp"><primary>after2</primary></indexterm>
three
</term><term>threex
</term><term>zzzz
</term><listitem><para>CCCC
</para></listitem></varlistentry><varlistentry><term>zzzz2
</term><listitem><para>DDDDD
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>before1</primary></indexterm>
<indexterm role="cp"><primary>before2</primary></indexterm>
four
</term><term>fourx
</term><listitem><para>EEEE
</para></listitem></varlistentry><varlistentry><term>foour
</term><listitem><para>FFFFf
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term>five
</term><listitem><para>GGGG
</para></listitem></varlistentry><varlistentry><term><indexterm role="cp"><primary>after6</primary></indexterm>
<indexterm role="cp"><primary>after7</primary></indexterm>
six
</term><term>sixx
</term><listitem><para>HHHHHH
</para></listitem></varlistentry></variablelist></chapter>
';

1;
