use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'documentation_examples_texi2html'} = '*document_root C11
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@settitle C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@email C2 l2
      *brace_arg C3
       {someone}
       *@@
       {example.com}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {me}
     { }
     *@sansserif C1 l2
      *brace_container C1
       {in--title}
     { }
     *@error C1 l2
      *brace_container
     { }
     *@equiv C1 l2
      *brace_container
   {empty_line:\\n}
   *@contents C1 l4
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l6 {Top}
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
 *@top C2 l7 {top}
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
 *@node C1 l9 {chapter}
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
 *@chapter C28 l10 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
  *paragraph C11
   *@sansserif C1 l12
    *brace_container C1
     {in--text}
   { }
   *@-
   { p--n. }
   *@error C1 l12
    *brace_container
   { }
   *@equiv C1 l12
    *brace_container
   {\\n}
   *@xref C1 l13
    *brace_arg C1
    |EXTRA
    |node_content:{my node}
    |normalized:{my-node}
     {my node}
   *@footnote C1 l13
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {in footnote}
   {.\\n}
  *@titlefont C1 l14
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {in titlefont}
  {\\n}
  *paragraph C8
   *@email C2 l15
    *brace_arg C3
     {a}
     *@@
     {b.c}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {someone}
   {\\n}
   *@sc C1 l16
    *brace_container C1
     {in Sc}
   {\\n}
   *@var C1 l17
    *brace_container C1
     {in var}
   {\\n}
   *@slanted C1 l18
    *brace_container C2
     {``slant--}
     *@code C1 l18
      *brace_container C1
       {this}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@math C1 l20
    *brace_command_context C7
     *@sansserif C1 l20
      *brace_container C1
       {in--math}
     { }
     *@-
     { a=b }
     *@error C1 l20
      *brace_container
     { }
     *@equiv C1 l20
      *brace_container
   {\\n}
  {empty_line:\\n}
  *@indentedblock C3 l22
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@example C3 l23
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C10
     *@sansserif C1 l24
      *brace_container C1
       {in--example}
     { }
     *@-
     { c. }
     *@error C1 l24
      *brace_container
     { }
     *@equiv C1 l24
      *brace_container
     {\\n}
     *@email C1 l25
      *brace_arg C3
       {a}
       *@@
       {example}
     {\\n}
    *@end C1 l26
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{example}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {example}
   *@end C1 l27
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{indentedblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {indentedblock}
  {empty_line:\\n}
  *@display C3 l29
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    *@email C1 l30
     *brace_arg C3
      {a}
      *@@
      {display}
    {\\n}
   *@end C1 l31
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{display}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {display}
  {empty_line:\\n}
  *@displaymath C9 l33
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {\\frac}
   *balanced_braces C1 l34
    {{h}}
   *balanced_braces C3 l34
    {{j}
    *@sup C1 l34
     *brace_container C1
      {2}
    {}}
   { \\dv[n]}
   *balanced_braces C1 l34
    {{f}}
   *balanced_braces C1 l34
    {{x}}
   {\\n}
   *@end C1 l35
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@file C1 l37
     *brace_container C1
      {e1}
  *index_entry_command@cindex C1 l38
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {i2}
  {empty_line:\\n}
  *index_entry_command@vindex C1 l40
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:    \\n}
  {empty_line:\\n}
  *@documentlanguage C1 l42
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fr}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l44
    *brace_container
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@equiv C1 l46
    *brace_container
   {\\n}
  {empty_line:\\n}
  *@contents C1 l48
  |EXTRA
  |global_command_number:{2}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l50 {my node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{my-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {my node}
 *@chapter C8 l51 {New node}
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
    {New node}
  {empty_line:\\n}
  *@documentlanguage C1 l53
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |text_arg:{pl}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {pl}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l55
    *brace_container
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@equiv C1 l57
    *brace_container
   {\\n}
  {empty_line:\\n}
 *@node C1 l59 {Index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
 |normalized:{Index}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Index}
 *@appendix C4 l60 {Index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Index}
  {empty_line:\\n}
  *@printindex C1 l62
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
 *@node C1 l64 {Second appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{Second-appendix}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Second appendix}
 *@appendix C2 l65 {Second appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{B}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Second appendix}
  {empty_line:\\n}
';


$result_texis{'documentation_examples_texi2html'} = '
@settitle @email{someone@@example.com, me} @sansserif{in--title} @error{} @equiv{}

@contents

@node Top
@top top

@node chapter
@chapter Chapter

@sansserif{in--text} @- p--n. @error{} @equiv{}
@xref{my node}@footnote{in footnote}.
@titlefont{in titlefont}
@email{a@@b.c, someone}
@sc{in Sc}
@var{in var}
@slanted{``slant--@code{this}}

@math{@sansserif{in--math} @- a=b @error{} @equiv{}}

@indentedblock
@example
@sansserif{in--example} @- c. @error{} @equiv{}
@email{a@@example}
@end example
@end indentedblock

@display
@email{a@@display}
@end display

@displaymath
\\frac{h}{j@sup{2}} \\dv[n]{f}{x}
@end displaymath

@cindex @file{e1}
@cindex i2

@vindex    

@documentlanguage fr

@error{}.

@equiv{}

@contents

@node my node
@chapter New node

@documentlanguage pl

@error{}.

@equiv{}

@node Index
@appendix Index

@printindex cp

@node Second appendix
@appendix Second appendix

';


$result_texts{'documentation_examples_texi2html'} = '

top
***

1 Chapter
*********

in-text  p-n. error-> ==
my node.
in titlefont
someone
IN SC
in var
"slant-this

in--math  a=b error-> ==

in--example  c. error-> ==
a@example

a@display

\\frac{h}{j2} \\dv[n]{f}{x}




error->.

==


2 New node
**********


error->.

==

Appendix A Index
****************


Appendix B Second appendix
**************************

';

$result_errors{'documentation_examples_texi2html'} = '* W l40|@vindex missing argument
 warning: @vindex missing argument

';

$result_nodes_list{'documentation_examples_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next->my node
  prev->Top
  up->Top
3|my node
 associated_section: 2 New node
 associated_title_command: 2 New node
 node_directions:
  next->Index
  prev->chapter
  up->Top
4|Index
 associated_section: A Index
 associated_title_command: A Index
 node_directions:
  next->Second appendix
  prev->my node
  up->Top
5|Second appendix
 associated_section: B Second appendix
 associated_title_command: B Second appendix
 node_directions:
  prev->Index
  up->Top
';

$result_sections_list{'documentation_examples_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|New node
  3|Index
  4|Second appendix
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->New node
  up->top
 toplevel_directions:
  next->New node
  prev->top
  up->top
3|New node
 associated_anchor_command: my node
 associated_node: my node
 section_directions:
  next->Index
  prev->Chapter
  up->top
 toplevel_directions:
  next->Index
  prev->Chapter
  up->top
4|Index
 associated_anchor_command: Index
 associated_node: Index
 section_directions:
  next->Second appendix
  prev->New node
  up->top
 toplevel_directions:
  next->Second appendix
  prev->New node
  up->top
5|Second appendix
 associated_anchor_command: Second appendix
 associated_node: Second appendix
 section_directions:
  prev->Index
  up->top
 toplevel_directions:
  prev->Index
  up->top
';

$result_sectioning_root{'documentation_examples_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentation_examples_texi2html'} = '';

$result_indices_sort_strings{'documentation_examples_texi2html'} = 'cp:
 e1
 i2
';

1;
