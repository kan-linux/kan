use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'link'} = '*document_root C4
 *before_node_section
 *@node C1 l1 {One}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{One}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {One}
 *@chapter C4 l2 {ONEX}
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
    {ONEX}
  {empty_line:\\n}
  *paragraph C1
   {target node\\n}
  {empty_line:\\n}
 *@node C19 l6 {Two}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Two}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Two}
  {empty_line:\\n}
  *paragraph C2
   {xrefautomaticsectiontitle off\\n}
   *@xrefautomaticsectiontitle C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{off}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {off}
  {empty_line:\\n}
  *paragraph C2
   *@link C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:{One}
    |normalized:{One}
     {One}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@link C2 l13
    *brace_arg C1
    |EXTRA
    |node_content:{One}
    |normalized:{One}
     {One}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   {xrefautomaticsectiontitle on\\n}
   *@xrefautomaticsectiontitle C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{2}
   |misc_args:A{on}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {on}
  {empty_line:\\n}
  *paragraph C2
   *@link C1 l18
    *brace_arg C1
    |EXTRA
    |node_content:{One}
    |normalized:{One}
     {One}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@link C2 l20
    *brace_arg C1
    |EXTRA
    |node_content:{One}
    |normalized:{One}
     {One}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {external link\\n}
  {empty_line:\\n}
  *paragraph C2
   *@link C3 l24
    *brace_arg C1
    |EXTRA
    |node_content:{Introduction}
     {Introduction}
    *brace_arg
    *brace_arg C1
     {bash}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@link C3 l26
    *brace_arg C1
    |EXTRA
    |node_content:{Introduction}
     {Introduction}
    *brace_arg C1
     {Bash}
    *brace_arg C1
     {bash}
   {\\n}
';


$result_texis{'link'} = '@node One
@chapter ONEX

target node

@node Two

xrefautomaticsectiontitle off
@xrefautomaticsectiontitle off

@link{One}

@link{One, label}

xrefautomaticsectiontitle on
@xrefautomaticsectiontitle on

@link{One}

@link{One, label}

external link

@link{Introduction,,bash}

@link{Introduction,Bash,bash}
';


$result_texts{'link'} = '1 ONEX
******

target node


xrefautomaticsectiontitle off

One

One

xrefautomaticsectiontitle on

One

One

external link

Introduction

Introduction
';

$result_errors{'link'} = '* W l6|node `Two\' unreferenced
 warning: node `Two\' unreferenced

';

$result_nodes_list{'link'} = '1|One
 associated_section: 1 ONEX
 associated_title_command: 1 ONEX
2|Two
';

$result_sections_list{'link'} = '1|ONEX
 associated_anchor_command: One
 associated_node: One
';

$result_sectioning_root{'link'} = 'level: 0
list:
 1|ONEX
';

$result_headings_list{'link'} = '';


$result_converted{'plaintext'}->{'link'} = '1 ONEX
******

target node

xrefautomaticsectiontitle off

   One

   label

   xrefautomaticsectiontitle on

   One

   label

   external link

   Introduction

   Bash
';


$result_converted{'html_text'}->{'link'} = '<div class="chapter-level-extent" id="One">
<h2 class="chapter" id="ONEX"><span>1 ONEX<a class="copiable-link" href="#ONEX"> &para;</a></span></h2>

<p>target node
</p>
<hr>
<h4 class="node" id="Two"><span>Two<a class="copiable-link" href="#Two"> &para;</a></span></h4>

<p>xrefautomaticsectiontitle off
</p>
<p><a class="link" href="#One">One</a>
</p>
<p><a class="link" href="#One">label</a>
</p>
<p>xrefautomaticsectiontitle on
</p>
<p><a class="link" href="#One">ONEX</a>
</p>
<p><a class="link" href="#One">label</a>
</p>
<p>external link
</p>
<p><a data-manual="bash" href="bash.html#Introduction">(bash)Introduction</a>
</p>
<p><a data-manual="bash" href="bash.html#Introduction">Bash</a>
</p></div>
';


$result_converted{'xml'}->{'link'} = '<node identifier="One" spaces=" "><nodename>One</nodename></node>
<chapter spaces=" "><sectiontitle>ONEX</sectiontitle>

<para>target node
</para>
</chapter>
<node identifier="Two" spaces=" "><nodename>Two</nodename></node>

<para>xrefautomaticsectiontitle off
<xrefautomaticsectiontitle spaces=" " value="off" line="off"></xrefautomaticsectiontitle>
</para>
<para><link label="One"><linknodename>One</linknodename></link>
</para>
<para><link label="One"><linknodename>One</linknodename><linkrefname spaces=" ">label</linkrefname></link>
</para>
<para>xrefautomaticsectiontitle on
<xrefautomaticsectiontitle spaces=" " value="on" line="on"></xrefautomaticsectiontitle>
</para>
<para><link label="One"><linknodename>One</linknodename></link>
</para>
<para><link label="One"><linknodename>One</linknodename><linkrefname spaces=" ">label</linkrefname></link>
</para>
<para>external link
</para>
<para><link label="Introduction" manual="bash"><linknodename>Introduction</linknodename><linkinfofile>bash</linkinfofile></link>
</para>
<para><link label="Introduction" manual="bash"><linknodename>Introduction</linknodename><linkrefname>Bash</linkrefname><linkinfofile>bash</linkinfofile></link>
</para>';


$result_converted{'docbook'}->{'link'} = '<chapter label="1" id="One">
<title>ONEX</title>

<para>target node
</para>
</chapter>
<anchor id="Two"/>

<para>xrefautomaticsectiontitle off
</para>
<para><link linkend="One">One</link>
</para>
<para><link linkend="One">label</link>
</para>
<para>xrefautomaticsectiontitle on
</para>
<para><link linkend="One">One</link>
</para>
<para><link linkend="One">label</link>
</para>
<para>external link
</para>
<para>&#8220;Introduction&#8221; in <filename>bash</filename>
</para>
<para>section &#8220;Bash&#8221; in <filename>bash</filename>
</para>';


$result_converted{'latex_text'}->{'link'} = '\\Texinfochapter{{ONEX}}
\\label{anchor:One}%

target node

\\label{anchor:Two}%

xrefautomaticsectiontitle off

\\hyperref[anchor:One]{One}

\\hyperref[anchor:One]{label}

xrefautomaticsectiontitle on

\\hyperref[anchor:One]{ONEX}

\\hyperref[anchor:One]{label}

external link

Introduction

Bash
';

1;
