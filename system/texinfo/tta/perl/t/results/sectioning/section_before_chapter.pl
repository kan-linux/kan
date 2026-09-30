use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_before_chapter'} = '*document_root C3
 *before_node_section
 *@section C2 l1 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {section}
  {empty_line:\\n}
 *@chapter C1 l3 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
';


$result_texis{'section_before_chapter'} = '@section section 

@chapter chapter
';


$result_texts{'section_before_chapter'} = '1 section
=========

2 chapter
=========
';

$result_errors{'section_before_chapter'} = '* W l3|lowering the section level of @chapter appearing after a lower element
 warning: lowering the section level of @chapter appearing after a lower element

';

$result_nodes_list{'section_before_chapter'} = '';

$result_sections_list{'section_before_chapter'} = '1|section
 section_directions:
  next->chapter
 toplevel_directions:
  next->chapter
2|chapter
 section_directions:
  prev->section
 toplevel_directions:
  prev->section
';

$result_sectioning_root{'section_before_chapter'} = 'level: 1
list:
 1|section
 2|chapter
';

$result_headings_list{'section_before_chapter'} = '';


$result_converted{'xml'}->{'section_before_chapter'} = '<section spaces=" "><sectiontitle>section </sectiontitle>

</section>
<section originalcommand="chapter" spaces=" "><sectiontitle>chapter</sectiontitle>
</section>
';

1;
