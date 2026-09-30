use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiple_in_preamble_before_node'} = '*document_root C5
 *before_node_section C5
  *preamble_before_content C6
   *@documentlanguage C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {fr}
   {empty_line:\\n}
   *@copying C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@defivar C3 l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *def_line C1 l4
     |EXTRA
     |def_command:{defivar}
     |def_index_element:
      |* C3
       |* C1
        |*def_line_arg C1
         |{a}
       |{ de }
       |* C1
        |*def_line_arg C1
         |{copying}
     |def_index_ref_element:
      |* C3
       |* C1
        |*def_line_arg C1
         |{a}
       |{ of }
       |* C1
        |*def_line_arg C1
         |{copying}
     |documentlanguage:{fr}
     |element_region:{copying}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defivar}
      *block_line_arg C7
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
       |INFO
       |inserted:{1}
        *untranslated_def_line_arg C1
        |EXTRA
        |documentlanguage:{fr}
        |translation_context:{category of instance variables in object-oriented programming for @defivar}
         {untranslated:Instance Variable}
       (i){spaces: }
       *def_class C1
        *def_line_arg C1
         {copying}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {a}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {b}
     *def_item C1
      *paragraph C2
       *@error C1 l5
        *brace_container
       {\\n}
     *@end C1 l6
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{defivar}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {defivar}
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
   *@documentlanguage C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{2}
   |text_arg:{hr}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {hr}
   {empty_line:\\n}
  *paragraph C1
   {Text ending the preamble\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |text_arg:{de}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {de}
  {empty_line:\\n}
 *@node C1 l15 {Top}
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
 *@top C2 l16 {top section}
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
    {top section}
  {empty_line:\\n}
 *@node C1 l18 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C3 l19 {chap}
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
    {chap}
  {empty_line:\\n}
  *@defivar C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l21
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ von }
     |* C1
      |*def_line_arg C1
       |{c}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c}
   |documentlanguage:{de}
   |element_node:{chapter}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{de}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {CCC}
   *def_item C1
    *paragraph C2
     *@error C1 l22
      *brace_container
     {\\n}
   *@end C1 l23
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
';


$result_texis{'multiple_in_preamble_before_node'} = '@documentlanguage fr

@copying
@defivar copying a b
@error{}
@end defivar
@end copying

@documentlanguage hr

Text ending the preamble

@documentlanguage de

@node Top
@top top section

@node chapter
@chapter chap

@defivar c BBB CCC
@error{}
@end defivar
';


$result_texts{'multiple_in_preamble_before_node'} = '


Text ending the preamble


top section
***********

1 chap
******

Instanzvariable of c: BBB CCC
error->
';

$result_errors{'multiple_in_preamble_before_node'} = '';

$result_nodes_list{'multiple_in_preamble_before_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'multiple_in_preamble_before_node'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'multiple_in_preamble_before_node'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'multiple_in_preamble_before_node'} = '';

$result_indices_sort_strings{'multiple_in_preamble_before_node'} = 'vr:
 a de copying
 BBB von c
';


$result_converted{'plaintext'}->{'multiple_in_preamble_before_node'} = 'Text ending the preamble

top section
***********

1 chap
******

 -- Instanzvariable of c: BBB CCC
     error→
';


$result_converted{'info'}->{'multiple_in_preamble_before_node'} = 'This is , produced from .

 -- Primjerak varijable od copying: a b
     greška→

   Text ending the preamble


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top section
***********

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chap
******

 -- Instanzvariable of c: BBB CCC
     error→


Tag Table:
Node: Top110
Node: chapter207

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: de
End:
';


$result_converted{'html'}->{'multiple_in_preamble_before_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Primjerak varijable od copying: a b
greška→ -->
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body lang="hr">



<p>Text ending the preamble
</p>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Nächste: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Vorige: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top section</a></span></span>, <span class="nav-button"><span class="nav-label">Nach oben: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top section</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-c"><span class="category-def">Instanzvariable of <code class="code">c</code>: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-c"> &para;</a></span></dt>
<dd><p>error&rarr;
</p></dd></dl>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'multiple_in_preamble_before_node'} = '<documentlanguage xml:lang="fr" spaces=" ">fr</documentlanguage>

<copying endspaces=" ">
<defivar spaces=" " endspaces=" "><definitionterm><indexterm index="vr" number="1">a de copying</indexterm><defcategory automatic="on">Instance Variable</defcategory> <defclass>copying</defclass> <defclassvar>a</defclassvar> <defparam>b</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</copying>

<documentlanguage xml:lang="hr" spaces=" ">hr</documentlanguage>

<para>Text ending the preamble
</para>
<documentlanguage xml:lang="de" spaces=" ">de</documentlanguage>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>top section</sectiontitle>

</top>
<node identifier="chapter" spaces=" "><nodename>chapter</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chap</sectiontitle>

<defivar spaces=" " endspaces=" "><definitionterm><indexterm index="vr" number="2">BBB von c</indexterm><defcategory automatic="on">Instance Variable</defcategory> <defclass>c</defclass> <defclassvar>BBB</defclassvar> <defparam>CCC</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</chapter>
';


$result_converted{'docbook_doc'}->{'multiple_in_preamble_before_node'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="hr">
<title>top section</title>
<bookinfo><title>top section</title>
<legalnotice><synopsis><indexterm role="vr"><primary>a de copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>greška&#8594;
</para></blockquote></legalnotice></bookinfo>
<chapter label="1" id="chapter" lang="de">
<title>chap</title>

<synopsis><indexterm role="vr"><primary>BBB von c</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>c</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
<blockquote><para>error&#8594;
</para></blockquote></chapter>
</book>
';

1;
