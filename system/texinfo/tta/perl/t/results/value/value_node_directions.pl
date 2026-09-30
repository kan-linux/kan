use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'value_node_directions'} = '*document_root C7
 *before_node_section C2
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{a--foo|bar}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:a--foo bar}
  {empty_line:\\n}
 *@node C1 l3 {Top}
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
    |>SOURCEMARKS
    |>value_expansion<start;1><p:1>{bar}
     |>*@value C1
      |>*brace_container C1
       |>{a--foo}
   |EXTRA
   |node_content:{bar}
   |normalized:{bar}
    {bar}
    >SOURCEMARKS
    >value_expansion<end;1><p:3>
   *line_arg C3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@top C3 l4 {Var bar}
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
    {Var bar}
    >SOURCEMARKS
    >value_expansion<start;2><p:4>{bar}
     >*@value C1
      >*brace_container C1
       >{a--foo}
    >value_expansion<end;2><p:7>
  *paragraph C1
   {bar\\n}
   >SOURCEMARKS
   >value_expansion<start;3>{bar}
    >*@value C1
     >*brace_container C1
      >{a--foo}
   >value_expansion<end;3><p:3>
  {empty_line:\\n}
 *@node C1 l7 {bar}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
  |>SOURCEMARKS
  |>value_expansion<start;4><p:1>{bar}
   |>*@value C1
    |>*brace_container C1
     |>{a--foo}
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{bar}
  *arguments_line C4
   *line_arg C1
    {bar}
    >SOURCEMARKS
    >value_expansion<end;4><p:3>
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{BarFoo}
   |normalized:{BarFoo}
    {BarFoo}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@chapter C2 l8 {BarFoo}
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
    {BarFoo}
  {empty_line:\\n}
 *@node C1 l10 {BarFoo}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{BarFoo}
  *arguments_line C4
   *line_arg C1
    {BarFoo}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    |>SOURCEMARKS
    |>value_expansion<start;5><p:1>{bar}
     |>*@value C1
      |>*brace_container C1
       |>{a--foo}
   |EXTRA
   |node_content:{bar}
   |normalized:{bar}
    {bar}
    >SOURCEMARKS
    >value_expansion<end;5><p:3>
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@chapter C1 l11 {bar}
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
    {bar}
';


$result_texis{'value_node_directions'} = '@set a--foo bar

@node Top, bar, (dir), (dir)
@top Var bar
bar

@node bar, BarFoo, Top, (dir)
@chapter BarFoo

@node BarFoo, , bar, (dir)
@chapter bar
';


$result_texts{'value_node_directions'} = '
Var bar
*******
bar

1 BarFoo
********

2 bar
*****
';

$result_errors{'value_node_directions'} = '* W l7|node `bar\' not in menu
 warning: node `bar\' not in menu

* W l10|node `BarFoo\' not in menu
 warning: node `BarFoo\' not in menu

';

$result_nodes_list{'value_node_directions'} = '1|Top
 associated_section: Var bar
 associated_title_command: Var bar
 node_directions:
  next->bar
  prev-> (dir)
  up-> (dir)

2|bar
 associated_section: 1 BarFoo
 associated_title_command: 1 BarFoo
 node_directions:
  next->BarFoo
  prev->Top
  up-> (dir)

3|BarFoo
 associated_section: 2 bar
 associated_title_command: 2 bar
 node_directions:
  prev->bar
  up-> (dir)

';

$result_sections_list{'value_node_directions'} = '1|Var bar
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->BarFoo
 section_children:
  1|BarFoo
  2|bar
2|BarFoo
 associated_anchor_command: bar
 associated_node: bar
 section_directions:
  next->bar
  up->Var bar
 toplevel_directions:
  next->bar
  prev->Var bar
  up->Var bar
3|bar
 associated_anchor_command: BarFoo
 associated_node: BarFoo
 section_directions:
  prev->BarFoo
  up->Var bar
 toplevel_directions:
  prev->BarFoo
  up->Var bar
';

$result_sectioning_root{'value_node_directions'} = 'level: -1
list:
 1|Var bar
';

$result_headings_list{'value_node_directions'} = '';

1;
