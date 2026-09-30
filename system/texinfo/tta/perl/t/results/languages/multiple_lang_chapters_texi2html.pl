use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiple_lang_chapters_texi2html'} = '*document_root C13
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@documentencoding C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {utf-8}
   {empty_line:\\n}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*@iftex C3 l5
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
     >{raw:@documentlanguage ja\\n}
     >*@end C1 l7
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{iftex}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{iftex}
   >ignored_conditional_block<2>
    >*@iflatex C3 l8
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
     >{raw:@documentlanguage ja\\n}
     >*@end C1 l10
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{iflatex}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{iflatex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:@node Top is ignored in TeX and LaTeX, so switch here}
   {empty_line:\\n}
 *@node C1 l12 {Top}
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
 *@top C5 l13 {Multi language file}
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
    {Multi language file}
  {empty_line:\\n}
  *@menu C7 l15
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter ja}
    |normalized:{chapter-ja}
     {chapter ja}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter en}
    |normalized:{chapter-en}
     {chapter en}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter fr_FR}
    |normalized:{chapter-fr_005fFR}
     {chapter fr_FR}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter de}
    |normalized:{chapter-de}
     {chapter de}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter pt_BR}
    |normalized:{chapter-pt_005fBR}
     {chapter pt_BR}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l21
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
  *@documentlanguage C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |text_arg:{ja}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ja}
 *@node C1 l24 {chapter ja}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter-ja}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter ja}
 *@chapter C6 l25 {ja}
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
    {ja}
  {empty_line:\\n}
  *paragraph C3
   {In japanese. }
   *@xref C1 l27
    *brace_arg C1
    |EXTRA
    |node_content:{chapter ja}
    |normalized:{chapter-ja}
     {chapter ja}
   {.\\n}
  *@defivar C2 l28
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l28
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |documentlanguage:{ja}
   |element_node:{chapter-ja}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{ja}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {CCC}
   *@end C1 l29
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
  {empty_line:\\n}
  *@documentlanguage C1 l31
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |text_arg:{en}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {en}
 *@node C1 l32 {chapter en}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{chapter-en}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter en}
 *@chapter C6 l33 {en}
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
    {en}
  {empty_line:\\n}
  *paragraph C3
   {In english. }
   *@xref C1 l35
    *brace_arg C1
    |EXTRA
    |node_content:{chapter ja}
    |normalized:{chapter-ja}
     {chapter ja}
   {.\\n}
  *@defivar C2 l36
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l36
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |documentlanguage:{en}
   |element_node:{chapter-en}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{en}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {CCC}
   *@end C1 l37
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
  {empty_line:\\n}
  *@documentlanguage C1 l39
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |text_arg:{fr_FR}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fr_FR}
 *@node C1 l40 {chapter fr_FR}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chapter-fr_005fFR}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter fr_FR}
 *@chapter C5 l41 {fr_FR}
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
    {fr_FR}
  {empty_line:\\n}
  *@defivar C2 l43
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l43
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ de }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{BBB}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{AAA}
   |documentlanguage:{fr_FR}
   |element_node:{chapter-fr_005fFR}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{fr_FR}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {CCC}
   *@end C1 l44
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
  {empty_line:\\n}
  *@documentlanguage C1 l46
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
  |text_arg:{de}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {de}
 *@node C1 l47 {chapter de}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{chapter-de}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter de}
 *@chapter C3 l48 {de}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {de}
  {empty_line:\\n}
  *@documentlanguage C1 l50
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |text_arg:{pt_BR}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {pt_BR}
 *@node C1 l51 {chapter pt_BR}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{chapter-pt_005fBR}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter pt_BR}
 *@chapter C3 l52 {pt_bR}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {pt_bR}
  {empty_line:\\n}
  *paragraph C3
   {In brazilian. }
   *@xref C1 l54
    *brace_arg C1
    |EXTRA
    |node_content:{chapter ja}
    |normalized:{chapter-ja}
     {chapter ja}
   {.\\n}
';


$result_texis{'multiple_lang_chapters_texi2html'} = '
@documentencoding utf-8

@c @node Top is ignored in TeX and LaTeX, so switch here

@node Top
@top Multi language file

