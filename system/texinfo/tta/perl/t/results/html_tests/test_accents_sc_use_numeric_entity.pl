use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_accents_sc_use_numeric_entity'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 punctuation_small_case_accents_utf8.texi:l3 {top}
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
 *@top C2 punctuation_small_case_accents_utf8.texi:l4 {top section}
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
 *@node C1 punctuation_small_case_accents_utf8.texi:l6 {node chap}
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
 *@chapter C11 punctuation_small_case_accents_utf8.texi:l7 {chapter}
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
  *paragraph C14
   *@\' C1 punctuation_small_case_accents_utf8.texi:l11
    *following_arg C1
     {e}
   {, --- }
   *@dfn C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {def}
   { -- }
   *@code C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {in code}
   {. }
   *@samp C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {in samp}
   { aé. }
   *@comma C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   { }
   *@exclamdown C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {. }
   *@dots C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C26
   *@geq C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   { }
   *@enddots C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   { }
   *@AA C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   { }
   *@\' C1 punctuation_small_case_accents_utf8.texi:l13
    *following_arg C1
     {e}
   { }
   *@dotaccent C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container C1
     {A}
   { }
   *@l C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {. }
   *@copyright C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {. }
   *@error C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {.\\n}
   *@quotedblleft C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   { in quotes }
   *@quotedblright C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {. }
   *@expansion C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {\\n}
   *@minus C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   { }
   *@registeredsymbol C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   {\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@u C1 punctuation_small_case_accents_utf8.texi:l18
    *brace_container C1
     {--a}
   {\\n}
   *@^ C1 punctuation_small_case_accents_utf8.texi:l19
    *brace_container C1
     {--a}
   {\\n}
   *@aa C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   { }
   *@AA C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   { }
   *@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {e}
   { }
   *@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {E}
   { }
   *@~ C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@dotless C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {i}
   { }
   *@dotless C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {i}
   { }
   *@udotaccent C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {r}
   { }
   *@v C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@\' C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {r}
   { }
   *@= C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@, C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       *@~ C1 punctuation_small_case_accents_utf8.texi:l20
        *brace_container C1
         {n}
   {.\\n}
   *@equiv C1 punctuation_small_case_accents_utf8.texi:l21
    *brace_container
   {\\n}
   *@sc C1 punctuation_small_case_accents_utf8.texi:l22
    *brace_container C17
     *@aa C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     { }
     *@AA C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     { }
     *@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {e}
     { é }
     *@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {E}
     { }
     *@~ C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@dotless C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {i}
     { }
     *@dotless C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {i}
     { }
     *@udotaccent C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {r}
     { }
     *@v C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@\' C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {r}
     { }
     *@= C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@, C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         *@~ C1 punctuation_small_case_accents_utf8.texi:l22
          *brace_container C1
           {n}
   {.\\n}
  {empty_line:\\n}
';


$result_texis{'test_accents_sc_use_numeric_entity'} = '\\input texinfo

@node top
@top top section

@node node chap
@chapter chapter

``in double q\'\'. `in simple q\'.

@\'e, --- @dfn{def} -- @code{in code}. @samp{in samp} aé. @comma{} @exclamdown{}. @dots{}

@geq{} @enddots{} @AA{} @\'e @dotaccent{A} @l{}. @copyright{}. @error{}.
@quotedblleft{} in quotes @quotedblright{}. @expansion{}
@minus{} @registeredsymbol{}


@u{--a}
@^{--a}
@aa{} @AA{} @^e @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}.
@equiv{}
@sc{@aa{} @AA{} @^e é @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}}.

';


$result_texts{'test_accents_sc_use_numeric_entity'} = 'top section
***********

1 chapter
*********

"in double q". `in simple q\'.

e\', -- def - in code. in samp aé. , !. ...

>= ... AA e\' A. /l. (C). error->.
" in quotes ". ==>
- (R)


-a(
-a^
aa AA e^ E^ i~ i .r r\'< n~,=.
==
AA AA E^ É E^ I~ I .R R\'< N~,=.

';

$result_errors{'test_accents_sc_use_numeric_entity'} = '';

$result_nodes_list{'test_accents_sc_use_numeric_entity'} = '1|top
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

$result_sections_list{'test_accents_sc_use_numeric_entity'} = '1|top section
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

$result_sectioning_root{'test_accents_sc_use_numeric_entity'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'test_accents_sc_use_numeric_entity'} = '';


$result_converted{'html_text'}->{'test_accents_sc_use_numeric_entity'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &#182;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node-chap">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node-chap">
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &#182;</a></span></h2>

<p>&#8220;in double q&#8221;. &#8216;in simple q&#8217;.
</p>
<p>&#233;, &#8212; <em class="dfn">def</em> &#8211; <code class="code">in code</code>. &#8216;<samp class="samp">in samp</samp>&#8217; aé. &#44; &#161;. &#8230;
</p>
<p>&#8805; <small class="enddots">...</small> &#197; &#233; &#550; &#322;. &#169;. error&#8594;.
&#8220; in quotes &#8221;. &#8614;
&#8722; &#174;
</p>

<p>&#8211;a&#774;
&#8211;a&#770;
&#229; &#197; &#234; &#202; &#297; &#305; &#7771; &#341;&#780; &#241;&#807;&#772;.
&#8801;
<small class="sc">&#197; &#197; &#202; É &#202; &#296; I &#7770; &#340;&#780; &#209;&#807;&#772;</small>.
</p>
</div>
</div>
';

1;
