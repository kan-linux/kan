use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'transliterated_names_conflicts'} = 'U0 unit{N:Top}{s:Same transliterated names}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 transliterated_names_conflicts.texi:l3 {Top}
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
 *@top C2 transliterated_names_conflicts.texi:l4 {Same transliterated names}
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
    {Same transliterated names}
  {empty_line:\\n}
U1 unit{N:Prés}{s:1 Prés}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 transliterated_names_conflicts.texi:l6 {Prés}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Pr_00e9s}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Prés}
 *@chapter C2 transliterated_names_conflicts.texi:l7 {Prés}
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
    {Prés}
  {empty_line:\\n}
U2 unit{N:Other node}{s:2 Other chapter}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 transliterated_names_conflicts.texi:l9 {Other node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Other-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Other node}
 *@chapter C7 transliterated_names_conflicts.texi:l10 {Other chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Other chapter}
  {empty_line:\\n}
  *@anchor C1 transliterated_names_conflicts.texi:l12
  |EXTRA
  |is_target:{1}
  |normalized:{Pr_00eas}
   *brace_arg C1
    {Prês}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *@float C3 transliterated_names_conflicts.texi:l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{2.1}
  |float_type:{Figure}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{Pr_00e8s}
   *arguments_line C2
    *block_line_arg C1
     {Figure}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Près}
   *paragraph C1
    {In figure\\n}
   *@end C1 transliterated_names_conflicts.texi:l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'transliterated_names_conflicts'} = '\\input texinfo.tex

@node Top
@top Same transliterated names

@node Prés
@chapter Prés

@node Other node
@chapter Other chapter

@anchor{Prês}

@float Figure, Près
In figure
@end float

@bye
';


$result_texts{'transliterated_names_conflicts'} = 'Same transliterated names
*************************

1 Prés
******

2 Other chapter
***************


Figure, Près
In figure

';

$result_errors{'transliterated_names_conflicts'} = '';

$result_floats{'transliterated_names_conflicts'} = 'Figure: 1
 F2.1: {Pr_00e8s}
';

$result_nodes_list{'transliterated_names_conflicts'} = '1|Top
 associated_section: Same transliterated names
 associated_title_command: Same transliterated names
 node_directions:
  next->Prés
2|Prés
 associated_section: 1 Prés
 associated_title_command: 1 Prés
 node_directions:
  next->Other node
  prev->Top
  up->Top
3|Other node
 associated_section: 2 Other chapter
 associated_title_command: 2 Other chapter
 node_directions:
  prev->Prés
  up->Top
';

$result_sections_list{'transliterated_names_conflicts'} = '1|Same transliterated names
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Prés
 section_children:
  1|Prés
  2|Other chapter
2|Prés
 associated_anchor_command: Prés
 associated_node: Prés
 section_directions:
  next->Other chapter
  up->Same transliterated names
 toplevel_directions:
  next->Other chapter
  prev->Same transliterated names
  up->Same transliterated names
3|Other chapter
 associated_anchor_command: Other node
 associated_node: Other node
 section_directions:
  prev->Prés
  up->Same transliterated names
 toplevel_directions:
  prev->Prés
  up->Same transliterated names
';

$result_sectioning_root{'transliterated_names_conflicts'} = 'level: -1
list:
 1|Same transliterated names
';

$result_headings_list{'transliterated_names_conflicts'} = '';

1;
