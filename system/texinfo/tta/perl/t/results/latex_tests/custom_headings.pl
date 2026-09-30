use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'custom_headings'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *@evenheading C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C15
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@thispage
     { }
     *@thissectionname
     { }
     *@|
     { }
     *@thissectionnum
     { }
     *@thissection
     { }
     *@|
     { }
     *@thischaptername
     { }
     *@thischapternum
   *@evenfooting C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C11
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@thischapter
     { }
     *@thistitle
     { }
     *@|
     { }
     *@thisfile
     { }
     *@|
     { }
     *@code C1 l3
      *brace_container C1
       *@thischaptername
   {empty_line:\\n}
 *@node C1 l5 {Top}
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
 *@top C2 l6 {top sectionning}
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
    {top sectionning}
  {empty_line:\\n}
 *@node C1 l8 {chapter}
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
 *@chapter C10 l9 {ch--ap}
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
    {ch--ap}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {after ch--ap first page\\n}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {after ch--ap second page\\n}
  {empty_line:\\n}
 *@section C2 l19 {sec1}
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
    {sec1}
  {empty_line:\\n}
 *@chapter C12 l21 {chap 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap 2}
  {empty_line:\\n}
  *@everyheading C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {toto }
    *@|
    { titi}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {after everyheading before chap 3 first page\\n}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {after everyheading before chap 3 second page\\n}
  {empty_line:\\n}
 *@chapter C6 l33 {chap 3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap 3}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@everyfooting C1 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C7
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {aa }
    *@|
    { bb }
    *@|
    { cc }
    *@|
    { dd}
  {empty_line:\\n}
';


$result_texis{'custom_headings'} = '
@evenheading @thispage @thissectionname @| @thissectionnum @thissection @| @thischaptername @thischapternum
@evenfooting @thischapter @thistitle @| @thisfile @| @code{@thischaptername}

@node Top
@top top sectionning

@node chapter
@chapter ch--ap

@page

after ch--ap first page

@page

after ch--ap second page

@section sec1

@chapter chap 2

@everyheading toto @| titi

@page

after everyheading before chap 3 first page

@page

after everyheading before chap 3 second page

@chapter chap 3

@page

@everyfooting aa @| bb @| cc @| dd

';


$result_texts{'custom_headings'} = '
top sectionning
***************

1 ch-ap
*******



after ch-ap first page



after ch-ap second page

1.1 sec1
========

2 chap 2
********




after everyheading before chap 3 first page



after everyheading before chap 3 second page

3 chap 3
********




';

$result_errors{'custom_headings'} = '';

$result_nodes_list{'custom_headings'} = '1|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 ch--ap
 associated_title_command: 1 ch--ap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'custom_headings'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ch--ap
 section_children:
  1|ch--ap
  2|chap 2
  3|chap 3
2|ch--ap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->chap 2
  up->top sectionning
 toplevel_directions:
  next->chap 2
  prev->top sectionning
  up->top sectionning
 section_children:
  1|sec1
3|sec1
 section_directions:
  up->ch--ap
4|chap 2
 section_directions:
  next->chap 3
  prev->ch--ap
  up->top sectionning
 toplevel_directions:
  next->chap 3
  prev->ch--ap
  up->top sectionning
5|chap 3
 section_directions:
  prev->chap 2
  up->top sectionning
 toplevel_directions:
  prev->chap 2
  up->top sectionning
';

$result_sectioning_root{'custom_headings'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'custom_headings'} = '';


$result_converted{'latex_text'}->{'custom_headings'} = '\\newpagestyle{custom}{%
\\sethead[\\thepage{} \\sectiontitle{}][\\thesection{} Section \\thesection{} \\sectiontitle{}][\\chaptertitle{} \\thechapter{}]%
{}{}{}%
}%
\\pagestyle{custom}%
\\renewpagestyle{custom}{%
\\sethead[\\thepage{} \\sectiontitle{}][\\thesection{} Section \\thesection{} \\sectiontitle{}][\\chaptertitle{} \\thechapter{}]%
{}{}{}%
\\setfoot[\\Texinfothechapterheading{}\\chaptertitle{} \\Texinfosettitle{}][\\Texinfotheinclude{}][\\texttt{\\chaptertitle{}}]%
{}{}{}%
}%
\\pagestyle{custom}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{ch--ap}}
\\label{anchor:chapter}%

\\newpage{}%
\\phantom{blabla}%

after ch--ap first page

\\newpage{}%
\\phantom{blabla}%

after ch--ap second page

\\section{{sec1}}

\\Texinfochapter{{chap 2}}

\\renewpagestyle{custom}{%
\\sethead[toto][titi][]%
{toto}{titi}{}%
\\setfoot[\\Texinfothechapterheading{}\\chaptertitle{} \\Texinfosettitle{}][\\Texinfotheinclude{}][\\texttt{\\chaptertitle{}}]%
{}{}{}%
}%
\\pagestyle{custom}%

\\newpage{}%
\\phantom{blabla}%

after everyheading before chap 3 first page

\\newpage{}%
\\phantom{blabla}%

after everyheading before chap 3 second page

\\Texinfochapter{{chap 3}}

\\newpage{}%
\\phantom{blabla}%

\\renewpagestyle{custom}{%
\\sethead[toto][titi][]%
{toto}{titi}{}%
\\setfoot[aa][bb][cc  dd]%
{aa}{bb}{cc  dd}%
}%
\\pagestyle{custom}%

';

1;
