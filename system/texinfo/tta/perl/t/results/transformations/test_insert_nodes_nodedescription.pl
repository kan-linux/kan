use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_insert_nodes_nodedescription'} = '*document_root C9
 *before_node_section
 *@node C1 {Top}
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
 *@top C3 l1 {top}
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
  *@nodedescription C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {D1}
  {empty_line:\\n}
 *@node C1 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
 *@chapter C2 l4 {Chap}
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
 *@node C1 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Sec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
 *@section C4 l6 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
  *@nodedescription C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {D2}
  *@nodedescription C1 l8
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {D3}
  {empty_line:\\n}
 *@node C1 {Subsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Subsec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsec}
 *@subsection C2 l10 {Subsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsec}
  {empty_line:\\n}
';


$result_texis{'test_insert_nodes_nodedescription'} = '@node Top
@top top
@nodedescription D1

@node Chap
@chapter Chap

@node Sec
@section Sec
@nodedescription D2
@nodedescription D3

@node Subsec
@subsection Subsec

';


$result_texts{'test_insert_nodes_nodedescription'} = 'top
***

1 Chap
******

1.1 Sec
=======

1.1.1 Subsec
------------

';

$result_errors{'test_insert_nodes_nodedescription'} = '* W l2|@nodedescription outside of any node
 warning: @nodedescription outside of any node

* W l7|@nodedescription outside of any node
 warning: @nodedescription outside of any node

* W l8|@nodedescription outside of any node
 warning: @nodedescription outside of any node

';

$result_nodes_list{'test_insert_nodes_nodedescription'} = '1|Top
 associated_section: top
 node_description: @nodedescription D1
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 Chap
 node_directions:
  prev->Top
  up->Top
3|Sec
 associated_section: 1.1 Sec
 node_description: @nodedescription D2
 node_directions:
  up->Chap
4|Subsec
 associated_section: 1.1.1 Subsec
 node_directions:
  up->Sec
';

$result_sections_list{'test_insert_nodes_nodedescription'} = '1|top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_node: Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_node: Sec
 section_directions:
  up->Chap
 section_children:
  1|Subsec
4|Subsec
 associated_node: Subsec
 section_directions:
  up->Sec
';

$result_sectioning_root{'test_insert_nodes_nodedescription'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_insert_nodes_nodedescription'} = '';


$result_converted{'html'}->{'test_insert_nodes_nodedescription'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Chap" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#Chap" accesskey="1">Chap</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

Chap

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#Sec" accesskey="2">Sec</a>:</td><td class="menu-entry-description">D2</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

Sec

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#Subsec" accesskey="3">Subsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="Chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h4>
<h2 class="chapter" id="Chap-1"><span>1 Chap<a class="copiable-link" href="#Chap-1"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#Sec" accesskey="1">Sec</a>:</td><td class="menu-entry-description">D2</td></tr>
</table>
<hr>
<div class="section-level-extent" id="Sec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Chap" accesskey="u" rel="up">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h4>
<h3 class="section" id="Sec-1"><span>1.1 Sec<a class="copiable-link" href="#Sec-1"> &para;</a></span></h3>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#Subsec" accesskey="1">Subsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="subsection-level-extent" id="Subsec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Sec" accesskey="u" rel="up">Sec</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Subsec<a class="copiable-link" href="#Subsec"> &para;</a></span></h4>
<h4 class="subsection" id="Subsec-1"><span>1.1.1 Subsec<a class="copiable-link" href="#Subsec-1"> &para;</a></span></h4>

</div>
</div>
</div>
</div>



</body>
</html>
';


$result_converted{'info'}->{'test_insert_nodes_nodedescription'} = 'This is , produced from .


File: ,  Node: Top,  Next: Chap,  Up: (dir)

top
***

* Menu:

* Chap::

 -- The Detailed Node Listing --

Chap

* Sec::                        D2

Sec

* Subsec::


File: ,  Node: Chap,  Prev: Top,  Up: Top

1 Chap
******

* Menu:

* Sec::                        D2


File: ,  Node: Sec,  Up: Chap

1.1 Sec
=======

* Menu:

* Subsec::


File: ,  Node: Subsec,  Up: Sec

1.1.1 Subsec
------------


Tag Table:
Node: Top27
Node: Chap194
Node: Sec298
Node: Subsec369

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
