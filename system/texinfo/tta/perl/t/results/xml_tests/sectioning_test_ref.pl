use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sectioning_test_ref'} = '*document_root C9
 *before_node_section
 *@node C1 l1 {Top}
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
 *@top C4 l2 {top}
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
   {In T.\\n}
  {empty_line:\\n}
 *@node C1 l6 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C4 l7 {Chap1}
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
    {Chap1}
  {empty_line:\\n}
  *paragraph C1
   {In c1.\\n}
  {empty_line:\\n}
 *@node C1 l11 {sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{sec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec}
 *@section C4 l12 {sec1}
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
  *paragraph C1
   {In s1.1.\\n}
  {empty_line:\\n}
 *@node C1 l16 {chap2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chap2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap2}
 *@chapter C3 l17 {Chap2}
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
    {Chap2}
  {empty_line:\\n}
  *paragraph C1
   {In c2.\\n}
';


$result_texis{'sectioning_test_ref'} = '@node Top
@top top

In T.

@node chap
@chapter Chap1

In c1.

@node sec
@section sec1

In s1.1.

@node chap2
@chapter Chap2

In c2.
';


$result_texts{'sectioning_test_ref'} = 'top
***

In T.

1 Chap1
*******

In c1.

1.1 sec1
========

In s1.1.

2 Chap2
*******

In c2.
';

$result_errors{'sectioning_test_ref'} = '';

$result_nodes_list{'sectioning_test_ref'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap1
 associated_title_command: 1 Chap1
 node_directions:
  next->chap2
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 sec1
 associated_title_command: 1.1 sec1
 node_directions:
  up->chap
4|chap2
 associated_section: 2 Chap2
 associated_title_command: 2 Chap2
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'sectioning_test_ref'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap1
 section_children:
  1|Chap1
  2|Chap2
2|Chap1
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Chap2
  up->top
 toplevel_directions:
  next->Chap2
  prev->top
  up->top
 section_children:
  1|sec1
3|sec1
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chap1
4|Chap2
 associated_anchor_command: chap2
 associated_node: chap2
 section_directions:
  prev->Chap1
  up->top
 toplevel_directions:
  prev->Chap1
  up->top
';

$result_sectioning_root{'sectioning_test_ref'} = 'level: -1
list:
 1|top
';

$result_headings_list{'sectioning_test_ref'} = '';


$result_converted{'xml'}->{'sectioning_test_ref'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<para>In T.
</para>
</top>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodenext automatic="on">chap2</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap1</sectiontitle>

<para>In c1.
</para>
<node identifier="sec" spaces=" "><nodename>sec</nodename><nodeup automatic="on">chap</nodeup></node>
<section spaces=" "><sectiontitle>sec1</sectiontitle>

<para>In s1.1.
</para>
</section>
</chapter>
<node identifier="chap2" spaces=" "><nodename>chap2</nodename><nodeprev automatic="on">chap</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap2</sectiontitle>

<para>In c2.
</para></chapter>
';

1;
