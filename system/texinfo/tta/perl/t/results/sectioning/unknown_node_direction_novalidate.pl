use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unknown_node_direction_novalidate'} = '*document_root C2
 *before_node_section C2
  *@novalidate C1 l1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l3 {one arg2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{one-arg2}
  *arguments_line C2
   *line_arg C1
    {one arg2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{two arg}
   |normalized:{two-arg}
    {two arg}
';


$result_texis{'unknown_node_direction_novalidate'} = '@novalidate

@node one arg2, two arg
';


$result_texts{'unknown_node_direction_novalidate'} = '
';

$result_errors{'unknown_node_direction_novalidate'} = '';

$result_nodes_list{'unknown_node_direction_novalidate'} = '1|one arg2
';

$result_sections_list{'unknown_node_direction_novalidate'} = '';

$result_sectioning_root{'unknown_node_direction_novalidate'} = '';

$result_headings_list{'unknown_node_direction_novalidate'} = '';

1;
