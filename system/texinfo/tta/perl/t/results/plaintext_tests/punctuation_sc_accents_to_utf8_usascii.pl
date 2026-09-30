use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_sc_accents_to_utf8_usascii'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 punctuation_small_case_accents_us_ascii.texi:l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{us-ascii}
   |text_arg:{US-ASCII}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {US-ASCII}
   {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_us_ascii.texi:l5 {top}
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
    {top}
 *@top C2 punctuation_small_case_accents_us_ascii.texi:l6 {top section}
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
 *@node C1 punctuation_small_case_accents_us_ascii.texi:l8 {node chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{node-chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node chap}
 *@chapter C11 punctuation_small_case_accents_us_ascii.texi:l9 {chapter}
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
  *paragraph C1
   {``in double q\'\'. `in simple q\'.\\n}
  {empty_line:\\n}
  *paragraph C16
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l13
    *following_arg C1
     {e}
   {, --- }
   *@dfn C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {def}
   { -- }
   *@code C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {in code}
   {. }
   *@samp C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {in samp}
   { a}
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {e}
   {. }
   *@comma C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   { }
   *@exclamdown C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   {. }
   *@dots C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C26
   *@geq C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   { }
   *@enddots C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   { }
   *@AA C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   { }
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l15
    *following_arg C1
     {e}
   { }
   *@dotaccent C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container C1
     {A}
   { }
   *@l C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {. }
   *@copyright C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {. }
   *@error C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {.\\n}
   *@quotedblleft C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   { in quotes }
   *@quotedblright C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   {. }
   *@expansion C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   {\\n}
   *@minus C1 punctuation_small_case_accents_us_ascii.texi:l17
    *brace_container
   { }
   *@registeredsymbol C1 punctuation_small_case_accents_us_ascii.texi:l17
    *brace_container
   {\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@u C1 punctuation_small_case_accents_us_ascii.texi:l20
    *brace_container C1
     {--a}
   {\\n}
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l21
    *brace_container C1
     {--a}
   {\\n}
   *@aa C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container
   { }
   *@AA C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container
   { }
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *following_arg C1
     {e}
   { }
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *following_arg C1
     {E}
   { }
   *@~ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       {i}
   { }
   *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     {i}
   { }
   *@udotaccent C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     {r}
   { }
   *@v C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@\' C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       {r}
   { }
   *@= C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@, C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       *@~ C1 punctuation_small_case_accents_us_ascii.texi:l22
        *brace_container C1
         {n}
   {.\\n}
   *@equiv C1 punctuation_small_case_accents_us_ascii.texi:l23
    *brace_container
   {\\n}
   *@sc C1 punctuation_small_case_accents_us_ascii.texi:l24
    *brace_container C17
     *@aa C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container
     { }
     *@AA C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container
     { }
     *@^ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *following_arg C1
       {e}
     { é }
     *@^ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *following_arg C1
       {E}
     { }
     *@~ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         {i}
     { }
     *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       {i}
     { }
     *@udotaccent C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       {r}
     { }
     *@v C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@\' C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         {r}
     { }
     *@= C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@, C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         *@~ C1 punctuation_small_case_accents_us_ascii.texi:l24
          *brace_container C1
           {n}
   {.\\n}
  {empty_line:\\n}
';


$result_texis{'punctuation_sc_accents_to_utf8_usascii'} = '\\input texinfo

@documentencoding US-ASCII

@node top
@top top section

@node node chap
@chapter chapter

``in double q\'\'. `in simple q\'.

@\'e, --- @dfn{def} -- @code{in code}. @samp{in samp} a@\'{e}. @comma{} @exclamdown{}. @dots{}

@geq{} @enddots{} @AA{} @\'e @dotaccent{A} @l{}. @copyright{}. @error{}.
@quotedblleft{} in quotes @quotedblright{}. @expansion{}
@minus{} @registeredsymbol{}


@u{--a}
@^{--a}
@aa{} @AA{} @^e @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}.
@equiv{}
@sc{@aa{} @AA{} @^e é @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}}.

';


$result_texts{'punctuation_sc_accents_to_utf8_usascii'} = '
top section
***********

1 chapter
*********

"in double q". `in simple q\'.

e\', -- def - in code. in samp ae\'. , !. ...

>= ... AA e\' A. /l. (C). error->.
" in quotes ". ==>
- (R)


-a(
-a^
aa AA e^ E^ i~ i .r r\'< n~,=.
==
AA AA E^ É E^ I~ I .R R\'< N~,=.

';

$result_errors{'punctuation_sc_accents_to_utf8_usascii'} = '';

$result_nodes_list{'punctuation_sc_accents_to_utf8_usascii'} = '1|top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->node chap
2|node chap
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->top
  up->top
';

$result_sections_list{'punctuation_sc_accents_to_utf8_usascii'} = '1|top section
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: node chap
 associated_node: node chap
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'punctuation_sc_accents_to_utf8_usascii'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'punctuation_sc_accents_to_utf8_usascii'} = '';

1;
