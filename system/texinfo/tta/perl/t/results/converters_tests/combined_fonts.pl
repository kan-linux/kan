use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'combined_fonts'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@setfilename C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{combined_fonts.info}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {combined_fonts.info}
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
 *@top C2 l4 {top section}
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
    {top section}
  {empty_line:\\n}
 *@node C1 l6 {chapter}
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
 *@chapter C15 l7 {chapter}
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
  *paragraph C12
   *@code C1 l9
    *brace_container C1
     {c--ode}
   {, }
   *@dfn C1 l9
    *brace_container C1
     {d--fn}
   {, }
   *@var C1 l9
    *brace_container C1
     {v--ar}
   {, }
   *@strong C1 l9
    *brace_container C1
     {s--trong}
   {, }
   *@kbd C1 l9
    *brace_container C1
     {k--bd}
   {, }
   *@samp C1 l9
    *brace_container C1
     {s--amp}
   {.\\n}
  {empty_line:\\n}
  *paragraph C12
   *@code C1 l11
    *brace_container C1
     *@dfn C1 l11
      *brace_container C1
       {d--fn in code}
   {\\n}
   *@var C1 l12
    *brace_container C1
     *@code C1 l12
      *brace_container C1
       {c--ode in var}
   {\\n}
   *@code C1 l13
    *brace_container C1
     *@var C1 l13
      *brace_container C1
       {v--ar in code}
   {\\n}
   *@strong C1 l14
    *brace_container C1
     *@kbd C1 l14
      *brace_container C1
       {k--bd in strong}
   {\\n}
   *@samp C1 l15
    *brace_container C1
     *@strong C1 l15
      *brace_container C1
       {s--trong in samp}
   {\\n}
   *@strong C1 l16
    *brace_container C1
     *@samp C1 l16
      *brace_container C1
       {s--amp in strong}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@cite C1 l18
    *brace_container C1
     {c--ite}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@code C1 l20
    *brace_container C1
     *@cite C1 l20
      *brace_container C1
       {c--ite in code}
   {\\n}
   *@cite C1 l21
    *brace_container C1
     *@code C1 l21
      *brace_container C1
       {c--ode in cite}
   {\\n}
  {empty_line:\\n}
  *paragraph C8
   *@code C1 l23
    *brace_container C1
     {c--ode}
   { }
   *@slanted C1 l23
    *brace_container C1
     {s--lanted}
   { }
   *@b C1 l23
    *brace_container C1
     {b--}
   { }
   *@t C1 l23
    *brace_container C1
     {t--}
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@code C1 l25
    *brace_container C1
     *@slanted C1 l25
      *brace_container C1
       {s--lanted in code}
   {\\n}
   *@slanted C1 l26
    *brace_container C1
     *@code C1 l26
      *brace_container C1
       {c--ode in slanted}
   {\\n}
   *@b C1 l27
    *brace_container C1
     *@slanted C1 l27
      *brace_container C1
       {s--lanted in b}
   {\\n}
   *@slanted C1 l28
    *brace_container C1
     *@b C1 l28
      *brace_container C1
       {b-- in slanted}
   {\\n}
   *@t C1 l29
    *brace_container C1
     *@slanted C1 l29
      *brace_container C1
       {s--lanted in t}
   {\\n}
   *@slanted C1 l30
    *brace_container C1
     *@t C1 l30
      *brace_container C1
       {t-- in slanted}
   {\\n}
   *@t C1 l31
    *brace_container C1
     *@var C1 l31
      *brace_container C1
       {v--ar in t}
   {\\n}
   *@var C1 l32
    *brace_container C1
     *@t C1 l32
      *brace_container C1
       {t-- in var}
   {\\n}
  {empty_line:\\n}
  *@example C3 l34
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C4
    *@var C1 l35
     *brace_container C1
      {v--ar in example}
    {\\n}
    *@cite C1 l36
     *brace_container C1
      {c--ite in example}
    {\\n}
   *@end C1 l37
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
';


$result_texis{'combined_fonts'} = '@setfilename combined_fonts.info

@node Top
@top top section

@node chapter
@chapter chapter

@code{c--ode}, @dfn{d--fn}, @var{v--ar}, @strong{s--trong}, @kbd{k--bd}, @samp{s--amp}.

@code{@dfn{d--fn in code}}
@var{@code{c--ode in var}}
@code{@var{v--ar in code}}
@strong{@kbd{k--bd in strong}}
@samp{@strong{s--trong in samp}}
@strong{@samp{s--amp in strong}}

@cite{c--ite}

@code{@cite{c--ite in code}}
@cite{@code{c--ode in cite}}

@code{c--ode} @slanted{s--lanted} @b{b--} @t{t--}

@code{@slanted{s--lanted in code}}
@slanted{@code{c--ode in slanted}}
@b{@slanted{s--lanted in b}}
@slanted{@b{b-- in slanted}}
@t{@slanted{s--lanted in t}}
@slanted{@t{t-- in slanted}}
@t{@var{v--ar in t}}
@var{@t{t-- in var}}

@example
@var{v--ar in example}
@cite{c--ite in example}
@end example
';


$result_texts{'combined_fonts'} = '
top section
***********

1 chapter
*********

c--ode, d-fn, v-ar, s-trong, k--bd, s--amp.

d--fn in code
c--ode in var
v--ar in code
k--bd in strong
s--trong in samp
s--amp in strong

c-ite

c--ite in code
c--ode in cite

c--ode s-lanted b- t--

s--lanted in code
c--ode in slanted
s-lanted in b
b- in slanted
s--lanted in t
t-- in slanted
v--ar in t
t-- in var

v--ar in example
c--ite in example
';

$result_errors{'combined_fonts'} = '';

$result_nodes_list{'combined_fonts'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'combined_fonts'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'combined_fonts'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'combined_fonts'} = '';

1;
