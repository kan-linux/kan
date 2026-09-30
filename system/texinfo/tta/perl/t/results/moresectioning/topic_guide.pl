use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'topic_guide'} = '*document_root C13
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 topic_guide.texi:l3 {Top}
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
 *@top C6 topic_guide.texi:l4 {A example quide topic collection}
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
    {A example quide topic collection}
  {empty_line:\\n}
  *paragraph C2
   {This is an example of guide/topic based manual inspired by the Mallard\\n}
   {format.\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 topic_guide.texi:l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {the easy way\\n}
   *menu_entry C4 topic_guide.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {the perillous way\\n}
   *@end C1 topic_guide.texi:l12
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
 *@node C1 topic_guide.texi:l14 {guide1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{guide1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {guide1}
 *@chapter C6 topic_guide.texi:l15 {guide 1}
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
    {guide 1}
  {empty_line:\\n}
  *paragraph C1
   {This is the guide for an easy use.\\n}
  {empty_line:\\n}
  *@menu C5 topic_guide.texi:l19
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 topic_guide.texi:l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic1}
    |normalized:{topic1}
     {topic1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic1 description\\n}
   *menu_entry C4 topic_guide.texi:l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic2}
    |normalized:{topic2}
     {topic2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic2 description\\n}
   *menu_entry C4 topic_guide.texi:l22
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic5}
    |normalized:{topic5}
     {topic5}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic5 description\\n}
   *@end C1 topic_guide.texi:l23
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
 *@node C6 topic_guide.texi:l25 {topic1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{topic1}
  *arguments_line C2
   *line_arg C1
    {topic1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic2}
   |normalized:{topic2}
    {topic2}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 1.\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l29
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l32
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *@end C1 topic_guide.texi:l33
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
 *@node C6 topic_guide.texi:l35 {topic2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{topic2}
  *arguments_line C3
   *line_arg C1
    {topic2}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic3}
   |normalized:{topic3}
    {topic3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic1}
   |normalized:{topic1}
    {topic1}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 2\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l39
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l42
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *@end C1 topic_guide.texi:l43
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
 *@node C6 topic_guide.texi:l45 {topic3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{topic3}
  *arguments_line C3
   *line_arg C1
    {topic3}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic5}
   |normalized:{topic5}
    {topic5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic2}
   |normalized:{topic2}
    {topic2}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 3\\n}
  {empty_line:\\n}
  *@menu C3 topic_guide.texi:l49
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *@end C1 topic_guide.texi:l52
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
 *@node C6 topic_guide.texi:l54 {topic4}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{topic4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {topic4}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 4\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l58
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l61
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 2\\n}
   *@end C1 topic_guide.texi:l62
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
 *@node C6 topic_guide.texi:l64 {topic5}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{topic5}
  *arguments_line C3
   *line_arg C1
    {topic5}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{topic3}
   |normalized:{topic3}
    {topic3}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 5\\n}
  {empty_line:\\n}
  *@menu C5 topic_guide.texi:l68
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l71
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *menu_entry C4 topic_guide.texi:l72
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 2\\n}
   *@end C1 topic_guide.texi:l73
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
 *@node C1 topic_guide.texi:l75 {guide2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{guide2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {guide2}
 *@chapter C6 topic_guide.texi:l76 {guide 2}
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
    {guide 2}
  {empty_line:\\n}
  *paragraph C1
   {This is the guide for an in depth use\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l80
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 topic_guide.texi:l81
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic5}
    |normalized:{topic5}
     {topic5}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic5 description\\n}
   *menu_entry C4 topic_guide.texi:l82
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic4}
    |normalized:{topic4}
     {topic4}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic4 description\\n}
   *@end C1 topic_guide.texi:l83
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
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'topic_guide'} = '\\input texinfo.tex

@node Top
@top A example quide topic collection

This is an example of guide/topic based manual inspired by the Mallard
format.

@menu
* guide1:: the easy way
* guide2:: the perillous way
@end menu

@node guide1
@chapter guide 1

This is the guide for an easy use.

@menu
* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description
@end menu

@node topic1, topic2

This is topic 1.

@menu
More information

* guide1:: guide 1
@end menu

@node topic2, topic3, topic1

This is topic 2

@menu
More information

* guide1:: guide 1
@end menu

@node topic3, topic5, topic2

This is topic 3

@menu
More information

@end menu

@node topic4

This is topic 4

@menu
More information

* guide2:: guide 2
@end menu

@node topic5, , topic3

This is topic 5

@menu
More information

* guide1:: guide 1
* guide2:: guide 2
@end menu

@node guide2
@chapter guide 2

This is the guide for an in depth use

@menu
* topic5:: topic5 description
* topic4:: topic4 description
@end menu

@bye
';


$result_texts{'topic_guide'} = 'A example quide topic collection
********************************

This is an example of guide/topic based manual inspired by the Mallard
format.

* guide1:: the easy way
* guide2:: the perillous way

1 guide 1
*********

This is the guide for an easy use.

* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description


This is topic 1.

More information

* guide1:: guide 1


This is topic 2

More information

* guide1:: guide 1


This is topic 3

More information



This is topic 4

More information

* guide2:: guide 2


This is topic 5

More information

* guide1:: guide 1
* guide2:: guide 2

2 guide 2
*********

This is the guide for an in depth use

* topic5:: topic5 description
* topic4:: topic4 description

';

$result_errors{'topic_guide'} = '';

$result_nodes_list{'topic_guide'} = '1|Top
 associated_section: A example quide topic collection
 associated_title_command: A example quide topic collection
 menus:
  guide1
  guide2
 node_directions:
  next->guide1
2|guide1
 associated_section: 1 guide 1
 associated_title_command: 1 guide 1
 menus:
  topic1
  topic2
  topic5
 node_directions:
  next->guide2
  prev->Top
  up->Top
3|topic1
 menus:
  guide1
 node_directions:
  next->topic2
4|topic2
 menus:
  guide1
 node_directions:
  next->topic3
  prev->topic1
5|topic3
 menus:
 node_directions:
  next->topic5
  prev->topic2
6|topic4
 menus:
  guide2
 node_directions:
  prev->topic5
  up->guide2
7|topic5
 menus:
  guide1
  guide2
 node_directions:
  prev->topic3
8|guide2
 associated_section: 2 guide 2
 associated_title_command: 2 guide 2
 menus:
  topic5
  topic4
 node_directions:
  prev->guide1
  up->Top
';

$result_sections_list{'topic_guide'} = '1|A example quide topic collection
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->guide 1
 section_children:
  1|guide 1
  2|guide 2
2|guide 1
 associated_anchor_command: guide1
 associated_node: guide1
 section_directions:
  next->guide 2
  up->A example quide topic collection
 toplevel_directions:
  next->guide 2
  prev->A example quide topic collection
  up->A example quide topic collection
3|guide 2
 associated_anchor_command: guide2
 associated_node: guide2
 section_directions:
  prev->guide 1
  up->A example quide topic collection
 toplevel_directions:
  prev->guide 1
  up->A example quide topic collection
';

$result_sectioning_root{'topic_guide'} = 'level: -1
list:
 1|A example quide topic collection
';

$result_headings_list{'topic_guide'} = '';

1;
