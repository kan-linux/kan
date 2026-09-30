use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sectioning_part_appendix_no_top'} = 'U0 unit{S:1 chapter}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U4]
 *before_node_section
 *@chapter C2 l1 {chapter}
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
    {chapter}
  {empty_line:\\n}
U1 unit{S:1.1 section}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U4]
FastBack: [U0]
Up: [U0]
 *@section C2 l3 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
  {empty_line:\\n}
U2 unit{S:1.1.1 subsection}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U4]
FastBack: [U0]
Up: [U1]
 *@subsection C2 l5 {subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsection}
  {empty_line:\\n}
U3 unit{S:1.1.1.1 subsubsection}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastForward: [U4]
FastBack: [U0]
Up: [U2]
 *@subsubsection C2 l7 {subsubsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1.1}
 |section_level:{4}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsubsection}
  {empty_line:\\n}
U4 unit{S:2 chapter in part}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastForward: [U5]
FastBack: [U0]
Next: [U5]
 *@part C2 l9 {part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part}
  {empty_line:\\n}
 *@chapter C2 l11 {chapter in part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter in part}
  {empty_line:\\n}
U5 unit{S:3 second chapter in part}
unit_directions:D[next->[U6]|prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Forward: [U6]
Back: [U4]
FastForward: [U6]
FastBack: [U4]
Next: [U6]
Prev: [U4]
Up: [U4]
 *@chapter C2 l13 {second chapter in part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {second chapter in part}
  {empty_line:\\n}
U6 unit{S:unnumbered}
unit_directions:D[next->[U7]|prev->[U5]]
UNIT_DIRECTIONS
This: [U6]
Forward: [U7]
Back: [U5]
FastForward: [U7]
FastBack: [U5]
Prev: [U5]
Up: [U4]
 *@unnumbered C2 l15 {unnumbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered}
  {empty_line:\\n}
U7 unit{S:A appendix}
unit_directions:D[next->[U8]|prev->[U6]]
UNIT_DIRECTIONS
This: [U7]
Forward: [U8]
Back: [U6]
FastBack: [U6]
Prev: [U4]
 *@appendix C2 l17 {appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendix}
  {empty_line:\\n}
U8 unit{S:A.1 appendixsec}
unit_directions:D[prev->[U7]]
UNIT_DIRECTIONS
This: [U8]
Back: [U7]
FastBack: [U7]
Up: [U7]
 *@appendixsec C1 l19 {appendixsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendixsec}
';


$result_texis{'sectioning_part_appendix_no_top'} = '@chapter chapter

@section section

@subsection subsection

@subsubsection subsubsection

@part part

@chapter chapter in part

@chapter second chapter in part

@unnumbered unnumbered

@appendix appendix

@appendixsec appendixsec
';


$result_texts{'sectioning_part_appendix_no_top'} = '1 chapter
*********

1.1 section
===========

1.1.1 subsection
----------------

1.1.1.1 subsubsection
.....................

part
****

2 chapter in part
*****************

3 second chapter in part
************************

unnumbered
**********

Appendix A appendix
*******************

A.1 appendixsec
===============
';

$result_errors{'sectioning_part_appendix_no_top'} = '';

$result_nodes_list{'sectioning_part_appendix_no_top'} = '';

$result_sections_list{'sectioning_part_appendix_no_top'} = '1|chapter
 toplevel_directions:
  next->chapter in part
 section_children:
  1|section
2|section
 section_directions:
  up->chapter
 section_children:
  1|subsection
3|subsection
 section_directions:
  up->section
 section_children:
  1|subsubsection
4|subsubsection
 section_directions:
  up->subsection
5|part
 part_associated_section: 2 chapter in part
 section_directions:
  next->appendix
 section_children:
  1|chapter in part
  2|second chapter in part
  3|unnumbered
6|chapter in part
 associated_part: part
 section_directions:
  next->second chapter in part
  up->part
 toplevel_directions:
  next->second chapter in part
  prev->chapter
7|second chapter in part
 section_directions:
  next->unnumbered
  prev->chapter in part
  up->part
 toplevel_directions:
  next->unnumbered
  prev->chapter in part
8|unnumbered
 section_directions:
  prev->second chapter in part
  up->part
 toplevel_directions:
  next->appendix
  prev->second chapter in part
9|appendix
 section_directions:
  prev->part
 toplevel_directions:
  prev->unnumbered
 section_children:
  1|appendixsec
10|appendixsec
 section_directions:
  up->appendix
';

$result_sectioning_root{'sectioning_part_appendix_no_top'} = 'level: -1
list:
 1|chapter
 2|part
 3|appendix
';

$result_headings_list{'sectioning_part_appendix_no_top'} = '';


$result_converted{'xml'}->{'sectioning_part_appendix_no_top'} = '<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

<section spaces=" "><sectiontitle>section</sectiontitle>

<subsection spaces=" "><sectiontitle>subsection</sectiontitle>

<subsubsection spaces=" "><sectiontitle>subsubsection</sectiontitle>

</subsubsection>
</subsection>
</section>
</chapter>
<part spaces=" "><sectiontitle>part</sectiontitle>

<chapter spaces=" "><sectiontitle>chapter in part</sectiontitle>

</chapter>
<chapter spaces=" "><sectiontitle>second chapter in part</sectiontitle>

</chapter>
<unnumbered spaces=" "><sectiontitle>unnumbered</sectiontitle>

</unnumbered>
</part>
<appendix spaces=" "><sectiontitle>appendix</sectiontitle>

<appendixsec spaces=" "><sectiontitle>appendixsec</sectiontitle>
</appendixsec>
</appendix>
';

1;
