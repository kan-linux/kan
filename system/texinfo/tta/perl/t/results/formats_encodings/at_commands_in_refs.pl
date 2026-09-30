use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'at_commands_in_refs'} = '*document_root C58
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
 *@top C4 l2 {Top}
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
    {Top}
  {empty_line:\\n}
  *@menu C29 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@- @{ @}}
    |normalized:{-_007b-_007d}
     *@-
     { }
     *@{
     { }
     *@}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C17
    |EXTRA
    |node_content:{@  @\\t @! @* @. @: .@: @? @@}
    |normalized:{-_0021-_002e-_002e-_003f-_0040}
     *@ 
     { }
     *@\\t
     { }
     *@!
     { }
     *@*
     { }
     *@.
     { }
     *@:
     { .}
     *@:
     { }
     *@?
     { }
     *@@
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |EXTRA
    |node_content:{@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *@atchar C1 l7
      *brace_container
     { }
     *@lbracechar C1 l7
      *brace_container
     { }
     *@rbracechar C1 l7
      *brace_container
     { }
     *@backslashchar C1 l7
      *brace_container
     { }
     *@hashchar C1 l7
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:{@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}
    |normalized:{LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e}
     *@LaTeX C1 l8
      *brace_container
     { }
     *@TeX C1 l8
      *brace_container
     { }
     *@bullet C1 l8
      *brace_container
     { }
     *@comma C1 l8
      *brace_container
     { }
     *@copyright C1 l8
      *brace_container
     { }
     *@dots C1 l8
      *brace_container
     { }
     *@enddots C1 l8
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |EXTRA
    |node_content:{@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}
    |normalized:{_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212}
     *@equiv C1 l9
      *brace_container
     { }
     *@error C1 l9
      *brace_container
     { }
     *@euro C1 l9
      *brace_container
     { }
     *@exclamdown C1 l9
      *brace_container
     { }
     *@expansion C1 l9
      *brace_container
     { }
     *@minus C1 l9
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@geq{} @leq{} @arrow{}}
    |normalized:{_2265-_2264-_2192}
     *@geq C1 l10
      *brace_container
     { }
     *@leq C1 l10
      *brace_container
     { }
     *@arrow C1 l10
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:{@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}
    |normalized:{_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae}
     *@ordf C1 l11
      *brace_container
     { }
     *@ordm C1 l11
      *brace_container
     { }
     *@point C1 l11
      *brace_container
     { }
     *@pounds C1 l11
      *brace_container
     { }
     *@print C1 l11
      *brace_container
     { }
     *@questiondown C1 l11
      *brace_container
     { }
     *@registeredsymbol C1 l11
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |EXTRA
    |node_content:{@result{} @textdegree{} a@tie{}b @today{} @aa{}}
    |normalized:{_21d2-_00b0-a-b-_00e5}
     *@result C1 l12
      *brace_container
     { }
     *@textdegree C1 l12
      *brace_container
     { a}
     *@tie C1 l12
      *brace_container
     {b }
     *@today C1 l12
      *brace_container
     { }
     *@aa C1 l12
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C27
    |EXTRA
    |node_content:{@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe}
     *@AA C1 l13
      *brace_container
     { }
     *@ae C1 l13
      *brace_container
     { }
     *@oe C1 l13
      *brace_container
     { }
     *@AE C1 l13
      *brace_container
     { }
     *@OE C1 l13
      *brace_container
     { }
     *@o C1 l13
      *brace_container
     { }
     *@O C1 l13
      *brace_container
     { }
     *@ss C1 l13
      *brace_container
     { }
     *@l C1 l13
      *brace_container
     { }
     *@L C1 l13
      *brace_container
     { }
     *@DH C1 l13
      *brace_container
     { }
     *@dh C1 l13
      *brace_container
     { }
     *@TH C1 l13
      *brace_container
     { }
     *@th C1 l13
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l14
    {menu_entry_leading_text:* }
    *menu_entry_node C21
    |EXTRA
    |node_content:{@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *@" C1 l14
      *brace_container C1
       {a}
     { }
     *@~ C1 l14
      *brace_container C1
       {e}
     { }
     *@^ C1 l14
      *brace_container C1
       *@dotless C1 l14
        *brace_container C1
         {i}
     { }
     *@^ C1 l14
      *brace_container C1
       {a}
     { }
     *@` C1 l14
      *brace_container C1
       {a}
     { }
     *@\' C1 l14
      *following_arg C1
       {e}
     { }
     *@, C1 l14
      *brace_container C1
       {c}
     { }
     *@= C1 l14
      *brace_container C1
       {e}
     { }
     *@ringaccent C1 l14
      *brace_container C1
       {e}
     { }
     *@H C1 l14
      *brace_container C1
       {e}
     { }
     *@ogonek C1 l14
      *brace_container C1
       {e}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:{@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *@dotaccent C1 l15
      *brace_container C1
       {e}
     { }
     *@u C1 l15
      *brace_container C1
       {e}
     { }
     *@ubaraccent C1 l15
      *brace_container C1
       {e}
     { }
     *@udotaccent C1 l15
      *brace_container C1
       {e}
     { }
     *@v C1 l15
      *brace_container C1
       {e}
     { }
     *@dotless C1 l15
      *brace_container C1
       {j}
     { }
     *@tieaccent C1 l15
      *brace_container C1
       {ee}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@dotless{i} @`{@=E} @,{@\'C}}
    |normalized:{_0131-_1e14-_1e08}
     *@dotless C1 l16
      *brace_container C1
       {i}
     { }
     *@` C1 l16
      *brace_container C1
       *@= C1 l16
        *following_arg C1
         {E}
     { }
     *@, C1 l16
      *brace_container C1
       *@\' C1 l16
        *following_arg C1
         {C}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |EXTRA
    |node_content:{@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *@quotedblleft C1 l17
      *brace_container
     { }
     *@quotedblright C1 l17
      *brace_container
     { }
     *@quoteleft C1 l17
      *brace_container
     { }
     *@quoteright C1 l17
      *brace_container
     { }
     *@quotedblbase C1 l17
      *brace_container
     { }
     *@quotesinglbase C1 l17
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |EXTRA
    |node_content:{@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *@guillemetleft C1 l18
      *brace_container
     { }
     *@guillemetright C1 l18
      *brace_container
     { }
     *@guillemotleft C1 l18
      *brace_container
     { }
     *@guillemotright C1 l18
      *brace_container
     { }
     *@guilsinglleft C1 l18
      *brace_container
     { }
     *@guilsinglright C1 l18
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{`` \'\' --- -- ` \'}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {`` \'\' --- -- ` \'}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
    |normalized:{AAA-AAA-BBB}
     *@acronym C2 l20
      *brace_arg C1
       {AAA}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {fff}
     { }
     *@acronym C1 l20
      *brace_arg C1
       {AAA}
     { }
     *@acronym C1 l20
      *brace_arg C1
       {BBB}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
    |normalized:{CCC-CCC-DDD}
     *@abbr C2 l21
      *brace_arg C1
       {CCC}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {rrr}
     { }
     *@abbr C1 l21
      *brace_arg C1
       {CCC}
     { }
     *@abbr C1 l21
      *brace_arg C1
       {DDD}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l22
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{@email{someone@@somewher, the someone} @email{no_explain@@there}}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *@email C2 l22
      *brace_arg C3
       {someone}
       *@@
       {somewher}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {the someone}
     { }
     *@email C1 l22
      *brace_arg C3
       {no_explain}
       *@@
       {there}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l23
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *@image C1 l23
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {f--ile1}
     {  }
     *@image C5 l23
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {f--ile}
      *brace_arg C1
       {aze}
      *brace_arg C1
       {az}
      *brace_arg C1
       {alt}
      *brace_arg C1
       {e--xt}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@verb{. @ {} . .}}
    |normalized:{-_0040-_007b_007d-_002e-}
     *@verb C1 l24
     |INFO
     |delimiter:{.}
      *brace_container C1
       {raw: @ {} . }
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C17
    |EXTRA
    |node_content:{@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *@cite C1 l25
      *brace_container C2
       {cite }
       *@asis C1 l25
        *brace_container C1
         {asis}
     { }
     *@w C1 l25
      *brace_container C4
       {in }
       *@@
       {w }
       *@b C1 l25
        *brace_container C1
         {b}
     { }
     *@r C1 l25
      *brace_container C1
       {in r}
     { }
     *@sc C1 l25
      *brace_container C1
       {sc}
     { }
     *@strong C1 l25
      *brace_container C1
       {str}
     { }
     *@t C1 l25
      *brace_container C1
       {t}
     { }
     *@var C1 l25
      *brace_container C1
       {var}
     { }
     *@dfn C1 l25
      *brace_container C1
       {dfn}
     { }
     *@i C1 l25
      *brace_container C1
       {i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:{@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *@env C1 l26
      *brace_container C1
       {env}
     { }
     *@code C1 l26
      *brace_container C1
       {code}
     { }
     *@option C1 l26
      *brace_container C1
       {option}
     { }
     *@samp C1 l26
      *brace_container C1
       {samp}
     { }
     *@command C1 l26
      *brace_container C1
       {command}
     { }
     *@file C1 l26
      *brace_container C1
       {file}
     { }
     *@kbd C1 l26
      *brace_container C2
       {C-x }
       *@key C1 l26
        *brace_container C1
         {ESC}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:{8.27@dmn{in}}
    |normalized:{8_002e27in}
     {8.27}
     *@dmn C1 l27
      *brace_container C1
       {in}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{@sansserif{sansserif} @slanted{slanted}}
    |normalized:{sansserif-slanted}
     *@sansserif C1 l28
      *brace_container C1
       {sansserif}
     { }
     *@slanted C1 l28
      *brace_container C1
       {slanted}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@indicateurl{indicateurl}}
    |normalized:{indicateurl}
     *@indicateurl C1 l29
      *brace_container C1
       {indicateurl}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{@sub{g}H 3@sup{rd}}
    |normalized:{gH-3rd}
     *@sub C1 l30
      *brace_container C1
       {g}
     {H 3}
     *@sup C1 l30
      *brace_container C1
       {rd}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l31
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *@url C1 l31
      *brace_arg C1
       {http://somewhere_aaa}
     { }
     *@url C2 l31
      *brace_arg C1
       {url}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {text}
     { }
     *@uref C3 l31
      *brace_arg C1
       {/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {ls}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l32
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l34 {@- @{ @}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{-_007b-_007d}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@-
    { }
    *@{
    { }
    *@}
 *@chapter C2 l35 {@- @{ @}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@-
    { }
    *@{
    { }
    *@}
  {empty_line:\\n}
 *@node C1 l37 {@  @	 @! @* @. @: .@: @? @@}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{-_0021-_002e-_002e-_003f-_0040}
  *arguments_line C1
   *line_arg C17
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@ 
    { }
    *@\\t
    { }
    *@!
    { }
    *@*
    { }
    *@.
    { }
    *@:
    { .}
    *@:
    { }
    *@?
    { }
    *@@
 *@chapter C2 l38 {@  @	 @! @* @. @: .@: @? @@}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C17
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@ 
    { }
    *@\\t
    { }
    *@!
    { }
    *@*
    { }
    *@.
    { }
    *@:
    { .}
    *@:
    { }
    *@?
    { }
    *@@
  {empty_line:\\n}
 *@node C1 l40 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{_0040-_007b-_007d-_005c-_0023}
  *arguments_line C1
   *line_arg C9
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@atchar C1 l40
     *brace_container
    { }
    *@lbracechar C1 l40
     *brace_container
    { }
    *@rbracechar C1 l40
     *brace_container
    { }
    *@backslashchar C1 l40
     *brace_container
    { }
    *@hashchar C1 l40
     *brace_container
 *@chapter C2 l41 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C9
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@atchar C1 l41
     *brace_container
    { }
    *@lbracechar C1 l41
     *brace_container
    { }
    *@rbracechar C1 l41
     *brace_container
    { }
    *@backslashchar C1 l41
     *brace_container
    { }
    *@hashchar C1 l41
     *brace_container
  {empty_line:\\n}
 *@node C1 l43 {@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@LaTeX C1 l43
     *brace_container
    { }
    *@TeX C1 l43
     *brace_container
    { }
    *@bullet C1 l43
     *brace_container
    { }
    *@comma C1 l43
     *brace_container
    { }
    *@copyright C1 l43
     *brace_container
    { }
    *@dots C1 l43
     *brace_container
    { }
    *@enddots C1 l43
     *brace_container
 *@chapter C2 l44 {@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@LaTeX C1 l44
     *brace_container
    { }
    *@TeX C1 l44
     *brace_container
    { }
    *@bullet C1 l44
     *brace_container
    { }
    *@comma C1 l44
     *brace_container
    { }
    *@copyright C1 l44
     *brace_container
    { }
    *@dots C1 l44
     *brace_container
    { }
    *@enddots C1 l44
     *brace_container
  {empty_line:\\n}
 *@node C1 l46 {@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@equiv C1 l46
     *brace_container
    { }
    *@error C1 l46
     *brace_container
    { }
    *@euro C1 l46
     *brace_container
    { }
    *@exclamdown C1 l46
     *brace_container
    { }
    *@expansion C1 l46
     *brace_container
    { }
    *@minus C1 l46
     *brace_container
 *@chapter C2 l47 {@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@equiv C1 l47
     *brace_container
    { }
    *@error C1 l47
     *brace_container
    { }
    *@euro C1 l47
     *brace_container
    { }
    *@exclamdown C1 l47
     *brace_container
    { }
    *@expansion C1 l47
     *brace_container
    { }
    *@minus C1 l47
     *brace_container
  {empty_line:\\n}
 *@node C1 l49 {@geq{} @leq{} @arrow{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{_2265-_2264-_2192}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@geq C1 l49
     *brace_container
    { }
    *@leq C1 l49
     *brace_container
    { }
    *@arrow C1 l49
     *brace_container
 *@chapter C2 l50 {@geq{} @leq{} @arrow{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@geq C1 l50
     *brace_container
    { }
    *@leq C1 l50
     *brace_container
    { }
    *@arrow C1 l50
     *brace_container
  {empty_line:\\n}
 *@node C1 l52 {@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@ordf C1 l52
     *brace_container
    { }
    *@ordm C1 l52
     *brace_container
    { }
    *@point C1 l52
     *brace_container
    { }
    *@pounds C1 l52
     *brace_container
    { }
    *@print C1 l52
     *brace_container
    { }
    *@questiondown C1 l52
     *brace_container
    { }
    *@registeredsymbol C1 l52
     *brace_container
 *@chapter C2 l53 {@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@ordf C1 l53
     *brace_container
    { }
    *@ordm C1 l53
     *brace_container
    { }
    *@point C1 l53
     *brace_container
    { }
    *@pounds C1 l53
     *brace_container
    { }
    *@print C1 l53
     *brace_container
    { }
    *@questiondown C1 l53
     *brace_container
    { }
    *@registeredsymbol C1 l53
     *brace_container
  {empty_line:\\n}
 *@node C1 l55 {@result{} @textdegree{} a@tie{}b @today{} @aa{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{_21d2-_00b0-a-b-_00e5}
  *arguments_line C1
   *line_arg C9
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@result C1 l55
     *brace_container
    { }
    *@textdegree C1 l55
     *brace_container
    { a}
    *@tie C1 l55
     *brace_container
    {b }
    *@today C1 l55
     *brace_container
    { }
    *@aa C1 l55
     *brace_container
 *@chapter C2 l56 {@result{} @textdegree{} a@tie{}b @today{} @aa{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{8}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C9
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@result C1 l56
     *brace_container
    { }
    *@textdegree C1 l56
     *brace_container
    { a}
    *@tie C1 l56
     *brace_container
    {b }
    *@today C1 l56
     *brace_container
    { }
    *@aa C1 l56
     *brace_container
  {empty_line:\\n}
 *@node C1 l58 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{10}
 |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe}
  *arguments_line C1
   *line_arg C27
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    *@AA C1 l58
     *brace_container
    { }
    *@ae C1 l58
     *brace_container
    { }
    *@oe C1 l58
     *brace_container
    { }
    *@AE C1 l58
     *brace_container
    { }
    *@OE C1 l58
     *brace_container
    { }
    *@o C1 l58
     *brace_container
    { }
    *@O C1 l58
     *brace_container
    { }
    *@ss C1 l58
     *brace_container
    { }
    *@l C1 l58
     *brace_container
    { }
    *@L C1 l58
     *brace_container
    { }
    *@DH C1 l58
     *brace_container
    { }
    *@dh C1 l58
     *brace_container
    { }
    *@TH C1 l58
     *brace_container
    { }
    *@th C1 l58
     *brace_container
 *@chapter C2 l59 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{9}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C27
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    *@AA C1 l59
     *brace_container
    { }
    *@ae C1 l59
     *brace_container
    { }
    *@oe C1 l59
     *brace_container
    { }
    *@AE C1 l59
     *brace_container
    { }
    *@OE C1 l59
     *brace_container
    { }
    *@o C1 l59
     *brace_container
    { }
    *@O C1 l59
     *brace_container
    { }
    *@ss C1 l59
     *brace_container
    { }
    *@l C1 l59
     *brace_container
    { }
    *@L C1 l59
     *brace_container
    { }
    *@DH C1 l59
     *brace_container
    { }
    *@dh C1 l59
     *brace_container
    { }
    *@TH C1 l59
     *brace_container
    { }
    *@th C1 l59
     *brace_container
  {empty_line:\\n}
 *@node C1 l61 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{11}
 |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
  *arguments_line C1
   *line_arg C21
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@" C1 l61
     *brace_container C1
      {a}
    { }
    *@~ C1 l61
     *brace_container C1
      {e}
    { }
    *@^ C1 l61
     *brace_container C1
      *@dotless C1 l61
       *brace_container C1
        {i}
    { }
    *@^ C1 l61
     *brace_container C1
      {a}
    { }
    *@` C1 l61
     *brace_container C1
      {a}
    { }
    *@\' C1 l61
     *following_arg C1
      {e}
    { }
    *@, C1 l61
     *brace_container C1
      {c}
    { }
    *@= C1 l61
     *brace_container C1
      {e}
    { }
    *@ringaccent C1 l61
     *brace_container C1
      {e}
    { }
    *@H C1 l61
     *brace_container C1
      {e}
    { }
    *@ogonek C1 l61
     *brace_container C1
      {e}
 *@chapter C2 l62 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument:  }
 |EXTRA
 |section_heading_number:{10}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C21
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@" C1 l62
     *brace_container C1
      {a}
    { }
    *@~ C1 l62
     *brace_container C1
      {e}
    { }
    *@^ C1 l62
     *brace_container C1
      *@dotless C1 l62
       *brace_container C1
        {i}
    { }
    *@^ C1 l62
     *brace_container C1
      {a}
    { }
    *@` C1 l62
     *brace_container C1
      {a}
    { }
    *@\' C1 l62
     *following_arg C1
      {e}
    { }
    *@, C1 l62
     *brace_container C1
      {c}
    { }
    *@= C1 l62
     *brace_container C1
      {e}
    { }
    *@ringaccent C1 l62
     *brace_container C1
      {e}
    { }
    *@H C1 l62
     *brace_container C1
      {e}
    { }
    *@ogonek C1 l62
     *brace_container C1
      {e}
  {empty_line:\\n}
 *@node C1 l64 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{12}
 |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@dotaccent C1 l64
     *brace_container C1
      {e}
    { }
    *@u C1 l64
     *brace_container C1
      {e}
    { }
    *@ubaraccent C1 l64
     *brace_container C1
      {e}
    { }
    *@udotaccent C1 l64
     *brace_container C1
      {e}
    { }
    *@v C1 l64
     *brace_container C1
      {e}
    { }
    *@dotless C1 l64
     *brace_container C1
      {j}
    { }
    *@tieaccent C1 l64
     *brace_container C1
      {ee}
 *@chapter C2 l65 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{11}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@dotaccent C1 l65
     *brace_container C1
      {e}
    { }
    *@u C1 l65
     *brace_container C1
      {e}
    { }
    *@ubaraccent C1 l65
     *brace_container C1
      {e}
    { }
    *@udotaccent C1 l65
     *brace_container C1
      {e}
    { }
    *@v C1 l65
     *brace_container C1
      {e}
    { }
    *@dotless C1 l65
     *brace_container C1
      {j}
    { }
    *@tieaccent C1 l65
     *brace_container C1
      {ee}
  {empty_line:\\n}
 *@node C1 l67 {@dotless{i} @`{@=E} @,{@\'C}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{13}
 |normalized:{_0131-_1e14-_1e08}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@dotless C1 l67
     *brace_container C1
      {i}
    { }
    *@` C1 l67
     *brace_container C1
      *@= C1 l67
       *following_arg C1
        {E}
    { }
    *@, C1 l67
     *brace_container C1
      *@\' C1 l67
       *following_arg C1
        {C}
 *@chapter C2 l68 {@dotless{i} @`{@=E} @,{@\'C}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{12}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@dotless C1 l68
     *brace_container C1
      {i}
    { }
    *@` C1 l68
     *brace_container C1
      *@= C1 l68
       *following_arg C1
        {E}
    { }
    *@, C1 l68
     *brace_container C1
      *@\' C1 l68
       *following_arg C1
        {C}
  {empty_line:\\n}
 *@node C1 l70 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{14}
 |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@quotedblleft C1 l70
     *brace_container
    { }
    *@quotedblright C1 l70
     *brace_container
    { }
    *@quoteleft C1 l70
     *brace_container
    { }
    *@quoteright C1 l70
     *brace_container
    { }
    *@quotedblbase C1 l70
     *brace_container
    { }
    *@quotesinglbase C1 l70
     *brace_container
 *@chapter C2 l71 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{13}
 |section_level:{1}
 |section_number:{14}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@quotedblleft C1 l71
     *brace_container
    { }
    *@quotedblright C1 l71
     *brace_container
    { }
    *@quoteleft C1 l71
     *brace_container
    { }
    *@quoteright C1 l71
     *brace_container
    { }
    *@quotedblbase C1 l71
     *brace_container
    { }
    *@quotesinglbase C1 l71
     *brace_container
  {empty_line:\\n}
 *@node C1 l73 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{15}
 |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@guillemetleft C1 l73
     *brace_container
    { }
    *@guillemetright C1 l73
     *brace_container
    { }
    *@guillemotleft C1 l73
     *brace_container
    { }
    *@guillemotright C1 l73
     *brace_container
    { }
    *@guilsinglleft C1 l73
     *brace_container
    { }
    *@guilsinglright C1 l73
     *brace_container
 *@chapter C2 l74 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{14}
 |section_level:{1}
 |section_number:{15}
  *arguments_line C1
   *line_arg C11
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@guillemetleft C1 l74
     *brace_container
    { }
    *@guillemetright C1 l74
     *brace_container
    { }
    *@guillemotleft C1 l74
     *brace_container
    { }
    *@guillemotright C1 l74
     *brace_container
    { }
    *@guilsinglleft C1 l74
     *brace_container
    { }
    *@guilsinglright C1 l74
     *brace_container
  {empty_line:\\n}
 *@node C1 l76 {`` \'\' --- -- ` \'}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{16}
 |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {`` \'\' --- -- ` \'}
 *@chapter C2 l77 {`` \'\' --- -- ` \'}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{15}
 |section_level:{1}
 |section_number:{16}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {`` \'\' --- -- ` \'}
  {empty_line:\\n}
 *@node C1 l79 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{17}
 |normalized:{AAA-AAA-BBB}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@acronym C2 l79
     *brace_arg C1
      {AAA}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {fff}
    { }
    *@acronym C1 l79
     *brace_arg C1
      {AAA}
    { }
    *@acronym C1 l79
     *brace_arg C1
      {BBB}
 *@chapter C2 l80 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{16}
 |section_level:{1}
 |section_number:{17}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@acronym C2 l80
     *brace_arg C1
      {AAA}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {fff}
    { }
    *@acronym C1 l80
     *brace_arg C1
      {AAA}
    { }
    *@acronym C1 l80
     *brace_arg C1
      {BBB}
  {empty_line:\\n}
 *@node C1 l82 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{18}
 |normalized:{CCC-CCC-DDD}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*@ifnottex C1 l83
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
    *@abbr C2 l82
     *brace_arg C1
      {CCC}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {rrr}
    { }
    *@abbr C1 l82
     *brace_arg C1
      {CCC}
    { }
    *@abbr C1 l82
     *brace_arg C1
      {DDD}
 *@chapter C2 l84 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{17}
 |section_level:{1}
 |section_number:{18}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*@end C1 l85
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
    *@abbr C2 l84
     *brace_arg C1
      {CCC}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {rrr}
    { }
    *@abbr C1 l84
     *brace_arg C1
      {CCC}
    { }
    *@abbr C1 l84
     *brace_arg C1
      {DDD}
  {empty_line:\\n}
 *@node C1 l87 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{19}
 |normalized:{someone_0040somewher-no_005fexplain_0040there}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@email C2 l87
     *brace_arg C3
      {someone}
      *@@
      {somewher}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {the someone}
    { }
    *@email C1 l87
     *brace_arg C3
      {no_explain}
      *@@
      {there}
 *@chapter C2 l88 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{18}
 |section_level:{1}
 |section_number:{19}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@email C2 l88
     *brace_arg C3
      {someone}
      *@@
      {somewher}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {the someone}
    { }
    *@email C1 l88
     *brace_arg C3
      {no_explain}
      *@@
      {there}
  {empty_line:\\n}
 *@node C1 l90 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{20}
 |normalized:{f_002d_002dile1-f_002d_002dile}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;2>
    >*@ifnottex C1 l91
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
    *@image C1 l90
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {f--ile1}
    {  }
    *@image C5 l90
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {f--ile}
     *brace_arg C1
      {aze}
     *brace_arg C1
      {az}
     *brace_arg C1
      {alt}
     *brace_arg C1
      {e--xt}
 *@chapter C2 l92 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{19}
 |section_level:{1}
 |section_number:{20}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2>
    >*@end C1 l93
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
    *@image C1 l92
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {f--ile1}
    {  }
    *@image C5 l92
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {f--ile}
     *brace_arg C1
      {aze}
     *brace_arg C1
      {az}
     *brace_arg C1
      {alt}
     *brace_arg C1
      {e--xt}
  {empty_line:\\n}
 *@node C1 l95 {@verb{. @ {} . .}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{21}
 |normalized:{-_0040-_007b_007d-_002e-}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;3>
    >*@ifnottex C1 l96
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
    *@verb C1 l95
    |INFO
    |delimiter:{.}
     *brace_container C1
      {raw: @ {} . }
 *@chapter C2 l97 {@verb{. @ {} . .}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{20}
 |section_level:{1}
 |section_number:{21}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3>
    >*@end C1 l98
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
    *@verb C1 l97
    |INFO
    |delimiter:{.}
     *brace_container C1
      {raw: @ {} . }
  {empty_line:\\n}
 *@node C1 l100 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{22}
 |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
  *arguments_line C1
   *line_arg C17
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@cite C1 l100
     *brace_container C2
      {cite }
      *@asis C1 l100
       *brace_container C1
        {asis}
    { }
    *@w C1 l100
     *brace_container C4
      {in }
      *@@
      {w }
      *@b C1 l100
       *brace_container C1
        {b}
    { }
    *@r C1 l100
     *brace_container C1
      {in r}
    { }
    *@sc C1 l100
     *brace_container C1
      {sc}
    { }
    *@strong C1 l100
     *brace_container C1
      {str}
    { }
    *@t C1 l100
     *brace_container C1
      {t}
    { }
    *@var C1 l100
     *brace_container C1
      {var}
    { }
    *@dfn C1 l100
     *brace_container C1
      {dfn}
    { }
    *@i C1 l100
     *brace_container C1
      {i}
 *@chapter C2 l101 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{21}
 |section_level:{1}
 |section_number:{22}
  *arguments_line C1
   *line_arg C17
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@cite C1 l101
     *brace_container C2
      {cite }
      *@asis C1 l101
       *brace_container C1
        {asis}
    { }
    *@w C1 l101
     *brace_container C4
      {in }
      *@@
      {w }
      *@b C1 l101
       *brace_container C1
        {b}
    { }
    *@r C1 l101
     *brace_container C1
      {in r}
    { }
    *@sc C1 l101
     *brace_container C1
      {sc}
    { }
    *@strong C1 l101
     *brace_container C1
      {str}
    { }
    *@t C1 l101
     *brace_container C1
      {t}
    { }
    *@var C1 l101
     *brace_container C1
      {var}
    { }
    *@dfn C1 l101
     *brace_container C1
      {dfn}
    { }
    *@i C1 l101
     *brace_container C1
      {i}
  {empty_line:\\n}
 *@node C1 l103 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{23}
 |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@env C1 l103
     *brace_container C1
      {env}
    { }
    *@code C1 l103
     *brace_container C1
      {code}
    { }
    *@option C1 l103
     *brace_container C1
      {option}
    { }
    *@samp C1 l103
     *brace_container C1
      {samp}
    { }
    *@command C1 l103
     *brace_container C1
      {command}
    { }
    *@file C1 l103
     *brace_container C1
      {file}
    { }
    *@kbd C1 l103
     *brace_container C2
      {C-x }
      *@key C1 l103
       *brace_container C1
        {ESC}
 *@chapter C2 l104 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{22}
 |section_level:{1}
 |section_number:{23}
  *arguments_line C1
   *line_arg C13
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@env C1 l104
     *brace_container C1
      {env}
    { }
    *@code C1 l104
     *brace_container C1
      {code}
    { }
    *@option C1 l104
     *brace_container C1
      {option}
    { }
    *@samp C1 l104
     *brace_container C1
      {samp}
    { }
    *@command C1 l104
     *brace_container C1
      {command}
    { }
    *@file C1 l104
     *brace_container C1
      {file}
    { }
    *@kbd C1 l104
     *brace_container C2
      {C-x }
      *@key C1 l104
       *brace_container C1
        {ESC}
  {empty_line:\\n}
 *@node C1 l106 {8.27@dmn{in}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{24}
 |normalized:{8_002e27in}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {8.27}
    *@dmn C1 l106
     *brace_container C1
      {in}
 *@chapter C2 l107 {8.27@dmn{in}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{23}
 |section_level:{1}
 |section_number:{24}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {8.27}
    *@dmn C1 l107
     *brace_container C1
      {in}
  {empty_line:\\n}
 *@node C1 l109 {@sansserif{sansserif} @slanted{slanted}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{25}
 |normalized:{sansserif-slanted}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@sansserif C1 l109
     *brace_container C1
      {sansserif}
    { }
    *@slanted C1 l109
     *brace_container C1
      {slanted}
 *@chapter C2 l110 {@sansserif{sansserif} @slanted{slanted}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{24}
 |section_level:{1}
 |section_number:{25}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@sansserif C1 l110
     *brace_container C1
      {sansserif}
    { }
    *@slanted C1 l110
     *brace_container C1
      {slanted}
  {empty_line:\\n}
 *@node C1 l112 {@indicateurl{indicateurl}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{26}
 |normalized:{indicateurl}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@indicateurl C1 l112
     *brace_container C1
      {indicateurl}
 *@chapter C2 l113 {@indicateurl{indicateurl}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{25}
 |section_level:{1}
 |section_number:{26}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@indicateurl C1 l113
     *brace_container C1
      {indicateurl}
  {empty_line:\\n}
 *@node C1 l115 {@sub{g}H 3@sup{rd}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{27}
 |normalized:{gH-3rd}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@sub C1 l115
     *brace_container C1
      {g}
    {H 3}
    *@sup C1 l115
     *brace_container C1
      {rd}
 *@chapter C2 l116 {@sub{g}H 3@sup{rd}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{26}
 |section_level:{1}
 |section_number:{27}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@sub C1 l116
     *brace_container C1
      {g}
    {H 3}
    *@sup C1 l116
     *brace_container C1
      {rd}
  {empty_line:\\n}
 *@node C1 l118 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{28}
 |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@url C1 l118
     *brace_arg C1
      {http://somewhere_aaa}
    { }
    *@url C2 l118
     *brace_arg C1
      {url}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {text}
    { }
    *@uref C3 l118
     *brace_arg C1
      {/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {ls}
 *@chapter C56 l119 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{27}
 |section_level:{1}
 |section_number:{28}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@url C1 l119
     *brace_arg C1
      {http://somewhere_aaa}
    { }
    *@url C2 l119
     *brace_arg C1
      {url}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {text}
    { }
    *@uref C3 l119
     *brace_arg C1
      {/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {ls}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l121
    *brace_arg C5
    |EXTRA
    |node_content:{@- @{ @}}
    |normalized:{-_007b-_007d}
     *@-
     { }
     *@{
     { }
     *@}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l123
    *brace_arg C17
    |EXTRA
    |node_content:{@  @\\t @! @* @. @: .@: @? @@}
    |normalized:{-_0021-_002e-_002e-_003f-_0040}
     *@ 
     { }
     *@\\t
     { }
     *@!
     { }
     *@*
     { }
     *@.
     { }
     *@:
     { .}
     *@:
     { }
     *@?
     { }
     *@@
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l125
    *brace_arg C9
    |EXTRA
    |node_content:{@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *@atchar C1 l125
      *brace_container
     { }
     *@lbracechar C1 l125
      *brace_container
     { }
     *@rbracechar C1 l125
      *brace_container
     { }
     *@backslashchar C1 l125
      *brace_container
     { }
     *@hashchar C1 l125
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l127
    *brace_arg C13
    |EXTRA
    |node_content:{@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}
    |normalized:{LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e}
     *@LaTeX C1 l127
      *brace_container
     { }
     *@TeX C1 l127
      *brace_container
     { }
     *@bullet C1 l127
      *brace_container
     { }
     *@comma C1 l127
      *brace_container
     { }
     *@copyright C1 l127
      *brace_container
     { }
     *@dots C1 l127
      *brace_container
     { }
     *@enddots C1 l127
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l129
    *brace_arg C11
    |EXTRA
    |node_content:{@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}
    |normalized:{_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212}
     *@equiv C1 l129
      *brace_container
     { }
     *@error C1 l129
      *brace_container
     { }
     *@euro C1 l129
      *brace_container
     { }
     *@exclamdown C1 l129
      *brace_container
     { }
     *@expansion C1 l129
      *brace_container
     { }
     *@minus C1 l129
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l131
    *brace_arg C5
    |EXTRA
    |node_content:{@geq{} @leq{} @arrow{}}
    |normalized:{_2265-_2264-_2192}
     *@geq C1 l131
      *brace_container
     { }
     *@leq C1 l131
      *brace_container
     { }
     *@arrow C1 l131
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l133
    *brace_arg C13
    |EXTRA
    |node_content:{@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}
    |normalized:{_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae}
     *@ordf C1 l133
      *brace_container
     { }
     *@ordm C1 l133
      *brace_container
     { }
     *@point C1 l133
      *brace_container
     { }
     *@pounds C1 l133
      *brace_container
     { }
     *@print C1 l133
      *brace_container
     { }
     *@questiondown C1 l133
      *brace_container
     { }
     *@registeredsymbol C1 l133
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l135
    *brace_arg C9
    |EXTRA
    |node_content:{@result{} @textdegree{} a@tie{}b @today{} @aa{}}
    |normalized:{_21d2-_00b0-a-b-_00e5}
     *@result C1 l135
      *brace_container
     { }
     *@textdegree C1 l135
      *brace_container
     { a}
     *@tie C1 l135
      *brace_container
     {b }
     *@today C1 l135
      *brace_container
     { }
     *@aa C1 l135
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l137
    *brace_arg C27
    |EXTRA
    |node_content:{@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe}
     *@AA C1 l137
      *brace_container
     { }
     *@ae C1 l137
      *brace_container
     { }
     *@oe C1 l137
      *brace_container
     { }
     *@AE C1 l137
      *brace_container
     { }
     *@OE C1 l137
      *brace_container
     { }
     *@o C1 l137
      *brace_container
     { }
     *@O C1 l137
      *brace_container
     { }
     *@ss C1 l137
      *brace_container
     { }
     *@l C1 l137
      *brace_container
     { }
     *@L C1 l137
      *brace_container
     { }
     *@DH C1 l137
      *brace_container
     { }
     *@dh C1 l137
      *brace_container
     { }
     *@TH C1 l137
      *brace_container
     { }
     *@th C1 l137
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l139
    *brace_arg C21
    |EXTRA
    |node_content:{@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *@" C1 l139
      *brace_container C1
       {a}
     { }
     *@~ C1 l139
      *brace_container C1
       {e}
     { }
     *@^ C1 l139
      *brace_container C1
       *@dotless C1 l139
        *brace_container C1
         {i}
     { }
     *@^ C1 l139
      *brace_container C1
       {a}
     { }
     *@` C1 l139
      *brace_container C1
       {a}
     { }
     *@\' C1 l139
      *following_arg C1
       {e}
     { }
     *@, C1 l139
      *brace_container C1
       {c}
     { }
     *@= C1 l139
      *brace_container C1
       {e}
     { }
     *@ringaccent C1 l139
      *brace_container C1
       {e}
     { }
     *@H C1 l139
      *brace_container C1
       {e}
     { }
     *@ogonek C1 l139
      *brace_container C1
       {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l141
    *brace_arg C13
    |EXTRA
    |node_content:{@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *@dotaccent C1 l141
      *brace_container C1
       {e}
     { }
     *@u C1 l141
      *brace_container C1
       {e}
     { }
     *@ubaraccent C1 l141
      *brace_container C1
       {e}
     { }
     *@udotaccent C1 l141
      *brace_container C1
       {e}
     { }
     *@v C1 l141
      *brace_container C1
       {e}
     { }
     *@dotless C1 l141
      *brace_container C1
       {j}
     { }
     *@tieaccent C1 l141
      *brace_container C1
       {ee}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l143
    *brace_arg C5
    |EXTRA
    |node_content:{@dotless{i} @`{@=E} @,{@\'C}}
    |normalized:{_0131-_1e14-_1e08}
     *@dotless C1 l143
      *brace_container C1
       {i}
     { }
     *@` C1 l143
      *brace_container C1
       *@= C1 l143
        *following_arg C1
         {E}
     { }
     *@, C1 l143
      *brace_container C1
       *@\' C1 l143
        *following_arg C1
         {C}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l145
    *brace_arg C11
    |EXTRA
    |node_content:{@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *@quotedblleft C1 l145
      *brace_container
     { }
     *@quotedblright C1 l145
      *brace_container
     { }
     *@quoteleft C1 l145
      *brace_container
     { }
     *@quoteright C1 l145
      *brace_container
     { }
     *@quotedblbase C1 l145
      *brace_container
     { }
     *@quotesinglbase C1 l145
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l147
    *brace_arg C11
    |EXTRA
    |node_content:{@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *@guillemetleft C1 l147
      *brace_container
     { }
     *@guillemetright C1 l147
      *brace_container
     { }
     *@guillemotleft C1 l147
      *brace_container
     { }
     *@guillemotright C1 l147
      *brace_container
     { }
     *@guilsinglleft C1 l147
      *brace_container
     { }
     *@guilsinglright C1 l147
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l149
    *brace_arg C1
    |EXTRA
    |node_content:{`` \'\' --- -- ` \'}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {`` \'\' --- -- ` \'}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l151
    *brace_arg C5
    |EXTRA
    |node_content:{@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
    |normalized:{AAA-AAA-BBB}
     *@acronym C2 l151
      *brace_arg C1
       {AAA}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {fff}
     { }
     *@acronym C1 l151
      *brace_arg C1
       {AAA}
     { }
     *@acronym C1 l151
      *brace_arg C1
       {BBB}
   {\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;4><p:1>
   >*@ifnottex C1 l153
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C2
   *@ref C1 l154
    *brace_arg C5
    |EXTRA
    |node_content:{@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
    |normalized:{CCC-CCC-DDD}
     *@abbr C2 l154
      *brace_arg C1
       {CCC}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {rrr}
     { }
     *@abbr C1 l154
      *brace_arg C1
       {CCC}
     { }
     *@abbr C1 l154
      *brace_arg C1
       {DDD}
   {\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:1>
    >*@end C1 l155
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l157
    *brace_arg C3
    |EXTRA
    |node_content:{@email{someone@@somewher, the someone} @email{no_explain@@there}}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *@email C2 l157
      *brace_arg C3
       {someone}
       *@@
       {somewher}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {the someone}
     { }
     *@email C1 l157
      *brace_arg C3
       {no_explain}
       *@@
       {there}
   {\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;5><p:1>
   >*@ifnottex C1 l159
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C2
   *@ref C1 l160
    *brace_arg C3
    |EXTRA
    |node_content:{@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *@image C1 l160
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {f--ile1}
     {  }
     *@image C5 l160
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {f--ile}
      *brace_arg C1
       {aze}
      *brace_arg C1
       {az}
      *brace_arg C1
       {alt}
      *brace_arg C1
       {e--xt}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l162
    *brace_arg C1
    |EXTRA
    |node_content:{@verb{. @ {} . .}}
    |normalized:{-_0040-_007b_007d-_002e-}
     *@verb C1 l162
     |INFO
     |delimiter:{.}
      *brace_container C1
       {raw: @ {} . }
   {\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;5><p:1>
    >*@end C1 l163
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l165
    *brace_arg C17
    |EXTRA
    |node_content:{@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *@cite C1 l165
      *brace_container C2
       {cite }
       *@asis C1 l165
        *brace_container C1
         {asis}
     { }
     *@w C1 l165
      *brace_container C4
       {in }
       *@@
       {w }
       *@b C1 l165
        *brace_container C1
         {b}
     { }
     *@r C1 l165
      *brace_container C1
       {in r}
     { }
     *@sc C1 l165
      *brace_container C1
       {sc}
     { }
     *@strong C1 l165
      *brace_container C1
       {str}
     { }
     *@t C1 l165
      *brace_container C1
       {t}
     { }
     *@var C1 l165
      *brace_container C1
       {var}
     { }
     *@dfn C1 l165
      *brace_container C1
       {dfn}
     { }
     *@i C1 l165
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l167
    *brace_arg C13
    |EXTRA
    |node_content:{@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *@env C1 l167
      *brace_container C1
       {env}
     { }
     *@code C1 l167
      *brace_container C1
       {code}
     { }
     *@option C1 l167
      *brace_container C1
       {option}
     { }
     *@samp C1 l167
      *brace_container C1
       {samp}
     { }
     *@command C1 l167
      *brace_container C1
       {command}
     { }
     *@file C1 l167
      *brace_container C1
       {file}
     { }
     *@kbd C1 l167
      *brace_container C2
       {C-x }
       *@key C1 l167
        *brace_container C1
         {ESC}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l169
    *brace_arg C2
    |EXTRA
    |node_content:{8.27@dmn{in}}
    |normalized:{8_002e27in}
     {8.27}
     *@dmn C1 l169
      *brace_container C1
       {in}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l171
    *brace_arg C3
    |EXTRA
    |node_content:{@sansserif{sansserif} @slanted{slanted}}
    |normalized:{sansserif-slanted}
     *@sansserif C1 l171
      *brace_container C1
       {sansserif}
     { }
     *@slanted C1 l171
      *brace_container C1
       {slanted}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l173
    *brace_arg C1
    |EXTRA
    |node_content:{@indicateurl{indicateurl}}
    |normalized:{indicateurl}
     *@indicateurl C1 l173
      *brace_container C1
       {indicateurl}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l175
    *brace_arg C3
    |EXTRA
    |node_content:{@sub{g}H 3@sup{rd}}
    |normalized:{gH-3rd}
     *@sub C1 l175
      *brace_container C1
       {g}
     {H 3}
     *@sup C1 l175
      *brace_container C1
       {rd}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l177
    *brace_arg C5
    |EXTRA
    |node_content:{@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *@url C1 l177
      *brace_arg C1
       {http://somewhere_aaa}
     { }
     *@url C2 l177
      *brace_arg C1
       {url}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {text}
     { }
     *@uref C3 l177
      *brace_arg C1
       {/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {ls}
   {\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'at_commands_in_refs'} = '@node Top
@top Top

@menu
* @- @{ @}::
* @  @	 @! @* @. @: .@: @? @@::
* @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}::
* @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}::
* @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}::
* @geq{} @leq{} @arrow{}::
* @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}::
* @result{} @textdegree{} a@tie{}b @today{} @aa{}::
* @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}::
* @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}::
* @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}::
* @dotless{i} @`{@=E} @,{@\'C}::
* @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}::
* @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}::
* `` \'\' --- -- ` \'::
* @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}::
* @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}::
* @email{someone@@somewher, the someone} @email{no_explain@@there}::
* @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}::
* @verb{. @ {} . .}::
* @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}::
* @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}::
* 8.27@dmn{in}::
* @sansserif{sansserif} @slanted{slanted}::
* @indicateurl{indicateurl}::
* @sub{g}H 3@sup{rd}::
* @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}::
@end menu

@node @- @{ @}
@chapter @- @{ @}

@node @  @	 @! @* @. @: .@: @? @@
@chapter @  @	 @! @* @. @: .@: @? @@

@node @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
@chapter @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}

@node @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
@chapter @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}

@node @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
@chapter @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}

@node @geq{} @leq{} @arrow{}
@chapter @geq{} @leq{} @arrow{}

@node @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
@chapter @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}

@node @result{} @textdegree{} a@tie{}b @today{} @aa{}
@chapter @result{} @textdegree{} a@tie{}b @today{} @aa{}

@node @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{} 
@chapter @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{} 

@node @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
@chapter  @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}

@node @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
@chapter @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}

@node @dotless{i} @`{@=E} @,{@\'C}
@chapter @dotless{i} @`{@=E} @,{@\'C}

@node @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
@chapter @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}

@node @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
@chapter @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}

@node `` \'\' --- -- ` \'
@chapter `` \'\' --- -- ` \'

@node @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
@chapter @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}

@node @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
@chapter @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}

@node @email{someone@@somewher, the someone} @email{no_explain@@there}
@chapter @email{someone@@somewher, the someone} @email{no_explain@@there}

@node @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
@chapter @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}

@node @verb{. @ {} . .}
@chapter @verb{. @ {} . .}

@node @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
@chapter @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}

@node @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
@chapter @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}

@node 8.27@dmn{in}
@chapter 8.27@dmn{in}

@node @sansserif{sansserif} @slanted{slanted}
@chapter @sansserif{sansserif} @slanted{slanted}

@node @indicateurl{indicateurl}
@chapter @indicateurl{indicateurl}

@node @sub{g}H 3@sup{rd}
@chapter @sub{g}H 3@sup{rd}

@node @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
@chapter @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}

@ref{@- @{ @}}

@ref{@  @	 @! @* @. @: .@: @? @@}

@ref{@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}

@ref{@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}}

@ref{@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}}

@ref{@geq{} @leq{} @arrow{}}

@ref{@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}}

@ref{@result{} @textdegree{} a@tie{}b @today{} @aa{}}

@ref{@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}}

@ref{@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}

@ref{@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}

@ref{@dotless{i} @`{@=E} @,{@\'C}}

@ref{@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}

@ref{@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}

@ref{`` \'\' --- -- ` \'}

@ref{@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}

@ref{@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}

@ref{@email{someone@@somewher, the someone} @email{no_explain@@there}}

@ref{@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}

@ref{@verb{. @ {} . .}}

@ref{@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}

@ref{@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}

@ref{8.27@dmn{in}}

@ref{@sansserif{sansserif} @slanted{slanted}}

@ref{@indicateurl{indicateurl}}

@ref{@sub{g}H 3@sup{rd}}

@ref{@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}

@bye
';


$result_texts{'at_commands_in_refs'} = 'Top
***

*  { }::
*     ! 
 .  . ? @::
* @ { } \\ #::
* LaTeX TeX * , (C) ... ...::
* == error-> Euro ! ==> -::
* >= <= ->::
* a o -!- # -| ? (R)::
* => o a b a sunny day aa::
* AA ae oe AE OE /o /O ss /l /L D d TH th::
* a" e~ i^ a^ a` e\' c, e= e* e\'\' e;::
* e. e( e_ .e e< j ee[::
* i E=` C\',::
* " " ` \' ,, ,::
* << >> << >> < >::
* `` \'\' --- -- ` \'::
* AAA (fff) AAA BBB::
* CCC (rrr) CCC DDD::
* the someone no_explain@there::
* f--ile1  f--ile::
*  @ {} . ::
* cite asis in @w b in r SC str t var dfn i::
* env code option samp command file C-x ESC::
* 8.27in::
* sansserif slanted::
* indicateurl::
* gH 3rd::
* http://somewhere_aaa url (text) ls::

1  { }
******

2     ! 
 .  . ? @
*****************

3 @ { } \\ #
***********

4 LaTeX TeX * , (C) ... ...
***************************

5 == error-> Euro ! ==> -
*************************

6 >= <= ->
**********

7 a o -!- # -| ? (R)
********************

8 => o a b a sunny day aa
*************************

9 AA ae oe AE OE /o /O ss /l /L D d TH th
*****************************************

10 a" e~ i^ a^ a` e\' c, e= e* e\'\' e;
************************************

11 e. e( e_ .e e< j ee[
***********************

12 i E=` C\',
************

13 " " ` \' ,, ,
***************

14 << >> << >> < >
******************

15 " " -- - ` \'
***************

16 AAA (fff) AAA BBB
********************

17 CCC (rrr) CCC DDD
********************

18 the someone no_explain@there
*******************************

19 f--ile1  f--ile
******************

20  @ {} . 
***********

21 cite asis in @w b in r SC str t var dfn i
********************************************

22 env code option samp command file C-x ESC
********************************************

23 8.27in
*********

24 sansserif slanted
********************

25 indicateurl
**************

26 gH 3rd
*********

27 http://somewhere_aaa url (text) ls
*************************************

 { }

    ! 
 .  . ? @

@ { } \\ #

LaTeX TeX * , (C) ... ...

== error-> Euro ! ==> -

>= <= ->

a o -!- # -| ? (R)

=> o a b a sunny day aa

AA ae oe AE OE /o /O ss /l /L D d TH th

a" e~ i^ a^ a` e\' c, e= e* e\'\' e;

e. e( e_ .e e< j ee[

i E=` C\',

" " ` \' ,, ,

<< >> << >> < >

" " -- - ` \'

AAA (fff) AAA BBB

CCC (rrr) CCC DDD

the someone no_explain@there

f--ile1  f--ile

 @ {} . 

cite asis in @w b in r SC str t var dfn i

env code option samp command file C-x ESC

8.27in

sansserif slanted

indicateurl

gH 3rd

http://somewhere_aaa url (text) ls

';

$result_errors{'at_commands_in_refs'} = '* W l95|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* W l97|@verb should not appear on @chapter line
 warning: @verb should not appear on @chapter line

* W l162|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

';

$result_nodes_list{'at_commands_in_refs'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  @- @{ @}
  @  @	 @! @* @. @: .@: @? @@
  @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  @geq{} @leq{} @arrow{}
  @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  @result{} @textdegree{} a@tie{}b @today{} @aa{}
  @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  @dotless{i} @`{@=E} @,{@\'C}
  @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  `` \'\' --- -- ` \'
  @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  @email{someone@@somewher, the someone} @email{no_explain@@there}
  @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  @verb{. @ {} . .}
  @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  8.27@dmn{in}
  @sansserif{sansserif} @slanted{slanted}
  @indicateurl{indicateurl}
  @sub{g}H 3@sup{rd}
  @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 node_directions:
  next->@- @{ @}
2|@- @{ @}
 associated_section: 1 @- @{ @}
 associated_title_command: 1 @- @{ @}
 node_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  prev->Top
  up->Top
3|@  @	 @! @* @. @: .@: @? @@
 associated_section: 2 @  @	 @! @* @. @: .@: @? @@
 associated_title_command: 2 @  @	 @! @* @. @: .@: @? @@
 node_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
4|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_section: 3 @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_title_command: 3 @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 node_directions:
  next->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
5|@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 associated_section: 4 @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 associated_title_command: 4 @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 node_directions:
  next->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
6|@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 associated_section: 5 @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 associated_title_command: 5 @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 node_directions:
  next->@geq{} @leq{} @arrow{}
  prev->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  up->Top
7|@geq{} @leq{} @arrow{}
 associated_section: 6 @geq{} @leq{} @arrow{}
 associated_title_command: 6 @geq{} @leq{} @arrow{}
 node_directions:
  next->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  prev->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  up->Top
8|@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 associated_section: 7 @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 associated_title_command: 7 @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 node_directions:
  next->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  prev->@geq{} @leq{} @arrow{}
  up->Top
9|@result{} @textdegree{} a@tie{}b @today{} @aa{}
 associated_section: 8 @result{} @textdegree{} a@tie{}b @today{} @aa{}
 associated_title_command: 8 @result{} @textdegree{} a@tie{}b @today{} @aa{}
 node_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  prev->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  up->Top
10|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 associated_section: 9 @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 associated_title_command: 9 @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 node_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  up->Top
11|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_section: 10 @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_title_command: 10 @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 node_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  up->Top
12|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_section: 11 @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_title_command: 11 @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 node_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
13|@dotless{i} @`{@=E} @,{@\'C}
 associated_section: 12 @dotless{i} @`{@=E} @,{@\'C}
 associated_title_command: 12 @dotless{i} @`{@=E} @,{@\'C}
 node_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
14|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_section: 13 @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_title_command: 13 @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 node_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
15|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_section: 14 @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_title_command: 14 @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 node_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
16|`` \'\' --- -- ` \'
 associated_section: 15 `` \'\' --- -- ` \'
 associated_title_command: 15 `` \'\' --- -- ` \'
 node_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
17|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_section: 16 @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_title_command: 16 @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 node_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
18|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_section: 17 @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_title_command: 17 @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 node_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
19|@email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_section: 18 @email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_title_command: 18 @email{someone@@somewher, the someone} @email{no_explain@@there}
 node_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
20|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_section: 19 @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_title_command: 19 @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 node_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
21|@verb{. @ {} . .}
 associated_section: 20 @verb{. @ {} . .}
 associated_title_command: 20 @verb{. @ {} . .}
 node_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
22|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_section: 21 @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_title_command: 21 @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 node_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
23|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_section: 22 @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_title_command: 22 @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 node_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
24|8.27@dmn{in}
 associated_section: 23 8.27@dmn{in}
 associated_title_command: 23 8.27@dmn{in}
 node_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
25|@sansserif{sansserif} @slanted{slanted}
 associated_section: 24 @sansserif{sansserif} @slanted{slanted}
 associated_title_command: 24 @sansserif{sansserif} @slanted{slanted}
 node_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
26|@indicateurl{indicateurl}
 associated_section: 25 @indicateurl{indicateurl}
 associated_title_command: 25 @indicateurl{indicateurl}
 node_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
27|@sub{g}H 3@sup{rd}
 associated_section: 26 @sub{g}H 3@sup{rd}
 associated_title_command: 26 @sub{g}H 3@sup{rd}
 node_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
28|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_section: 27 @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_title_command: 27 @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 node_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
';

$result_sections_list{'at_commands_in_refs'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@- @{ @}
 section_children:
  1|@- @{ @}
  2|@  @	 @! @* @. @: .@: @? @@
  3|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  4|@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  5|@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  6|@geq{} @leq{} @arrow{}
  7|@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  8|@result{} @textdegree{} a@tie{}b @today{} @aa{}
  9|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  10|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  11|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  12|@dotless{i} @`{@=E} @,{@\'C}
  13|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  14|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  15|`` \'\' --- -- ` \'
  16|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  17|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  18|@email{someone@@somewher, the someone} @email{no_explain@@there}
  19|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  20|@verb{. @ {} . .}
  21|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  22|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  23|8.27@dmn{in}
  24|@sansserif{sansserif} @slanted{slanted}
  25|@indicateurl{indicateurl}
  26|@sub{g}H 3@sup{rd}
  27|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
2|@- @{ @}
 associated_anchor_command: @- @{ @}
 associated_node: @- @{ @}
 section_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  up->Top
 toplevel_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  prev->Top
  up->Top
3|@  @	 @! @* @. @: .@: @? @@
 associated_anchor_command: @  @	 @! @* @. @: .@: @? @@
 associated_node: @  @	 @! @* @. @: .@: @? @@
 section_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
 toplevel_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
4|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_anchor_command: @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_node: @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 section_directions:
  next->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
 toplevel_directions:
  next->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
5|@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 associated_anchor_command: @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 associated_node: @LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
 section_directions:
  next->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
 toplevel_directions:
  next->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
6|@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 associated_anchor_command: @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 associated_node: @equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
 section_directions:
  next->@geq{} @leq{} @arrow{}
  prev->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  up->Top
 toplevel_directions:
  next->@geq{} @leq{} @arrow{}
  prev->@LaTeX{} @TeX{} @bullet{} @comma{} @copyright{} @dots{} @enddots{}
  up->Top
7|@geq{} @leq{} @arrow{}
 associated_anchor_command: @geq{} @leq{} @arrow{}
 associated_node: @geq{} @leq{} @arrow{}
 section_directions:
  next->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  prev->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  up->Top
 toplevel_directions:
  next->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  prev->@equiv{} @error{} @euro{} @exclamdown{} @expansion{} @minus{}
  up->Top
8|@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 associated_anchor_command: @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 associated_node: @ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
 section_directions:
  next->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  prev->@geq{} @leq{} @arrow{}
  up->Top
 toplevel_directions:
  next->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  prev->@geq{} @leq{} @arrow{}
  up->Top
9|@result{} @textdegree{} a@tie{}b @today{} @aa{}
 associated_anchor_command: @result{} @textdegree{} a@tie{}b @today{} @aa{}
 associated_node: @result{} @textdegree{} a@tie{}b @today{} @aa{}
 section_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  prev->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  up->Top
 toplevel_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  prev->@ordf{} @ordm{} @point{} @pounds{} @print{} @questiondown{} @registeredsymbol{}
  up->Top
10|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 associated_anchor_command: @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 associated_node: @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
 section_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  up->Top
 toplevel_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->@result{} @textdegree{} a@tie{}b @today{} @aa{}
  up->Top
11|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_anchor_command: @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_node: @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 section_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  up->Top
 toplevel_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @TH{} @th{}
  up->Top
12|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_anchor_command: @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_node: @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 section_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
 toplevel_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
13|@dotless{i} @`{@=E} @,{@\'C}
 associated_anchor_command: @dotless{i} @`{@=E} @,{@\'C}
 associated_node: @dotless{i} @`{@=E} @,{@\'C}
 section_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
 toplevel_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
14|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_anchor_command: @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_node: @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 section_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
 toplevel_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
15|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_anchor_command: @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_node: @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 section_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
 toplevel_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
16|`` \'\' --- -- ` \'
 associated_anchor_command: `` \'\' --- -- ` \'
 associated_node: `` \'\' --- -- ` \'
 section_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
 toplevel_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
17|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_anchor_command: @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_node: @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 section_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
 toplevel_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
18|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_anchor_command: @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_node: @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 section_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
 toplevel_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
19|@email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_anchor_command: @email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_node: @email{someone@@somewher, the someone} @email{no_explain@@there}
 section_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
 toplevel_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
20|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_anchor_command: @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_node: @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 section_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
 toplevel_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
21|@verb{. @ {} . .}
 associated_anchor_command: @verb{. @ {} . .}
 associated_node: @verb{. @ {} . .}
 section_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
 toplevel_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
22|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_anchor_command: @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_node: @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 section_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
 toplevel_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
23|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_anchor_command: @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_node: @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 section_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
 toplevel_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
24|8.27@dmn{in}
 associated_anchor_command: 8.27@dmn{in}
 associated_node: 8.27@dmn{in}
 section_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
 toplevel_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
25|@sansserif{sansserif} @slanted{slanted}
 associated_anchor_command: @sansserif{sansserif} @slanted{slanted}
 associated_node: @sansserif{sansserif} @slanted{slanted}
 section_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
 toplevel_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
26|@indicateurl{indicateurl}
 associated_anchor_command: @indicateurl{indicateurl}
 associated_node: @indicateurl{indicateurl}
 section_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
 toplevel_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
27|@sub{g}H 3@sup{rd}
 associated_anchor_command: @sub{g}H 3@sup{rd}
 associated_node: @sub{g}H 3@sup{rd}
 section_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
 toplevel_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
28|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_anchor_command: @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_node: @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 section_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
 toplevel_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
';

$result_sectioning_root{'at_commands_in_refs'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'at_commands_in_refs'} = '';


$result_converted{'plaintext'}->{'at_commands_in_refs'} = 'Top
***

1 { }
*****

2     !
. . ? @
**************

3 @ { } \\ #
***********

4 LaTeX TeX • , © ... ...
*************************

5 ≡ error→ € ¡ ↦ −
******************

6 ≥ ≤ →
*******

7 ª º ⋆ £ ⊣ ¿ ®
***************

8 ⇒ ° a b a sunny day å
***********************

9 Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ
*****************************

10 ä ẽ î â à é ç ē e̊ e̋ ę
************************

11 ė ĕ e̲ ẹ ě ȷ e͡e
*****************

12 ı Ḕ Ḉ
********

13 “ ” ‘ ’ „ ‚
**************

14 « » « » ‹ ›
**************

15 " " -- - \' \'
***************

16 AAA (fff) AAA BBB
********************

17 CCC (rrr) CCC DDD
********************

18 the someone <someone@somewher> <no_explain@there>
****************************************************

19 [f--ile1] Image description""\\.
**********************************

20  @ {} . 
***********

21 ‘cite asis’ in @w b in r SC *str* t VAR “dfn” i
**************************************************

22 ‘env’ ‘code’ ‘option’ ‘samp’ ‘command’ ‘file’ ‘C-x <ESC>’
************************************************************

23 8.27in
*********

24 sansserif slanted
********************

25 ‘indicateurl’
****************

26 _{g}H 3^{rd}
***************

27 <http://somewhere_aaa> text (url) ls
***************************************

{ }

       !
. . ? @

   @ { } \\ #

   LaTeX TeX • , © ... ...

   ≡ error→ € ¡ ↦ −

   ≥ ≤ →

   ª º ⋆ £ ⊣ ¿ ®

   ⇒ ° a b a sunny day å

   Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ

   ä ẽ î â à é ç ē e̊ e̋ ę

   ė ĕ e̲ ẹ ě ȷ e͡e

   ı Ḕ Ḉ

   “ ” ‘ ’ „ ‚

   « » « » ‹ ›

   `` \'\' --- -- ` \'

   AAA (fff) AAA BBB

   CCC (rrr) CCC DDD

   the someone <someone@somewher> <no_explain@there>

   [f--ile1] Image description""\\.

    @ {} . 

   cite asis in @w b in r SC *str* t VAR dfn i

   env code option samp command file C-x <ESC>

   8.27in

   sansserif slanted

   indicateurl

   _{g}H 3^{rd}

   <http://somewhere_aaa> text (url) ls

';

$result_converted_errors{'plaintext'}->{'at_commands_in_refs'} = '* W l92|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l90|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

';


$result_converted{'html'}->{'at_commands_in_refs'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
kbd.kbd {font-style: oblique}
kbd.key {font-style: normal}
span.r {font-family: initial; font-weight: normal; font-style: normal}
span.sansserif {font-family: sans-serif; font-weight: normal}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_007b-_007d" accesskey="n" rel="next"> { }</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#-_007b-_007d" accesskey="1"> { }</a></li>
<li><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="2">&nbsp; &nbsp; ! <br> .  . ? @</a></li>
<li><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="3">@ { } \\ #</a></li>
<li><a href="#LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e" accesskey="4">LaTeX TeX &bull; , &copy; &hellip; <small class="enddots">...</small></a></li>
<li><a href="#g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212" accesskey="5">&equiv; error&rarr; &euro; &iexcl; &rarr; &minus;</a></li>
<li><a href="#g_t_2265-_2264-_2192" accesskey="6">&ge; &le; &rarr;</a></li>
<li><a href="#g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae" accesskey="7">&ordf; &ordm; &lowast; &pound; &#8867; &iquest; &reg;</a></li>
<li><a href="#g_t_21d2-_00b0-a-b-_00e5" accesskey="8">&rArr; &deg; a&nbsp;b a sunny day &aring;</a></li>
<li><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe" accesskey="9">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &THORN; &thorn;</a></li>
<li><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></li>
<li><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></li>
<li><a href="#g_t_0131-_1e14-_1e08">&inodot; &#274;&#768; &#262;&#807;</a></li>
<li><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></li>
<li><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></li>
<li><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></li>
<li><a href="#AAA-AAA-BBB"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></li>
<li><a href="#CCC-CCC-DDD"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></li>
<li><a href="#someone_0040somewher-no_005fexplain_0040there"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></li>
<li><a href="#f_002d_002dile1-f_002d_002dile"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></li>
<li><a href="#-_0040-_007b_007d-_002e-"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></li>
<li><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></li>
<li><a href="#env-code-option-samp-command-file-C_002dx-ESC"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></li>
<li><a href="#g_t8_002e27in">8.27<span class="dmn">in</span></a></li>
<li><a href="#sansserif-slanted"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></li>
<li><a href="#indicateurl">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></li>
<li><a href="#gH-3rd"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></li>
<li><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="-_007b-_007d">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="n" rel="next">&nbsp; &nbsp; ! <br> .  . ? @</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_007b-_007d-1"><span>1  { }<a class="copiable-link" href="#-_007b-_007d-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="-_0021-_002e-_002e-_003f-_0040">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="n" rel="next">@ { } \\ #</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_007b-_007d" accesskey="p" rel="prev"> { }</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_0021-_002e-_002e-_003f-_0040-1"><span>2 &nbsp; &nbsp; ! <br> .  . ? @<a class="copiable-link" href="#-_0021-_002e-_002e-_003f-_0040-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0040-_007b-_007d-_005c-_0023">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e" accesskey="n" rel="next">LaTeX TeX &bull; , &copy; &hellip; <small class="enddots">...</small></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="p" rel="prev">&nbsp; &nbsp; ! <br> .  . ? @</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0040-_007b-_007d-_005c-_0023-1"><span>3 @ { } \\ #<a class="copiable-link" href="#g_t_0040-_007b-_007d-_005c-_0023-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212" accesskey="n" rel="next">&equiv; error&rarr; &euro; &iexcl; &rarr; &minus;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="p" rel="prev">@ { } \\ #</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e-1"><span>4 LaTeX TeX &bull; , &copy; &hellip; <small class="enddots">...</small><a class="copiable-link" href="#LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2265-_2264-_2192" accesskey="n" rel="next">&ge; &le; &rarr;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e" accesskey="p" rel="prev">LaTeX TeX &bull; , &copy; &hellip; <small class="enddots">...</small></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212-1"><span>5 &equiv; error&rarr; &euro; &iexcl; &rarr; &minus;<a class="copiable-link" href="#g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_2265-_2264-_2192">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae" accesskey="n" rel="next">&ordf; &ordm; &lowast; &pound; &#8867; &iquest; &reg;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212" accesskey="p" rel="prev">&equiv; error&rarr; &euro; &iexcl; &rarr; &minus;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_2265-_2264-_2192-1"><span>6 &ge; &le; &rarr;<a class="copiable-link" href="#g_t_2265-_2264-_2192-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_21d2-_00b0-a-b-_00e5" accesskey="n" rel="next">&rArr; &deg; a&nbsp;b a sunny day &aring;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_2265-_2264-_2192" accesskey="p" rel="prev">&ge; &le; &rarr;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae-1"><span>7 &ordf; &ordm; &lowast; &pound; &#8867; &iquest; &reg;<a class="copiable-link" href="#g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_21d2-_00b0-a-b-_00e5">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe" accesskey="n" rel="next">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &THORN; &thorn;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae" accesskey="p" rel="prev">&ordf; &ordm; &lowast; &pound; &#8867; &iquest; &reg;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_21d2-_00b0-a-b-_00e5-1"><span>8 &rArr; &deg; a&nbsp;b a sunny day &aring;<a class="copiable-link" href="#g_t_21d2-_00b0-a-b-_00e5-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" accesskey="n" rel="next">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_21d2-_00b0-a-b-_00e5" accesskey="p" rel="prev">&rArr; &deg; a&nbsp;b a sunny day &aring;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe-1"><span>9 &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &THORN; &thorn;<a class="copiable-link" href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e" accesskey="n" rel="next">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe" accesskey="p" rel="prev">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &THORN; &thorn;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119-1"><span>10 &auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;<a class="copiable-link" href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0131-_1e14-_1e08" accesskey="n" rel="next">&inodot; &#274;&#768; &#262;&#807;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" accesskey="p" rel="prev">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e-1"><span>11 &#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e<a class="copiable-link" href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0131-_1e14-_1e08">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a" accesskey="n" rel="next">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e" accesskey="p" rel="prev">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0131-_1e14-_1e08-1"><span>12 &inodot; &#274;&#768; &#262;&#807;<a class="copiable-link" href="#g_t_0131-_1e14-_1e08-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_201c-_201d-_2018-_2019-_201e-_201a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a" accesskey="n" rel="next">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0131-_1e14-_1e08" accesskey="p" rel="prev">&inodot; &#274;&#768; &#262;&#807;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_201c-_201d-_2018-_2019-_201e-_201a-1"><span>13 &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;<a class="copiable-link" href="#g_t_201c-_201d-_2018-_2019-_201e-_201a-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027" accesskey="n" rel="next">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a" accesskey="p" rel="prev">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a-1"><span>14 &laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;<a class="copiable-link" href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#AAA-AAA-BBB" accesskey="n" rel="next"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a" accesskey="p" rel="prev">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027-1"><span>15 &ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;<a class="copiable-link" href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="AAA-AAA-BBB">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#CCC-CCC-DDD" accesskey="n" rel="next"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027" accesskey="p" rel="prev">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="AAA-AAA-BBB-1"><span>16 <abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr><a class="copiable-link" href="#AAA-AAA-BBB-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="CCC-CCC-DDD">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#someone_0040somewher-no_005fexplain_0040there" accesskey="n" rel="next"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#AAA-AAA-BBB" accesskey="p" rel="prev"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="CCC-CCC-DDD-1"><span>17 <abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr><a class="copiable-link" href="#CCC-CCC-DDD-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="someone_0040somewher-no_005fexplain_0040there">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#f_002d_002dile1-f_002d_002dile" accesskey="n" rel="next"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#CCC-CCC-DDD" accesskey="p" rel="prev"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="someone_0040somewher-no_005fexplain_0040there-1"><span>18 <a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a><a class="copiable-link" href="#someone_0040somewher-no_005fexplain_0040there-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="f_002d_002dile1-f_002d_002dile">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_0040-_007b_007d-_002e-" accesskey="n" rel="next"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#someone_0040somewher-no_005fexplain_0040there" accesskey="p" rel="prev"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="f_002d_002dile1-f_002d_002dile-1"><span>19 <img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"><a class="copiable-link" href="#f_002d_002dile1-f_002d_002dile-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="-_0040-_007b_007d-_002e-">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i" accesskey="n" rel="next"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#f_002d_002dile1-f_002d_002dile" accesskey="p" rel="prev"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_0040-_007b_007d-_002e--1"><span>20 <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code><a class="copiable-link" href="#-_0040-_007b_007d-_002e--1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#env-code-option-samp-command-file-C_002dx-ESC" accesskey="n" rel="next"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_0040-_007b_007d-_002e-" accesskey="p" rel="prev"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i-1"><span>21 <cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i><a class="copiable-link" href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="env-code-option-samp-command-file-C_002dx-ESC">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t8_002e27in" accesskey="n" rel="next">8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i" accesskey="p" rel="prev"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="env-code-option-samp-command-file-C_002dx-ESC-1"><span>22 <code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd><a class="copiable-link" href="#env-code-option-samp-command-file-C_002dx-ESC-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#sansserif-slanted" accesskey="n" rel="next"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#env-code-option-samp-command-file-C_002dx-ESC" accesskey="p" rel="prev"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t8_002e27in-1"><span>23 8.27<span class="dmn">in</span><a class="copiable-link" href="#g_t8_002e27in-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="sansserif-slanted">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#indicateurl" accesskey="n" rel="next">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t8_002e27in" accesskey="p" rel="prev">8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="sansserif-slanted-1"><span>24 <span class="sansserif">sansserif</span> <i class="slanted">slanted</i><a class="copiable-link" href="#sansserif-slanted-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="indicateurl">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#gH-3rd" accesskey="n" rel="next"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#sansserif-slanted" accesskey="p" rel="prev"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="indicateurl-1"><span>25 &lsquo;<code class="indicateurl">indicateurl</code>&rsquo;<a class="copiable-link" href="#indicateurl-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="gH-3rd">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="n" rel="next"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#indicateurl" accesskey="p" rel="prev">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="gH-3rd-1"><span>26 <sub class="sub">g</sub>H 3<sup class="sup">rd</sup><a class="copiable-link" href="#gH-3rd-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#gH-3rd" accesskey="p" rel="prev"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls-1"><span>27 <a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a><a class="copiable-link" href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls-1"> &para;</a></span></h2>

<p><a class="ref" href="#-_007b-_007d"> { }</a>
</p>
<p><a class="ref" href="#-_0021-_002e-_002e-_003f-_0040">&nbsp; &nbsp; ! <br> .  . ? @</a>
</p>
<p><a class="ref" href="#g_t_0040-_007b-_007d-_005c-_0023">@ { } \\ #</a>
</p>
<p><a class="ref" href="#LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e">LaTeX TeX &bull; , &copy; &hellip; <small class="enddots">...</small></a>
</p>
<p><a class="ref" href="#g_t_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212">&equiv; error&rarr; &euro; &iexcl; &rarr; &minus;</a>
</p>
<p><a class="ref" href="#g_t_2265-_2264-_2192">&ge; &le; &rarr;</a>
</p>
<p><a class="ref" href="#g_t_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae">&ordf; &ordm; &lowast; &pound; &#8867; &iquest; &reg;</a>
</p>
<p><a class="ref" href="#g_t_21d2-_00b0-a-b-_00e5">&rArr; &deg; a&nbsp;b a sunny day &aring;</a>
</p>
<p><a class="ref" href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &THORN; &thorn;</a>
</p>
<p><a class="ref" href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a>
</p>
<p><a class="ref" href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a>
</p>
<p><a class="ref" href="#g_t_0131-_1e14-_1e08">&inodot; &#274;&#768; &#262;&#807;</a>
</p>
<p><a class="ref" href="#g_t_201c-_201d-_2018-_2019-_201e-_201a">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a>
</p>
<p><a class="ref" href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a>
</p>
<p><a class="ref" href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a>
</p>
<p><a class="ref" href="#AAA-AAA-BBB"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a>
</p>
<p><a class="ref" href="#CCC-CCC-DDD"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a>
</p>
<p><a class="ref" href="#someone_0040somewher-no_005fexplain_0040there"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a>
</p>
<p><a class="ref" href="#f_002d_002dile1-f_002d_002dile"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a>
</p>
<p><a class="ref" href="#-_0040-_007b_007d-_002e-"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a>
</p>
<p><a class="ref" href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a>
</p>
<p><a class="ref" href="#env-code-option-samp-command-file-C_002dx-ESC"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a>
</p>
<p><a class="ref" href="#g_t8_002e27in">8.27<span class="dmn">in</span></a>
</p>
<p><a class="ref" href="#sansserif-slanted"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a>
</p>
<p><a class="ref" href="#indicateurl">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a>
</p>
<p><a class="ref" href="#gH-3rd"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a>
</p>
<p><a class="ref" href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a>
</p>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'at_commands_in_refs'} = '* W l92|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l90|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l90|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l92|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l160|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

';


$result_converted{'xml'}->{'at_commands_in_refs'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">&hyphenbreak; &lbrace; &rbrace;</nodenext></node>
<top spaces=" "><sectiontitle>Top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>&hyphenbreak; &lbrace; &rbrace;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ge; &le; &rarr;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&result; &deg; a&nbsp;b <today/> &aring;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>`` \'\' --- -- ` \'</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><verb delimiter="."> @ {} . </verb></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>8.27<dmn>in</dmn></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><sansserif>sansserif</sansserif> <slanted>slanted</slanted></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><indicateurl>indicateurl</indicateurl></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><sub>g</sub>H 3<sup>rd</sup></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc spaces=" ">text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="-_007b-_007d" spaces=" "><nodename>&hyphenbreak; &lbrace; &rbrace;</nodename><nodenext automatic="on"><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&hyphenbreak; &lbrace; &rbrace;</sectiontitle>

</chapter>
<node identifier="-_0021-_002e-_002e-_003f-_0040" spaces=" "><nodename><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodename><nodenext automatic="on">&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodenext><nodeprev automatic="on">&hyphenbreak; &lbrace; &rbrace;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</sectiontitle>

</chapter>
<node identifier="_0040-_007b-_007d-_005c-_0023" spaces=" "><nodename>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodename><nodenext automatic="on">&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</nodenext><nodeprev automatic="on"><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</sectiontitle>

</chapter>
<node identifier="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e" spaces=" "><nodename>&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</nodename><nodenext automatic="on">&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</nodenext><nodeprev automatic="on">&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</sectiontitle>

</chapter>
<node identifier="_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212" spaces=" "><nodename>&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</nodename><nodenext automatic="on">&ge; &le; &rarr;</nodenext><nodeprev automatic="on">&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</sectiontitle>

</chapter>
<node identifier="_2265-_2264-_2192" spaces=" "><nodename>&ge; &le; &rarr;</nodename><nodenext automatic="on">&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</nodenext><nodeprev automatic="on">&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&ge; &le; &rarr;</sectiontitle>

</chapter>
<node identifier="_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae" spaces=" "><nodename>&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</nodename><nodenext automatic="on">&result; &deg; a&nbsp;b <today/> &aring;</nodenext><nodeprev automatic="on">&ge; &le; &rarr;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</sectiontitle>

</chapter>
<node identifier="_21d2-_00b0-a-b-_00e5" spaces=" "><nodename>&result; &deg; a&nbsp;b <today/> &aring;</nodename><nodenext automatic="on">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn;</nodenext><nodeprev automatic="on">&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&result; &deg; a&nbsp;b <today/> &aring;</sectiontitle>

</chapter>
<node identifier="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe" spaces=" "><nodename trailingspaces=" ">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn;</nodename><nodenext automatic="on"><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodenext><nodeprev automatic="on">&result; &deg; a&nbsp;b <today/> &aring;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn; </sectiontitle>

</chapter>
<node identifier="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" spaces=" "><nodename><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodename><nodenext automatic="on"><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodenext><nodeprev automatic="on">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces="  "><sectiontitle><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></sectiontitle>

</chapter>
<node identifier="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e" spaces=" "><nodename><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodename><nodenext automatic="on"><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodenext><nodeprev automatic="on"><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></sectiontitle>

</chapter>
<node identifier="_0131-_1e14-_1e08" spaces=" "><nodename><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodename><nodenext automatic="on">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodenext><nodeprev automatic="on"><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></sectiontitle>

</chapter>
<node identifier="_201c-_201d-_2018-_2019-_201e-_201a" spaces=" "><nodename>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodename><nodenext automatic="on">&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodenext><nodeprev automatic="on"><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</sectiontitle>

</chapter>
<node identifier="_00ab-_00bb-_00ab-_00bb-_2039-_203a" spaces=" "><nodename>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodename><nodenext automatic="on">`` \'\' --- -- ` \'</nodenext><nodeprev automatic="on">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</sectiontitle>

</chapter>
<node identifier="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027" spaces=" "><nodename>`` \'\' --- -- ` \'</nodename><nodenext automatic="on"><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodenext><nodeprev automatic="on">&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>&textldquo; &textrdquo; &textmdash; &textndash; &textlsquo; &textrsquo;</sectiontitle>

</chapter>
<node identifier="AAA-AAA-BBB" spaces=" "><nodename><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodename><nodenext automatic="on"><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodenext><nodeprev automatic="on">`` \'\' --- -- ` \'</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></sectiontitle>

</chapter>
<node identifier="CCC-CCC-DDD" spaces=" "><nodename><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodename><nodenext automatic="on"><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodenext><nodeprev automatic="on"><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></sectiontitle>

</chapter>
<node identifier="someone_0040somewher-no_005fexplain_0040there" spaces=" "><nodename><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodename><nodenext automatic="on"><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodenext><nodeprev automatic="on"><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></sectiontitle>

</chapter>
<node identifier="f_002d_002dile1-f_002d_002dile" spaces=" "><nodename><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodename><nodenext automatic="on"><verb delimiter="."> @ {} . </verb></nodenext><nodeprev automatic="on"><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></sectiontitle>

</chapter>
<node identifier="-_0040-_007b_007d-_002e-" spaces=" "><nodename><verb delimiter="."> @ {} . </verb></nodename><nodenext automatic="on"><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodenext><nodeprev automatic="on"><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><verb delimiter="."> @ {} . </verb></sectiontitle>

</chapter>
<node identifier="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i" spaces=" "><nodename><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodename><nodenext automatic="on"><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodenext><nodeprev automatic="on"><verb delimiter="."> @ {} . </verb></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></sectiontitle>

</chapter>
<node identifier="env-code-option-samp-command-file-C_002dx-ESC" spaces=" "><nodename><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodename><nodenext automatic="on">8.27<dmn>in</dmn></nodenext><nodeprev automatic="on"><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></sectiontitle>

</chapter>
<node identifier="8_002e27in" spaces=" "><nodename>8.27<dmn>in</dmn></nodename><nodenext automatic="on"><sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodenext><nodeprev automatic="on"><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>8.27<dmn>in</dmn></sectiontitle>

</chapter>
<node identifier="sansserif-slanted" spaces=" "><nodename><sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodename><nodenext automatic="on"><indicateurl>indicateurl</indicateurl></nodenext><nodeprev automatic="on">8.27<dmn>in</dmn></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><sansserif>sansserif</sansserif> <slanted>slanted</slanted></sectiontitle>

</chapter>
<node identifier="indicateurl" spaces=" "><nodename><indicateurl>indicateurl</indicateurl></nodename><nodenext automatic="on"><sub>g</sub>H 3<sup>rd</sup></nodenext><nodeprev automatic="on"><sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><indicateurl>indicateurl</indicateurl></sectiontitle>

</chapter>
<node identifier="gH-3rd" spaces=" "><nodename><sub>g</sub>H 3<sup>rd</sup></nodename><nodenext automatic="on"><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc spaces=" ">text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodenext><nodeprev automatic="on"><indicateurl>indicateurl</indicateurl></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><sub>g</sub>H 3<sup>rd</sup></sectiontitle>

</chapter>
<node identifier="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" spaces=" "><nodename><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc spaces=" ">text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodename><nodeprev automatic="on"><sub>g</sub>H 3<sup>rd</sup></nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc spaces=" ">text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></sectiontitle>

<para><ref label="-_007b-_007d"><xrefnodename>&hyphenbreak; &lbrace; &rbrace;</xrefnodename></ref>
</para>
<para><ref label="-_0021-_002e-_002e-_003f-_0040"><xrefnodename><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</xrefnodename></ref>
</para>
<para><ref label="_0040-_007b-_007d-_005c-_0023"><xrefnodename>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</xrefnodename></ref>
</para>
<para><ref label="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e"><xrefnodename>&latex; &tex; &bullet; &comma; &copyright; &dots; &enddots;</xrefnodename></ref>
</para>
<para><ref label="_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212"><xrefnodename>&equiv; &errorglyph; &euro; &iexcl; &expansion; &minus;</xrefnodename></ref>
</para>
<para><ref label="_2265-_2264-_2192"><xrefnodename>&ge; &le; &rarr;</xrefnodename></ref>
</para>
<para><ref label="_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae"><xrefnodename>&ordf; &ordm; &point; &pound; &printglyph; &iquest; &registered;</xrefnodename></ref>
</para>
<para><ref label="_21d2-_00b0-a-b-_00e5"><xrefnodename>&result; &deg; a&nbsp;b <today/> &aring;</xrefnodename></ref>
</para>
<para><ref label="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe"><xrefnodename>&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &THORN; &thorn;</xrefnodename></ref>
</para>
<para><ref label="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119"><xrefnodename><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></xrefnodename></ref>
</para>
<para><ref label="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e"><xrefnodename><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></xrefnodename></ref>
</para>
<para><ref label="_0131-_1e14-_1e08"><xrefnodename><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></xrefnodename></ref>
</para>
<para><ref label="_201c-_201d-_2018-_2019-_201e-_201a"><xrefnodename>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</xrefnodename></ref>
</para>
<para><ref label="_00ab-_00bb-_00ab-_00bb-_2039-_203a"><xrefnodename>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</xrefnodename></ref>
</para>
<para><ref label="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027"><xrefnodename>`` \'\' --- -- ` \'</xrefnodename></ref>
</para>
<para><ref label="AAA-AAA-BBB"><xrefnodename><acronym><acronymword>AAA</acronymword><acronymdesc spaces=" ">fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></xrefnodename></ref>
</para>
<para><ref label="CCC-CCC-DDD"><xrefnodename><abbr><abbrword>CCC</abbrword><abbrdesc spaces=" ">rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></xrefnodename></ref>
</para>
<para><ref label="someone_0040somewher-no_005fexplain_0040there"><xrefnodename><email><emailaddress>someone&arobase;somewher</emailaddress><emailname spaces=" ">the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></xrefnodename></ref>
</para>
<para><ref label="f_002d_002dile1-f_002d_002dile"><xrefnodename><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></xrefnodename></ref>
</para>
<para><ref label="-_0040-_007b_007d-_002e-"><xrefnodename><verb delimiter="."> @ {} . </verb></xrefnodename></ref>
</para>
<para><ref label="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><xrefnodename><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></xrefnodename></ref>
</para>
<para><ref label="env-code-option-samp-command-file-C_002dx-ESC"><xrefnodename><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></xrefnodename></ref>
</para>
<para><ref label="8_002e27in"><xrefnodename>8.27<dmn>in</dmn></xrefnodename></ref>
</para>
<para><ref label="sansserif-slanted"><xrefnodename><sansserif>sansserif</sansserif> <slanted>slanted</slanted></xrefnodename></ref>
</para>
<para><ref label="indicateurl"><xrefnodename><indicateurl>indicateurl</indicateurl></xrefnodename></ref>
</para>
<para><ref label="gH-3rd"><xrefnodename><sub>g</sub>H 3<sup>rd</sup></xrefnodename></ref>
</para>
<para><ref label="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><xrefnodename><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc spaces=" ">text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></xrefnodename></ref>
</para>
</chapter>
<bye></bye>
';


$result_converted{'docbook'}->{'at_commands_in_refs'} = '<chapter label="1" id="-_007b-_007d">
<title> { }</title>

</chapter>
<chapter label="2" id="-_0021-_002e-_002e-_003f-_0040">
<title>&#160; &#160; ! 
 .  . ? @</title>

</chapter>
<chapter label="3" id="_0040-_007b-_007d-_005c-_0023">
<title>&#64; &#123; &#125; &#92; &#35;</title>

</chapter>
<chapter label="4" id="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e">
<title>&latex; &tex; &#8226; &#44; &#169; &#8230; ...</title>

</chapter>
<chapter label="5" id="_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212">
<title>&#8801; error&#8594; &#8364; &#161; &#8614; &#8722;</title>

</chapter>
<chapter label="6" id="_2265-_2264-_2192">
<title>&#8805; &#8804; &#8594;</title>

</chapter>
<chapter label="7" id="_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae">
<title>&#170; &#186; &#8902; &#163; &#8867; &#191; &#174;</title>

</chapter>
<chapter label="8" id="_21d2-_00b0-a-b-_00e5">
<title>&#8658; &#176; a&#160;b a sunny day &#229;</title>

</chapter>
<chapter label="9" id="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe">
<title>&#197; &#230; &#339; &#198; &#338; &#248; &#216; &#223; &#322; &#321; &#208; &#240; &#222; &#254;</title>

</chapter>
<chapter label="10" id="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">
<title>&#228; &#7869; &#238; &#226; &#224; &#233; &#231; &#275; e&#778; e&#779; &#281;</title>

</chapter>
<chapter label="11" id="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">
<title>&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</title>

</chapter>
<chapter label="12" id="_0131-_1e14-_1e08">
<title>&#305; &#274;&#768; &#262;&#807;</title>

</chapter>
<chapter label="13" id="_201c-_201d-_2018-_2019-_201e-_201a">
<title>&#8220; &#8221; &#8216; &#8217; &#8222; &#8218;</title>

</chapter>
<chapter label="14" id="_00ab-_00bb-_00ab-_00bb-_2039-_203a">
<title>&#171; &#187; &#171; &#187; &#8249; &#8250;</title>

</chapter>
<chapter label="15" id="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">
<title>&#8220; &#8221; &#8212; &#8211; &#8216; &#8217;</title>

</chapter>
<chapter label="16" id="AAA-AAA-BBB">
<title><acronym>AAA</acronym> (fff) <acronym>AAA</acronym> <acronym>BBB</acronym></title>

</chapter>
<chapter label="17" id="CCC-CCC-DDD">
<title><abbrev>CCC</abbrev> (rrr) <abbrev>CCC</abbrev> <abbrev>DDD</abbrev></title>

</chapter>
<chapter label="18" id="someone_0040somewher-no_005fexplain_0040there">
<title><ulink url="mailto:someone@somewher">the someone</ulink> <email>no_explain@there</email></title>

</chapter>
<chapter label="19" id="f_002d_002dile1-f_002d_002dile">
<title><inlinemediaobject><imageobject><imagedata fileref="f--ile1.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>  <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject></title>

</chapter>
<chapter label="20" id="-_0040-_007b_007d-_002e-">
<title><literal> @ {} . </literal></title>

</chapter>
<chapter label="21" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i">
<title><citetitle>cite asis</citetitle> in&amp;#160;@w&amp;#160;<emphasis role="bold">b</emphasis><!-- /@w --> in r SC <emphasis role="bold">str</emphasis> <literal>t</literal> <replaceable>var</replaceable> <firstterm>dfn</firstterm> <emphasis>i</emphasis></title>

</chapter>
<chapter label="22" id="env-code-option-samp-command-file-C_002dx-ESC">
<title><envar>env</envar> <literal>code</literal> <option>option</option> &#8216;<literal>samp</literal>&#8217; <command>command</command> <filename>file</filename> <userinput>C-x <keycap>ESC</keycap></userinput></title>

</chapter>
<chapter label="23" id="8_002e27in">
<title>8.27in</title>

</chapter>
<chapter label="24" id="sansserif-slanted">
<title>sansserif slanted</title>

</chapter>
<chapter label="25" id="indicateurl">
<title><literal>indicateurl</literal></title>

</chapter>
<chapter label="26" id="gH-3rd">
<title><subscript>g</subscript>H 3<superscript>rd</superscript></title>

</chapter>
<chapter label="27" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls">
<title><ulink url="http://somewhere_aaa">http://somewhere_aaa</ulink> <ulink url="url">text</ulink> <ulink url="/man.cgi/1/ls">ls</ulink></title>

<para><link linkend="-_007b-_007d"> { }</link>
</para>
<para><link linkend="-_0021-_002e-_002e-_003f-_0040">&#160; &#160; ! 
 .  . ? @</link>
</para>
<para><link linkend="_0040-_007b-_007d-_005c-_0023">&#64; &#123; &#125; &#92; &#35;</link>
</para>
<para><link linkend="LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e">&latex; &tex; &#8226; &#44; &#169; &#8230; ...</link>
</para>
<para><link linkend="_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212">&#8801; error&#8594; &#8364; &#161; &#8614; &#8722;</link>
</para>
<para><link linkend="_2265-_2264-_2192">&#8805; &#8804; &#8594;</link>
</para>
<para><link linkend="_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae">&#170; &#186; &#8902; &#163; &#8867; &#191; &#174;</link>
</para>
<para><link linkend="_21d2-_00b0-a-b-_00e5">&#8658; &#176; a&#160;b a sunny day &#229;</link>
</para>
<para><link linkend="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe">&#197; &#230; &#339; &#198; &#338; &#248; &#216; &#223; &#322; &#321; &#208; &#240; &#222; &#254;</link>
</para>
<para><link linkend="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">&#228; &#7869; &#238; &#226; &#224; &#233; &#231; &#275; e&#778; e&#779; &#281;</link>
</para>
<para><link linkend="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</link>
</para>
<para><link linkend="_0131-_1e14-_1e08">&#305; &#274;&#768; &#262;&#807;</link>
</para>
<para><link linkend="_201c-_201d-_2018-_2019-_201e-_201a">&#8220; &#8221; &#8216; &#8217; &#8222; &#8218;</link>
</para>
<para><link linkend="_00ab-_00bb-_00ab-_00bb-_2039-_203a">&#171; &#187; &#171; &#187; &#8249; &#8250;</link>
</para>
<para><link linkend="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&#8220; &#8221; &#8212; &#8211; &#8216; &#8217;</link>
</para>
<para><link linkend="AAA-AAA-BBB"><acronym>AAA</acronym> (fff) <acronym>AAA</acronym> <acronym>BBB</acronym></link>
</para>
<para><link linkend="CCC-CCC-DDD"><abbrev>CCC</abbrev> (rrr) <abbrev>CCC</abbrev> <abbrev>DDD</abbrev></link>
</para>
<para><link linkend="someone_0040somewher-no_005fexplain_0040there"><ulink url="mailto:someone@somewher">the someone</ulink> <email>no_explain@there</email></link>
</para>
<para><link linkend="f_002d_002dile1-f_002d_002dile"><inlinemediaobject><imageobject><imagedata fileref="f--ile1.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>  <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject></link>
</para>
<para><link linkend="-_0040-_007b_007d-_002e-"><literal> @ {} . </literal></link>
</para>
<para><link linkend="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><citetitle>cite asis</citetitle> in&amp;#160;@w&amp;#160;<emphasis role="bold">b</emphasis><!-- /@w --> in r SC <emphasis role="bold">str</emphasis> <literal>t</literal> <replaceable>var</replaceable> <firstterm>dfn</firstterm> <emphasis>i</emphasis></link>
</para>
<para><link linkend="env-code-option-samp-command-file-C_002dx-ESC"><envar>env</envar> <literal>code</literal> <option>option</option> &#8216;<literal>samp</literal>&#8217; <command>command</command> <filename>file</filename> <userinput>C-x <keycap>ESC</keycap></userinput></link>
</para>
<para><link linkend="8_002e27in">8.27in</link>
</para>
<para><link linkend="sansserif-slanted">sansserif slanted</link>
</para>
<para><link linkend="indicateurl"><literal>indicateurl</literal></link>
</para>
<para><link linkend="gH-3rd"><subscript>g</subscript>H 3<superscript>rd</superscript></link>
</para>
<para><link linkend="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><ulink url="http://somewhere_aaa">http://somewhere_aaa</ulink> <ulink url="url">text</ulink> <ulink url="/man.cgi/1/ls">ls</ulink></link>
</para>
</chapter>
';

$result_converted_errors{'docbook'}->{'at_commands_in_refs'} = '* W l92|@image file `f--ile1\' not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' not found, using `f--ile1.jpg\'

* W l160|@image file `f--ile1\' not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' not found, using `f--ile1.jpg\'

';


$result_converted{'latex_text'}->{'at_commands_in_refs'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{\\-{} \\{ \\}}}
\\label{anchor:-_007b-_007d}%

\\Texinfochapter{{\\ {} \\ {} \\@! \\texorpdfstring{\\ifinner\\unskip\\space\\ignorespaces\\else\\leavevmode{}\\\\\\fi}{ } \\@. \\@ .\\@ \\@? @}}
\\label{anchor:-_0021-_002e-_002e-_003f-_0040}%

\\Texinfochapter{{@ \\{ \\} \\textbackslash{} \\#}}
\\label{anchor:_0040-_007b-_007d-_005c-_0023}%

\\Texinfochapter{{\\LaTeX{} \\TeX{} \\textbullet{} , \\copyright{} \\dots{}\\@ \\dots{}}}
\\label{anchor:LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e}%

\\Texinfochapter{{$\\equiv{}$ \\texorpdfstring{\\fbox{error}}{error} \\euro{} \\textexclamdown{} $\\mapsto{}$ -}}
\\label{anchor:_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212}%

\\Texinfochapter{{$\\geq{}$ $\\leq{}$ $\\rightarrow{}$}}
\\label{anchor:_2265-_2264-_2192}%

\\Texinfochapter{{\\textordfeminine{} \\textordmasculine{} $\\star{}$ \\textsterling{} $\\dashv{}$ \\textquestiondown{} \\circledR{}}}
\\label{anchor:_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae}%

\\Texinfochapter{{$\\Rightarrow{}$ \\textdegree{} a~b \\today{} \\aa{}}}
\\label{anchor:_21d2-_00b0-a-b-_00e5}%

\\Texinfochapter{{\\AA{} \\ae{} \\oe{} \\AE{} \\OE{} \\o{} \\O{} \\ss{} \\l{} \\L{} \\DH{} \\dh{} \\TH{} \\th{}}}
\\label{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe}%

\\Texinfochapter{{\\"{a} \\~{e} \\^{\\i{}} \\^{a} \\`{a} \\\'{e} \\c{c} \\={e} \\r{e} \\H{e} \\k{e}}}
\\label{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}%

\\Texinfochapter{{\\.{e} \\u{e} \\b{e} \\d{e} \\v{e} \\j{} \\t{ee}}}
\\label{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}%

\\Texinfochapter{{\\i{} \\`{\\={E}} \\c{\\\'{C}}}}
\\label{anchor:_0131-_1e14-_1e08}%

\\Texinfochapter{{\\textquotedblleft{} \\textquotedblright{} \\textquoteleft{} \\textquoteright{} \\quotedblbase{} \\quotesinglbase{}}}
\\label{anchor:_201c-_201d-_2018-_2019-_201e-_201a}%

\\Texinfochapter{{\\guillemotleft{} \\guillemotright{} \\guillemotleft{} \\guillemotright{} \\guilsinglleft{} \\guilsinglright{}}}
\\label{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a}%

\\Texinfochapter{{`` \'\' --- -- ` \'}}
\\label{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}%

\\Texinfochapter{{AAA (fff) AAA BBB}}
\\label{anchor:AAA-AAA-BBB}%

\\Texinfochapter{{CCC (rrr) CCC DDD}}
\\label{anchor:CCC-CCC-DDD}%

\\Texinfochapter{{\\href{mailto:someone@somewher}{the someone} \\href{mailto:no_explain@there}{\\nolinkurl{no_explain@there}}}}
\\label{anchor:someone_0040somewher-no_005fexplain_0040there}%

\\Texinfochapter{{\\includegraphics{f--ile1}  \\includegraphics[width=aze,height=az]{f--ile}}}
\\label{anchor:f_002d_002dile1-f_002d_002dile}%

\\Texinfochapter{{\\verb| @ {} . |}}
\\label{anchor:-_0040-_007b_007d-_002e-}%

\\Texinfochapter{{\\Texinfocommandstyletextcite{cite asis} \\hbox{in @w \\textbf{b}} \\textnormal{in r} \\textsc{sc} \\textbf{str} \\texttt{t} \\Texinfocommandstyletextvar{var} \\textsl{dfn} \\textit{i}}}
\\label{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}%

\\Texinfochapter{{\\texttt{env} \\texttt{code} \\texttt{option} `\\texttt{samp}\' \\texttt{command} \\texttt{file} \\Texinfocommandstyletextkbd{C-x \\texttt{ESC}}}}
\\label{anchor:env-code-option-samp-command-file-C_002dx-ESC}%

\\Texinfochapter{{8.27\\thinspace in}}
\\label{anchor:8_002e27in}%

\\Texinfochapter{{\\textsf{sansserif} \\textsl{slanted}}}
\\label{anchor:sansserif-slanted}%

\\Texinfochapter{{`\\texttt{indicateurl}\'}}
\\label{anchor:indicateurl}%

\\Texinfochapter{{\\textsubscript{g}H 3\\textsuperscript{rd}}}
\\label{anchor:gH-3rd}%

\\Texinfochapter{{\\url{http://somewhere_aaa} \\href{url}{text (\\nolinkurl{url})} ls}}
\\label{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}%

\\hyperref[anchor:-_007b-_007d]{\\chaptername~\\ref*{anchor:-_007b-_007d} [\\-{} \\{ \\}], page~\\pageref*{anchor:-_007b-_007d}}

\\hyperref[anchor:-_0021-_002e-_002e-_003f-_0040]{\\chaptername~\\ref*{anchor:-_0021-_002e-_002e-_003f-_0040} [\\ {} \\ {} \\@! \\leavevmode{}\\\\ \\@. \\@ .\\@ \\@? @], page~\\pageref*{anchor:-_0021-_002e-_002e-_003f-_0040}}

\\hyperref[anchor:_0040-_007b-_007d-_005c-_0023]{\\chaptername~\\ref*{anchor:_0040-_007b-_007d-_005c-_0023} [@ \\{ \\} \\textbackslash{} \\#], page~\\pageref*{anchor:_0040-_007b-_007d-_005c-_0023}}

\\hyperref[anchor:LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e]{\\chaptername~\\ref*{anchor:LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e} [\\LaTeX{} \\TeX{} \\textbullet{} , \\copyright{} \\dots{}\\@ \\dots{}], page~\\pageref*{anchor:LaTeX-TeX-_2022-_002c-_00a9-_2026-_002e_002e_002e}}

\\hyperref[anchor:_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212]{\\chaptername~\\ref*{anchor:_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212} [$\\equiv{}$ \\fbox{error} \\euro{} \\textexclamdown{} $\\mapsto{}$ -], page~\\pageref*{anchor:_2261-error_002d_002d_003e-_20ac-_00a1-_21a6-_2212}}

\\hyperref[anchor:_2265-_2264-_2192]{\\chaptername~\\ref*{anchor:_2265-_2264-_2192} [$\\geq{}$ $\\leq{}$ $\\rightarrow{}$], page~\\pageref*{anchor:_2265-_2264-_2192}}

\\hyperref[anchor:_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae]{\\chaptername~\\ref*{anchor:_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae} [\\textordfeminine{} \\textordmasculine{} $\\star{}$ \\textsterling{} $\\dashv{}$ \\textquestiondown{} \\circledR{}], page~\\pageref*{anchor:_00aa-_00ba-_22c6-_00a3-_22a3-_00bf-_00ae}}

\\hyperref[anchor:_21d2-_00b0-a-b-_00e5]{\\chaptername~\\ref*{anchor:_21d2-_00b0-a-b-_00e5} [$\\Rightarrow{}$ \\textdegree{} a~b \\today{} \\aa{}], page~\\pageref*{anchor:_21d2-_00b0-a-b-_00e5}}

\\hyperref[anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe]{\\chaptername~\\ref*{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe} [\\AA{} \\ae{} \\oe{} \\AE{} \\OE{} \\o{} \\O{} \\ss{} \\l{} \\L{} \\DH{} \\dh{} \\TH{} \\th{}], page~\\pageref*{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00de-_00fe}}

\\hyperref[anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119]{\\chaptername~\\ref*{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119} [\\"{a} \\~{e} \\^{\\i{}} \\^{a} \\`{a} \\\'{e} \\c{c} \\={e} \\r{e} \\H{e} \\k{e}], page~\\pageref*{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}}

\\hyperref[anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e]{\\chaptername~\\ref*{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e} [\\.{e} \\u{e} \\b{e} \\d{e} \\v{e} \\j{} \\t{ee}], page~\\pageref*{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}}

\\hyperref[anchor:_0131-_1e14-_1e08]{\\chaptername~\\ref*{anchor:_0131-_1e14-_1e08} [\\i{} \\`{\\={E}} \\c{\\\'{C}}], page~\\pageref*{anchor:_0131-_1e14-_1e08}}

\\hyperref[anchor:_201c-_201d-_2018-_2019-_201e-_201a]{\\chaptername~\\ref*{anchor:_201c-_201d-_2018-_2019-_201e-_201a} [\\textquotedblleft{} \\textquotedblright{} \\textquoteleft{} \\textquoteright{} \\quotedblbase{} \\quotesinglbase{}], page~\\pageref*{anchor:_201c-_201d-_2018-_2019-_201e-_201a}}

\\hyperref[anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a]{\\chaptername~\\ref*{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a} [\\guillemotleft{} \\guillemotright{} \\guillemotleft{} \\guillemotright{} \\guilsinglleft{} \\guilsinglright{}], page~\\pageref*{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a}}

\\hyperref[anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027]{\\chaptername~\\ref*{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027} [`` \'\' --- -- ` \'], page~\\pageref*{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}}

\\hyperref[anchor:AAA-AAA-BBB]{\\chaptername~\\ref*{anchor:AAA-AAA-BBB} [AAA (fff) AAA BBB], page~\\pageref*{anchor:AAA-AAA-BBB}}

\\hyperref[anchor:CCC-CCC-DDD]{\\chaptername~\\ref*{anchor:CCC-CCC-DDD} [CCC (rrr) CCC DDD], page~\\pageref*{anchor:CCC-CCC-DDD}}

\\hyperref[anchor:someone_0040somewher-no_005fexplain_0040there]{\\chaptername~\\ref*{anchor:someone_0040somewher-no_005fexplain_0040there} [\\href{mailto:someone@somewher}{the someone} \\href{mailto:no_explain@there}{\\nolinkurl{no_explain@there}}], page~\\pageref*{anchor:someone_0040somewher-no_005fexplain_0040there}}

\\hyperref[anchor:f_002d_002dile1-f_002d_002dile]{\\chaptername~\\ref*{anchor:f_002d_002dile1-f_002d_002dile} [\\includegraphics{f--ile1}  \\includegraphics[width=aze,height=az]{f--ile}], page~\\pageref*{anchor:f_002d_002dile1-f_002d_002dile}}

\\hyperref[anchor:-_0040-_007b_007d-_002e-]{\\chaptername~\\ref*{anchor:-_0040-_007b_007d-_002e-} [\\verb| @ {} . |], page~\\pageref*{anchor:-_0040-_007b_007d-_002e-}}

\\hyperref[anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i]{\\chaptername~\\ref*{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i} [\\Texinfocommandstyletextcite{cite asis} \\hbox{in @w \\textbf{b}} \\textnormal{in r} \\textsc{sc} \\textbf{str} \\texttt{t} \\Texinfocommandstyletextvar{var} \\textsl{dfn} \\textit{i}], page~\\pageref*{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}}

\\hyperref[anchor:env-code-option-samp-command-file-C_002dx-ESC]{\\chaptername~\\ref*{anchor:env-code-option-samp-command-file-C_002dx-ESC} [\\texttt{env} \\texttt{code} \\texttt{option} `\\texttt{samp}\' \\texttt{command} \\texttt{file} \\Texinfocommandstyletextkbd{C-x \\texttt{ESC}}], page~\\pageref*{anchor:env-code-option-samp-command-file-C_002dx-ESC}}

\\hyperref[anchor:8_002e27in]{\\chaptername~\\ref*{anchor:8_002e27in} [8.27\\thinspace in], page~\\pageref*{anchor:8_002e27in}}

\\hyperref[anchor:sansserif-slanted]{\\chaptername~\\ref*{anchor:sansserif-slanted} [\\textsf{sansserif} \\textsl{slanted}], page~\\pageref*{anchor:sansserif-slanted}}

\\hyperref[anchor:indicateurl]{\\chaptername~\\ref*{anchor:indicateurl} [`\\texttt{indicateurl}\'], page~\\pageref*{anchor:indicateurl}}

\\hyperref[anchor:gH-3rd]{\\chaptername~\\ref*{anchor:gH-3rd} [\\textsubscript{g}H 3\\textsuperscript{rd}], page~\\pageref*{anchor:gH-3rd}}

\\hyperref[anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls]{\\chaptername~\\ref*{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls} [\\url{http://somewhere_aaa} \\href{url}{text (\\nolinkurl{url})} ls], page~\\pageref*{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}}

';

$result_converted_errors{'latex_text'}->{'at_commands_in_refs'} = '* W l92|@image file `f--ile1\' (for LaTeX) not found
 warning: @image file `f--ile1\' (for LaTeX) not found

* W l90|@image file `f--ile1\' (for LaTeX) not found
 warning: @image file `f--ile1\' (for LaTeX) not found

';


$result_converted{'info'}->{'at_commands_in_refs'} = 'This is , produced from .


File: ,  Node: Top,  Next: { },  Up: (dir)

Top
***

* Menu:

*  { }::
*     !   .  . ? @::
* @ { } \\ #::
* LaTeX TeX • , © ... ...::
* ≡ error→ € ¡ ↦ −::
* ≥ ≤ →::
* ª º ⋆ £ ⊣ ¿ ®::
* ⇒ ° a b a sunny day å::
* Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ::
* ä ẽ î â à é ç ē e̊ e̋ ę::
* ė ĕ e̲ ẹ ě ȷ e͡e::
* ı Ḕ Ḉ::
* “ ” ‘ ’ „ ‚::
* « » « » ‹ ›::
* `` \'\' --- -- ` \'::
* AAA (fff) AAA BBB::
* CCC (rrr) CCC DDD::
* the someone <someone@somewher> <no_explain@there>::
* [f--ile1]   [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]::
*  @ {} . ::
* cite asis in @w b in r SC *str* t VAR dfn i::
* env code option samp command file C-x <ESC>::
* 8.27in::
* sansserif slanted::
* indicateurl::
* _{g}H 3^{rd}::
* <http://somewhere_aaa> text (url) ls::


File: ,  Node: { },  Next:     ! . . ? @,  Prev: Top,  Up: Top

1 { }
*****


File: ,  Node:     ! . . ? @,  Next: @ { } \\ #,  Prev: { },  Up: Top

2     !
. . ? @
**************


File: ,  Node: @ { } \\ #,  Next: LaTeX TeX • , © ... ...,  Prev:     ! . . ? @,  Up: Top

3 @ { } \\ #
***********


File: ,  Node: LaTeX TeX • , © ... ...,  Next: ≡ error→ € ¡ ↦ −,  Prev: @ { } \\ #,  Up: Top

4 LaTeX TeX • , © ... ...
*************************


File: ,  Node: ≡ error→ € ¡ ↦ −,  Next: ≥ ≤ →,  Prev: LaTeX TeX • , © ... ...,  Up: Top

5 ≡ error→ € ¡ ↦ −
******************


File: ,  Node: ≥ ≤ →,  Next: ª º ⋆ £ ⊣ ¿ ®,  Prev: ≡ error→ € ¡ ↦ −,  Up: Top

6 ≥ ≤ →
*******


File: ,  Node: ª º ⋆ £ ⊣ ¿ ®,  Next: ⇒ ° a b a sunny day å,  Prev: ≥ ≤ →,  Up: Top

7 ª º ⋆ £ ⊣ ¿ ®
***************


File: ,  Node: ⇒ ° a b a sunny day å,  Next: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ,  Prev: ª º ⋆ £ ⊣ ¿ ®,  Up: Top

8 ⇒ ° a b a sunny day å
***********************


File: ,  Node: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ,  Next: ä ẽ î â à é ç ē e̊ e̋ ę,  Prev: ⇒ ° a b a sunny day å,  Up: Top

9 Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ
*****************************


File: ,  Node: ä ẽ î â à é ç ē e̊ e̋ ę,  Next: ė ĕ e̲ ẹ ě ȷ e͡e,  Prev: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ,  Up: Top

10 ä ẽ î â à é ç ē e̊ e̋ ę
************************


File: ,  Node: ė ĕ e̲ ẹ ě ȷ e͡e,  Next: ı Ḕ Ḉ,  Prev: ä ẽ î â à é ç ē e̊ e̋ ę,  Up: Top

11 ė ĕ e̲ ẹ ě ȷ e͡e
*****************


File: ,  Node: ı Ḕ Ḉ,  Next: “ ” ‘ ’ „ ‚,  Prev: ė ĕ e̲ ẹ ě ȷ e͡e,  Up: Top

12 ı Ḕ Ḉ
********


File: ,  Node: “ ” ‘ ’ „ ‚,  Next: « » « » ‹ ›,  Prev: ı Ḕ Ḉ,  Up: Top

13 “ ” ‘ ’ „ ‚
**************


File: ,  Node: « » « » ‹ ›,  Next: `` \'\' --- -- ` \',  Prev: “ ” ‘ ’ „ ‚,  Up: Top

14 « » « » ‹ ›
**************


File: ,  Node: `` \'\' --- -- ` \',  Next: AAA (fff) AAA BBB,  Prev: « » « » ‹ ›,  Up: Top

15 " " -- - \' \'
***************


File: ,  Node: AAA (fff) AAA BBB,  Next: CCC (rrr) CCC DDD,  Prev: `` \'\' --- -- ` \',  Up: Top

16 AAA (fff) AAA BBB
********************


File: ,  Node: CCC (rrr) CCC DDD,  Next: the someone <someone@somewher> <no_explain@there>,  Prev: AAA (fff) AAA BBB,  Up: Top

17 CCC (rrr) CCC DDD
********************


File: ,  Node: the someone <someone@somewher> <no_explain@there>,  Next: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Prev: CCC (rrr) CCC DDD,  Up: Top

18 the someone <someone@somewher> <no_explain@there>
****************************************************


File: ,  Node: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Next:  @ {} . ,  Prev: the someone <someone@somewher> <no_explain@there>,  Up: Top

19 [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
*******************************************************************************


File: ,  Node:  @ {} . ,  Next: cite asis in @w b in r SC *str* t VAR dfn i,  Prev: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Up: Top

20  @ {} . 
***********


File: ,  Node: cite asis in @w b in r SC *str* t VAR dfn i,  Next: env code option samp command file C-x <ESC>,  Prev:  @ {} . ,  Up: Top

21 ‘cite asis’ in @w b in r SC *str* t VAR “dfn” i
**************************************************


File: ,  Node: env code option samp command file C-x <ESC>,  Next: 8.27in,  Prev: cite asis in @w b in r SC *str* t VAR dfn i,  Up: Top

22 ‘env’ ‘code’ ‘option’ ‘samp’ ‘command’ ‘file’ ‘C-x <ESC>’
************************************************************


File: ,  Node: 8.27in,  Next: sansserif slanted,  Prev: env code option samp command file C-x <ESC>,  Up: Top

23 8.27in
*********


File: ,  Node: sansserif slanted,  Next: indicateurl,  Prev: 8.27in,  Up: Top

24 sansserif slanted
********************


File: ,  Node: indicateurl,  Next: _{g}H 3^{rd},  Prev: sansserif slanted,  Up: Top

25 ‘indicateurl’
****************


File: ,  Node: _{g}H 3^{rd},  Next: <http://somewhere_aaa> text (url) ls,  Prev: indicateurl,  Up: Top

26 _{g}H 3^{rd}
***************


File: ,  Node: <http://somewhere_aaa> text (url) ls,  Prev: _{g}H 3^{rd},  Up: Top

27 <http://somewhere_aaa> text (url) ls
***************************************

*note { }::

   *note     !
. . ? @::

   *note @ { } \\ #::

   *note LaTeX TeX • , © ... ...::

   *note ≡ error→ € ¡ ↦ −::

   *note ≥ ≤ →::

   *note ª º ⋆ £ ⊣ ¿ ®::

   *note ⇒ ° a b a sunny day å::

   *note Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ::

   *note ä ẽ î â à é ç ē e̊ e̋ ę::

   *note ė ĕ e̲ ẹ ě ȷ e͡e::

   *note ı Ḕ Ḉ::

   *note “ ” ‘ ’ „ ‚::

   *note « » « » ‹ ›::

   *note `` \'\' --- -- ` \'::

   *note AAA (fff) AAA BBB::

   *note CCC (rrr) CCC DDD::

   *note the someone <someone@somewher> <no_explain@there>::

   *note [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]::

   *note  @ {} . ::

   *note cite asis in @w b in r SC *str* t VAR dfn i::

   *note env code option samp command file C-x <ESC>::

   *note 8.27in::

   *note sansserif slanted::

   *note indicateurl::

   *note _{g}H 3^{rd}::

   *note <http://somewhere_aaa> text (url) ls::


Tag Table:
Node: Top27
Node: { }785
Node:     ! . . ? @864
Node: @ { } \\ #968
Node: LaTeX TeX • , © ... ...1087
Node: ≡ error→ € ¡ ↦ −1237
Node: ≥ ≤ →1369
Node: ª º ⋆ £ ⊣ ¿ ®1467
Node: ⇒ ° a b a sunny day å1586
Node: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð Þ þ1743
Node: ä ẽ î â à é ç ē e̊ e̋ ę1922
Node: ė ĕ e̲ ẹ ě ȷ e͡e2088
Node: ı Ḕ Ḉ2218
Node: “ ” ‘ ’ „ ‚2316
Node: « » « » ‹ ›2421
Node: `` \'\' --- -- ` \'2537
Node: AAA (fff) AAA BBB2661
Node: CCC (rrr) CCC DDD2801
Node: the someone <someone@somewher> <no_explain@there>2974
Node: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]3274
Node:  @ {} . 3623
Node: cite asis in @w b in r SC *str* t VAR dfn i3826
Node: env code option samp command file C-x <ESC>4070
Node: 8.27in4332
Node: sansserif slanted4466
Node: indicateurl4590
Node: _{g}H 3^{rd}4712
Node: <http://somewhere_aaa> text (url) ls4851

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'at_commands_in_refs'} = '* W l90|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l23|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l31|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l43|@node name should not contain `,\': LaTeX TeX • , © ... ...
 warning: @node name should not contain `,\': LaTeX TeX • , © ... ...

* W l92|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l90|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l177|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';

1;
