use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'chapter_sections'} = 'U0 unit{S:unnumbered}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
 *before_node_section
 *@unnumbered C2 l1 {unnumbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered}
  {empty_line:\\n}
U1 unit{S:1 First chapter}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U3]
FastBack: [U0]
Next: [U3]
Prev: [U0]
 *@chapter C2 l3 {First chapter}
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
    {First chapter}
  {empty_line:\\n}
U2 unit{S:1.1 second}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U3]
FastBack: [U1]
Up: [U1]
 *@section C2 l5 {second}
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
    {second}
  {empty_line:\\n}
U3 unit{S:2 Chapter}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastForward: [U7]
FastBack: [U1]
Next: [U7]
Prev: [U1]
 *@chapter C2 l7 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
U4 unit{S:2.1 Section of chapter}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastForward: [U7]
FastBack: [U3]
Up: [U3]
 *@section C2 l9 {Section of chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section of chapter}
  {empty_line:\\n}
U5 unit{S:2.1.1 subsection 1}
unit_directions:D[next->[U6]|prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Forward: [U6]
Back: [U4]
FastForward: [U7]
FastBack: [U3]
Next: [U6]
Up: [U4]
 *@subsection C2 l11 {subsection 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1.1}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsection 1}
  {empty_line:\\n}
U6 unit{S:2.1.2 subsection 2}
unit_directions:D[next->[U7]|prev->[U5]]
UNIT_DIRECTIONS
This: [U6]
Forward: [U7]
Back: [U5]
FastForward: [U7]
FastBack: [U3]
Prev: [U5]
Up: [U4]
 *@subsection C2 l13 {subsection 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1.2}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsection 2}
  {empty_line:\\n}
U7 unit{S:3 Chapter 2}
unit_directions:D[prev->[U6]]
UNIT_DIRECTIONS
This: [U7]
Back: [U6]
FastBack: [U3]
Prev: [U3]
 *@chapter C1 l15 {Chapter 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter 2}
';


$result_texis{'chapter_sections'} = '@unnumbered unnumbered

@chapter First chapter

@section second

@chapter Chapter

@section Section of chapter

@subsection subsection 1

@subsection subsection 2

@chapter Chapter 2
';


$result_texts{'chapter_sections'} = 'unnumbered
**********

1 First chapter
***************

1.1 second
==========

2 Chapter
*********

2.1 Section of chapter
======================

2.1.1 subsection 1
------------------

2.1.2 subsection 2
------------------

3 Chapter 2
***********
';

$result_errors{'chapter_sections'} = '';

$result_nodes_list{'chapter_sections'} = '';

$result_sections_list{'chapter_sections'} = '1|unnumbered
 section_directions:
  next->First chapter
 toplevel_directions:
  next->First chapter
2|First chapter
 section_directions:
  next->Chapter
  prev->unnumbered
 toplevel_directions:
  next->Chapter
  prev->unnumbered
 section_children:
  1|second
3|second
 section_directions:
  up->First chapter
4|Chapter
 section_directions:
  next->Chapter 2
  prev->First chapter
 toplevel_directions:
  next->Chapter 2
  prev->First chapter
 section_children:
  1|Section of chapter
5|Section of chapter
 section_directions:
  up->Chapter
 section_children:
  1|subsection 1
  2|subsection 2
6|subsection 1
 section_directions:
  next->subsection 2
  up->Section of chapter
7|subsection 2
 section_directions:
  prev->subsection 1
  up->Section of chapter
8|Chapter 2
 section_directions:
  prev->Chapter
 toplevel_directions:
  prev->Chapter
';

$result_sectioning_root{'chapter_sections'} = 'level: 0
list:
 1|unnumbered
 2|First chapter
 3|Chapter
 4|Chapter 2
';

$result_headings_list{'chapter_sections'} = '';


$result_converted{'xml'}->{'chapter_sections'} = '<unnumbered spaces=" "><sectiontitle>unnumbered</sectiontitle>

</unnumbered>
<chapter spaces=" "><sectiontitle>First chapter</sectiontitle>

<section spaces=" "><sectiontitle>second</sectiontitle>

</section>
</chapter>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<section spaces=" "><sectiontitle>Section of chapter</sectiontitle>

<subsection spaces=" "><sectiontitle>subsection 1</sectiontitle>

</subsection>
<subsection spaces=" "><sectiontitle>subsection 2</sectiontitle>

</subsection>
</section>
</chapter>
<chapter spaces=" "><sectiontitle>Chapter 2</sectiontitle>
</chapter>
';

1;
