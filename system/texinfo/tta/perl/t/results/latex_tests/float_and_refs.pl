use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'float_and_refs'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
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
 *@top C2 l2 {top}
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
 *@node C1 l4 {chapter}
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
 *@chapter C8 l5 {chapter}
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
  *@float C7 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1.1}
  |float_type:{}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{no-type}
   *arguments_line C2
    *block_line_arg
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {no type}
   *paragraph C1
    {no type\\n}
   *@caption C1 l9
    *brace_command_context C1
     *paragraph C1
      {no type float}
   {spaces_after_close_brace:\\n}
   *@shortcaption C1 l10
    *brace_command_context C1
     *paragraph C1
      {short no type float}
   {spaces_after_close_brace:\\n}
   *@end C1 l11
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
  *@float C7 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1.1}
  |float_type:{Thing}
  |global_command_number:{2}
  |is_target:{1}
  |normalized:{with-type}
   *arguments_line C2
    *block_line_arg C1
     {Thing}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {with type}
   *paragraph C1
    {Something with\\n}
   *@caption C1 l15
    *brace_command_context C1
     *paragraph C1
      {with type float}
   {spaces_after_close_brace:\\n}
   *@shortcaption C1 l16
    *brace_command_context C1
     *paragraph C1
      {short with type float}
   {spaces_after_close_brace:\\n}
   *@end C1 l17
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
  *@float C7 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1.1}
  |float_type:{Figure}
  |global_command_number:{3}
  |is_target:{1}
  |normalized:{my-figure}
   *arguments_line C2
    *block_line_arg C1
     {Figure}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {my figure}
   *paragraph C1
    {In figure\\n}
   *@caption C1 l21
    *brace_command_context C1
     *paragraph C1
      {caption for figure}
   {spaces_after_close_brace:\\n}
   *@shortcaption C1 l22
    *brace_command_context C1
     *paragraph C1
      {short caption for figure}
   {spaces_after_close_brace:\\n}
   *@end C1 l23
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
 *@chapter C8 l25 {refs}
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
    {refs}
  {empty_line:\\n}
  *paragraph C10
   *@xref C1 l27
    *brace_arg C1
    |EXTRA
    |node_content:{no type}
    |normalized:{no-type}
     {no type}
   {.\\n}
   *@xref C2 l28
    *brace_arg C1
    |EXTRA
    |node_content:{no type}
    |normalized:{no-type}
     {no type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
   {.\\n}
   *@xref C3 l29
    *brace_arg C1
    |EXTRA
    |node_content:{no type}
    |normalized:{no-type}
     {no type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
   {.\\n}
   *@xref C4 l30
    *brace_arg C1
    |EXTRA
    |node_content:{no type}
     {no type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
   {.\\n}
   *@xref C5 l31
    *brace_arg C1
    |EXTRA
    |node_content:{no type}
     {no type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {five}
   {.\\n}
  {empty_line:\\n}
  *paragraph C10
   *@xref C1 l33
    *brace_arg C1
    |EXTRA
    |node_content:{with type}
    |normalized:{with-type}
     {with type}
   {.\\n}
   *@xref C2 l34
    *brace_arg C1
    |EXTRA
    |node_content:{with type}
    |normalized:{with-type}
     {with type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
   {.\\n}
   *@xref C3 l35
    *brace_arg C1
    |EXTRA
    |node_content:{with type}
    |normalized:{with-type}
     {with type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
   {.\\n}
   *@xref C4 l36
    *brace_arg C1
    |EXTRA
    |node_content:{with type}
     {with type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
   {.\\n}
   *@xref C5 l37
    *brace_arg C1
    |EXTRA
    |node_content:{with type}
     {with type}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {five}
   {.\\n}
  {empty_line:\\n}
  *paragraph C10
   *@xref C1 l39
    *brace_arg C1
    |EXTRA
    |node_content:{my figure}
    |normalized:{my-figure}
     {my figure}
   {.\\n}
   *@xref C2 l40
    *brace_arg C1
    |EXTRA
    |node_content:{my figure}
    |normalized:{my-figure}
     {my figure}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
   {.\\n}
   *@xref C3 l41
    *brace_arg C1
    |EXTRA
    |node_content:{my figure}
    |normalized:{my-figure}
     {my figure}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
   {.\\n}
   *@xref C4 l42
    *brace_arg C1
    |EXTRA
    |node_content:{my figure}
     {my figure}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
   {.\\n}
   *@xref C5 l43
    *brace_arg C1
    |EXTRA
    |node_content:{my figure}
     {my figure}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {two}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {three}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {four}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {five}
   {.\\n}
  {empty_line:\\n}
 *@chapter C6 l45 {lists}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {lists}
  {empty_line:\\n}
  *@listoffloats C1 l47
  |EXTRA
  |float_type:{}
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
  *@listoffloats C1 l48
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{Figure}
  |global_command_number:{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Figure}
  *@listoffloats C1 l49
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{Thing}
  |global_command_number:{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Thing}
  {empty_line:\\n}
';


$result_texis{'float_and_refs'} = '@node Top
@top top

@node chapter
@chapter chapter

@float , no type
no type
@caption{no type float}
@shortcaption{short no type float}
@end float

@float Thing, with type
Something with
@caption{with type float}
@shortcaption{short with type float}
@end float

@float Figure, my figure
In figure
@caption{caption for figure}
@shortcaption{short caption for figure}
@end float

@chapter refs

@xref{no type}.
@xref{no type, two}.
@xref{no type, two, three}.
@xref{no type, two, three, four}.
@xref{no type, two, three, four, five}.

@xref{with type}.
@xref{with type, two}.
@xref{with type, two, three}.
@xref{with type, two, three, four}.
@xref{with type, two, three, four, five}.

@xref{my figure}.
@xref{my figure, two}.
@xref{my figure, two, three}.
@xref{my figure, two, three, four}.
@xref{my figure, two, three, four, five}.

@chapter lists

@listoffloats 
@listoffloats Figure
@listoffloats Thing

';


$result_texts{'float_and_refs'} = 'top
***

1 chapter
*********

no type
no type

Thing, with type
Something with

Figure, my figure
In figure

2 refs
******

no type.
no type.
no type.
no type.
no type.

with type.
with type.
with type.
with type.
with type.

my figure.
my figure.
my figure.
my figure.
my figure.

3 lists
*******


';

$result_errors{'float_and_refs'} = '';

$result_floats{'float_and_refs'} = ': 1
 F1.1: {no-type}
  S: short no type float
  C: no type float
Figure: 1
 F1.1: {my-figure}
  S: short caption for figure
  C: caption for figure
Thing: 1
 F1.1: {with-type}
  S: short with type float
  C: with type float
';

$result_nodes_list{'float_and_refs'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'float_and_refs'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
  2|refs
  3|lists
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->refs
  up->top
 toplevel_directions:
  next->refs
  prev->top
  up->top
3|refs
 section_directions:
  next->lists
  prev->chapter
  up->top
 toplevel_directions:
  next->lists
  prev->chapter
  up->top
4|lists
 section_directions:
  prev->refs
  up->top
 toplevel_directions:
  prev->refs
  up->top
';

$result_sectioning_root{'float_and_refs'} = 'level: -1
list:
 1|top
';

$result_headings_list{'float_and_refs'} = '';


$result_converted{'latex_text'}->{'float_and_refs'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chapter}}
\\label{anchor:chapter}%

\\begin{TexinfoFloat}
no type
\\caption[short no type float]{no type float}
\\label{anchor:no-type}%
\\end{TexinfoFloat}

\\begin{TexinfoFloatThing}
Something with
\\caption[short with type float]{with type float}
\\label{anchor:with-type}%
\\end{TexinfoFloatThing}

\\begin{figure}
In figure
\\caption[short caption for figure]{caption for figure}
\\label{anchor:my-figure}%
\\end{figure}

\\Texinfochapter{{refs}}

See \\hyperref[anchor:no-type]{\\ref*{anchor:no-type}}.
See \\hyperref[anchor:no-type]{\\ref*{anchor:no-type}}.
See \\hyperref[anchor:no-type]{three}.
See Section ``three\'\' in \\texttt{four}.
See Section ``three\'\' in \\textsl{five}.

See \\hyperref[anchor:with-type]{Thing~\\ref*{anchor:with-type}}.
See \\hyperref[anchor:with-type]{Thing~\\ref*{anchor:with-type}}.
See \\hyperref[anchor:with-type]{three}.
See Section ``three\'\' in \\texttt{four}.
See Section ``three\'\' in \\textsl{five}.

See \\hyperref[anchor:my-figure]{Figure~\\ref*{anchor:my-figure}}.
See \\hyperref[anchor:my-figure]{Figure~\\ref*{anchor:my-figure}}.
See \\hyperref[anchor:my-figure]{three}.
See Section ``three\'\' in \\texttt{four}.
See Section ``three\'\' in \\textsl{five}.

\\Texinfochapter{{lists}}

\\listof{TexinfoFloat}{}
\\listoffigures
\\listof{TexinfoFloatThing}{}

';

1;
