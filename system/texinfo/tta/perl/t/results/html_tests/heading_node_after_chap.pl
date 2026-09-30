use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_node_after_chap'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C1
   *@settitle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {heading node after chap}
 *@node C1 l2 {Cap 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Cap-1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Cap 1}
 *@chapter C5 l3 {Chapter One}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter One}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:needed to have Node 1 referenced}
  *paragraph C2
   *@xref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:{Node 1}
    |normalized:{Node-1}
     {Node 1}
   {\\n}
  {empty_line:\\n}
 *@node C1 l8 {Cap 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Cap-2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Cap 2}
 *@chapter C2 l9 {Chapter Two}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter Two}
  {empty_line:\\n}
 *@node C2 l11 {Node 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Node-1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Node 1}
  *@heading C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Topic}
';


$result_texis{'heading_node_after_chap'} = '@settitle heading node after chap
@node Cap 1
@chapter Chapter One

@c needed to have Node 1 referenced
@xref{Node 1}

@node Cap 2
@chapter Chapter Two

@node Node 1
@heading Topic
';


$result_texts{'heading_node_after_chap'} = '1 Chapter One
*************

Node 1

2 Chapter Two
*************

Topic
=====
';

$result_errors{'heading_node_after_chap'} = '';

$result_nodes_list{'heading_node_after_chap'} = '1|Cap 1
 associated_section: 1 Chapter One
 associated_title_command: 1 Chapter One
 node_directions:
  next->Cap 2
2|Cap 2
 associated_section: 2 Chapter Two
 associated_title_command: 2 Chapter Two
 node_directions:
  prev->Cap 1
3|Node 1
 associated_title_command: @heading Topic
';

$result_sections_list{'heading_node_after_chap'} = '1|Chapter One
 associated_anchor_command: Cap 1
 associated_node: Cap 1
 section_directions:
  next->Chapter Two
 toplevel_directions:
  next->Chapter Two
2|Chapter Two
 associated_anchor_command: Cap 2
 associated_node: Cap 2
 section_directions:
  prev->Chapter One
 toplevel_directions:
  prev->Chapter One
';

$result_sectioning_root{'heading_node_after_chap'} = 'level: 0
list:
 1|Chapter One
 2|Chapter Two
';

$result_headings_list{'heading_node_after_chap'} = '1|Topic
 associated_anchor_command: Node 1
';

1;