@menu
* chapter ja::
* chapter en::
* chapter fr_FR::
* chapter de::
* chapter pt_BR::
@end menu

@documentlanguage ja
@node chapter ja
@chapter ja

In japanese. @xref{chapter ja}.
@defivar AAA BBB CCC
@end defivar

@documentlanguage en
@node chapter en
@chapter en

In english. @xref{chapter ja}.
@defivar AAA BBB CCC
@end defivar

@documentlanguage fr_FR
@node chapter fr_FR
@chapter fr_FR

@defivar AAA BBB CCC
@end defivar

@documentlanguage de
@node chapter de
@chapter de

@documentlanguage pt_BR
@node chapter pt_BR
@chapter pt_bR

In brazilian. @xref{chapter ja}.
';


$result_texts{'multiple_lang_chapters_texi2html'} = '

Multi language file
*******************

* chapter ja::
* chapter en::
* chapter fr_FR::
* chapter de::
* chapter pt_BR::

1 ja
****

In japanese. chapter ja.
Instance Variable of AAA: BBB CCC

2 en
****

In english. chapter ja.
Instance Variable of AAA: BBB CCC

3 fr_FR
*******

Variable d\'instance de AAA: BBB CCC

4 de
****

5 pt_bR
*******

In brazilian. chapter ja.
';

$result_errors{'multiple_lang_chapters_texi2html'} = '';

$result_nodes_list{'multiple_lang_chapters_texi2html'} = '1|Top
 associated_section: Multi language file
 associated_title_command: Multi language file
 menus:
  chapter ja
  chapter en
  chapter fr_FR
  chapter de
  chapter pt_BR
 node_directions:
  next->chapter ja
2|chapter ja
 associated_section: 1 ja
 associated_title_command: 1 ja
 node_directions:
  next->chapter en
  prev->Top
  up->Top
3|chapter en
 associated_section: 2 en
 associated_title_command: 2 en
 node_directions:
  next->chapter fr_FR
  prev->chapter ja
  up->Top
4|chapter fr_FR
 associated_section: 3 fr_FR
 associated_title_command: 3 fr_FR
 node_directions:
  next->chapter de
  prev->chapter en
  up->Top
5|chapter de
 associated_section: 4 de
 associated_title_command: 4 de
 node_directions:
  next->chapter pt_BR
  prev->chapter fr_FR
  up->Top
6|chapter pt_BR
 associated_section: 5 pt_bR
 associated_title_command: 5 pt_bR
 node_directions:
  prev->chapter de
  up->Top
';

$result_sections_list{'multiple_lang_chapters_texi2html'} = '1|Multi language file
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ja
 section_children:
  1|ja
  2|en
  3|fr_FR
  4|de
  5|pt_bR
2|ja
 associated_anchor_command: chapter ja
 associated_node: chapter ja
 section_directions:
  next->en
  up->Multi language file
 toplevel_directions:
  next->en
  prev->Multi language file
  up->Multi language file
3|en
 associated_anchor_command: chapter en
 associated_node: chapter en
 section_directions:
  next->fr_FR
  prev->ja
  up->Multi language file
 toplevel_directions:
  next->fr_FR
  prev->ja
  up->Multi language file
4|fr_FR
 associated_anchor_command: chapter fr_FR
 associated_node: chapter fr_FR
 section_directions:
  next->de
  prev->en
  up->Multi language file
 toplevel_directions:
  next->de
  prev->en
  up->Multi language file
5|de
 associated_anchor_command: chapter de
 associated_node: chapter de
 section_directions:
  next->pt_bR
  prev->fr_FR
  up->Multi language file
 toplevel_directions:
  next->pt_bR
  prev->fr_FR
  up->Multi language file
6|pt_bR
 associated_anchor_command: chapter pt_BR
 associated_node: chapter pt_BR
 section_directions:
  prev->de
  up->Multi language file
 toplevel_directions:
  prev->de
  up->Multi language file
';

$result_sectioning_root{'multiple_lang_chapters_texi2html'} = 'level: -1
list:
 1|Multi language file
';

$result_headings_list{'multiple_lang_chapters_texi2html'} = '';

$result_indices_sort_strings{'multiple_lang_chapters_texi2html'} = 'vr:
 BBB de AAA
 BBB of AAA
 BBB of AAA
';

1;
