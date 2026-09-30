use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'non_automatic_internal_top_node_up'} = 'U0 unit{N:Top}{s:internal top node up}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C4
   *line_arg C1
    {Top}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{chap}
   |normalized:{chap}
    {chap}
   *line_arg C2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals}
   |normalized:{GNU-manuals}
    *@acronym C2 l1
     *brace_arg C1
      {GNU}
     *brace_arg C2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *@acronym C1 l1
       *brace_arg C1
        {GNU}
      {\'s Not Unix}
    { manuals}
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals}
   |normalized:{GNU-manuals}
    *@acronym C2 l1
     *brace_arg C1
      {GNU}
     *brace_arg C2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *@acronym C1 l1
       *brace_arg C1
        {GNU}
      {\'s Not Unix}
    { manuals}
 *@top C4 l2 {internal top node up}
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
    {internal top node up}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap}
    |normalized:{chap}
     {chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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
U1 unit{N:chap}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
NodePrev: [U0]
NodeBack: [U0]
 *@node C1 l8 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C4
   *line_arg C1
    {chap}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals}
   |normalized:{GNU-manuals}
    *@acronym C2 l8
     *brace_arg C1
      {GNU}
     *brace_arg C2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *@acronym C1 l8
       *brace_arg C1
        {GNU}
      {\'s Not Unix}
    { manuals}
';


$result_texis{'non_automatic_internal_top_node_up'} = '@node Top, chap, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals
@top internal top node up

@menu
* chap::
@end menu

@node chap, , Top, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals
';


$result_texts{'non_automatic_internal_top_node_up'} = 'internal top node up
********************

* chap::

';

$result_errors{'non_automatic_internal_top_node_up'} = '* E l1|Prev reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
 Prev reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'

* E l1|Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
 Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'

* E l8|Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
 Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'

';

$result_nodes_list{'non_automatic_internal_top_node_up'} = '1|Top
 associated_section: internal top node up
 associated_title_command: internal top node up
 menus:
  chap
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'non_automatic_internal_top_node_up'} = '1|internal top node up
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'non_automatic_internal_top_node_up'} = 'level: -1
list:
 1|internal top node up
';

$result_headings_list{'non_automatic_internal_top_node_up'} = '';


$result_converted{'info'}->{'non_automatic_internal_top_node_up'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals

internal top node up
********************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top


Tag Table:
Node: Top27
Node: chap178

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'non_automatic_internal_top_node_up'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>internal top node up</title>

<meta name="description" content="internal top node up">
<meta name="keywords" content="internal top node up">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="internal-top-node-up"><span>internal top node up<a class="copiable-link" href="#internal-top-node-up"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">internal top node up</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>
</div>



</body>
</html>
';

1;
