use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'thispart'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content C2
   *@everyheading C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@thispage
     { }
     *@|
     { }
     *@thisfile
     { }
     *@|
     { }
     *@thispart
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
 *@part C1 l6 {Part I:@* The beginning}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Part I:}
    *@*
    { The beginning}
 *@node C1 l7 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
 *@chapter C4 l8 {Chap1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap1}
  {empty_line:\\n}
  *paragraph C1
   {In chap1\\n}
  {empty_line:\\n}
 *@part C1 l12 {Part II}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Part II}
 *@node C1 l13 {second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{second}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {second}
 *@chapter C4 l14 {chap2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap2}
  {empty_line:\\n}
  *paragraph C1
   {In chap2\\n}
  {empty_line:\\n}
 *@part C2 l18 {App}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{3}
 |section_level:{0}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {App}
  {empty_line:\\n}
 *@appendix C3 l20 {Appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Appendix}
  {empty_line:\\n}
  *paragraph C1
   {In appendix\\n}
';


$result_texis{'thispart'} = '@everyheading @thispage @| @thisfile @| @thispart

@node Top
@top top

@part Part I:@* The beginning
@node first
@chapter Chap1

In chap1

@part Part II
@node second
@chapter chap2

In chap2

@part App

@appendix Appendix

In appendix
';


$result_texts{'thispart'} = '
top
***

Part I:
 The beginning
*********************
1 Chap1
*******

In chap1

Part II
*******
2 chap2
*******

In chap2

App
***

Appendix A Appendix
*******************

In appendix
';

$result_errors{'thispart'} = '';

$result_nodes_list{'thispart'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->first
2|first
 associated_section: 1 Chap1
 node_preceding_part: Part I:@* The beginning
 associated_title_command: 1 Chap1
 node_directions:
  next->second
  prev->Top
  up->Top
3|second
 associated_section: 2 chap2
 node_preceding_part: Part II
 associated_title_command: 2 chap2
 node_directions:
  prev->first
  up->Top
';

$result_sections_list{'thispart'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->Part I:@* The beginning
 toplevel_directions:
  next->Chap1
2|Part I:@* The beginning
 part_following_node: first
 part_associated_section: 1 Chap1
 section_directions:
  next->Part II
  prev->top
 section_children:
  1|Chap1
3|Chap1
 associated_anchor_command: first
 associated_node: first
 associated_part: Part I:@* The beginning
 section_directions:
  up->Part I:@* The beginning
 toplevel_directions:
  next->chap2
  prev->top
  up->top
4|Part II
 part_following_node: second
 part_associated_section: 2 chap2
 section_directions:
  next->App
  prev->Part I:@* The beginning
 section_children:
  1|chap2
5|chap2
 associated_anchor_command: second
 associated_node: second
 associated_part: Part II
 section_directions:
  up->Part II
 toplevel_directions:
  next->Appendix
  prev->Chap1
  up->top
6|App
 part_associated_section: A Appendix
 section_directions:
  prev->Part II
 section_children:
  1|Appendix
7|Appendix
 associated_part: App
 section_directions:
  up->App
 toplevel_directions:
  prev->chap2
  up->top
';

$result_sectioning_root{'thispart'} = 'level: -1
list:
 1|top
 2|Part I:@* The beginning
 3|Part II
 4|App
';

$result_headings_list{'thispart'} = '';


$result_converted{'latex_text'}->{'thispart'} = '\\newpagestyle{custom}{%
\\sethead[\\thepage{}][\\Texinfotheinclude{}][\\Texinfoparttitle{}]%
{\\thepage{}}{\\Texinfotheinclude{}}{\\Texinfoparttitle{}}%
}%
\\pagestyle{custom}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfounnumberedpart{{Part I:\\texorpdfstring{\\ifinner\\unskip\\space\\ignorespaces\\else\\leavevmode{}\\\\\\fi}{ } The beginning}}
\\Texinfochapter{{Chap1}}
\\label{anchor:first}%

In chap1

\\Texinfounnumberedpart{{Part II}}
\\Texinfochapter{{chap2}}
\\label{anchor:second}%

In chap2

\\Texinfounnumberedpart{{App}}

\\appendix
\\renewcommand{\\Texinfoheadingchaptername}{\\appendixname}
\\Texinfochapter{{Appendix}}

In appendix
';

1;
