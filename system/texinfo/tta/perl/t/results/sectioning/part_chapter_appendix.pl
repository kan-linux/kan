use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'part_chapter_appendix'} = '*document_root C4
 *before_node_section C1
  {empty_line:\\n}
 *@part C2 l2 {Part 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Part 1}
  {empty_line:\\n}
 *@chapter C2 l4 {chapter}
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
    {chapter}
  {empty_line:\\n}
 *@appendix C1 l6 {Appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Appendix}
';


$result_texis{'part_chapter_appendix'} = '
@part Part 1

@chapter chapter

@appendix Appendix
';


$result_texts{'part_chapter_appendix'} = '
Part 1
******

1 chapter
*********

Appendix A Appendix
*******************
';

$result_errors{'part_chapter_appendix'} = '';

$result_nodes_list{'part_chapter_appendix'} = '';

$result_sections_list{'part_chapter_appendix'} = '1|Part 1
 part_associated_section: 1 chapter
 section_directions:
  next->Appendix
 section_children:
  1|chapter
2|chapter
 associated_part: Part 1
 section_directions:
  up->Part 1
 toplevel_directions:
  next->Appendix
3|Appendix
 section_directions:
  prev->Part 1
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'part_chapter_appendix'} = 'level: -1
list:
 1|Part 1
 2|Appendix
';

$result_headings_list{'part_chapter_appendix'} = '';


$result_converted{'xml'}->{'part_chapter_appendix'} = '
<part spaces=" "><sectiontitle>Part 1</sectiontitle>

<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

</chapter>
</part>
<appendix spaces=" "><sectiontitle>Appendix</sectiontitle>
</appendix>
';

1;
