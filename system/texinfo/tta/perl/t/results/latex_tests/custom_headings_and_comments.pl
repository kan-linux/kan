use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'custom_headings_and_comments'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C3
   *@evenheading C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C15
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
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
   *@evenfooting C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:   }
    *line_arg C11
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment}
    |spaces_after_argument:
     |{spaces_after_argument:  }
     *@thischapter
     { }
     *@thistitle
     { }
     *@|
     { }
     *@thisfile
     { }
     *@|
     {   }
     *@code C1 l2
      *brace_container C1
       *@thischaptername
   {empty_line:\\n}
 *@node C1 l4 {Top}
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
 *@top C2 l5 {top sectionning}
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
 *@node C1 l7 {chapter}
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
 *@chapter C10 l8 {ch--ap}
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
 *@section C2 l18 {sec1}
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
 *@chapter C2 l20 {chap 2}
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
';


$result_texis{'custom_headings_and_comments'} = '@evenheading @thispage @thissectionname @| @thissectionnum @thissection @| @thischaptername @thischapternum  
@evenfooting   @thischapter @thistitle @| @thisfile @|   @code{@thischaptername}  @c comment

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

';


$result_texts{'custom_headings_and_comments'} = '
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

';

$result_errors{'custom_headings_and_comments'} = '';

$result_nodes_list{'custom_headings_and_comments'} = '1|Top
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

$result_sections_list{'custom_headings_and_comments'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ch--ap
 section_children:
  1|ch--ap
  2|chap 2
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
  prev->ch--ap
  up->top sectionning
 toplevel_directions:
  prev->ch--ap
  up->top sectionning
';

$result_sectioning_root{'custom_headings_and_comments'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'custom_headings_and_comments'} = '';


$result_converted{'latex_text'}->{'custom_headings_and_comments'} = '\\newpagestyle{custom}{%
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

';

1;
