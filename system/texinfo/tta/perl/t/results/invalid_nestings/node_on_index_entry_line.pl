use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_on_index_entry_line'} = '*document_root C2
 *before_node_section C2
  {empty_line:\\n}
  *index_entry_command@cindex C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {entry}
 *@node C3 l2 {a}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a}
  *arguments_line C4
   *line_arg C1
    {a}
   *line_arg C4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{m}
   |node_content:{b}
   |normalized:{b}
    {(}
    {m}
    {)}
    {b}
   *line_arg C4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{m}
   |node_content:{c}
   |normalized:{c}
    {(}
    {m}
    {)}
    {c}
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{h}
   |node_content:{d}
   |normalized:{d}
    {(}
    {h}
    {)}
    {d}
  {empty_line:\\n}
  *paragraph C1
   {Content\\n}
';


$result_texis{'node_on_index_entry_line'} = '
@cindex entry @node a, (m)b, (m)c, (h)d

Content
';


$result_texts{'node_on_index_entry_line'} = '

Content
';

$result_errors{'node_on_index_entry_line'} = '* W l2|@node should only appear at the beginning of a line
 warning: @node should only appear at the beginning of a line

* W l2|@node should not appear on @cindex line
 warning: @node should not appear on @cindex line

* W l2|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'node_on_index_entry_line'} = '1|a
 node_directions:
  next-> (m)b
  prev-> (m)c
  up-> (h)d

';

$result_sections_list{'node_on_index_entry_line'} = '';

$result_sectioning_root{'node_on_index_entry_line'} = '';

$result_headings_list{'node_on_index_entry_line'} = '';

$result_indices_sort_strings{'node_on_index_entry_line'} = 'cp:
 entry
';

1;
