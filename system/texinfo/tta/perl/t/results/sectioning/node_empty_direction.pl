use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_empty_direction'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {name}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{name}
  *arguments_line C2
   *line_arg C1
    {name}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
';


$result_texis{'node_empty_direction'} = '@node name, ';


$result_texts{'node_empty_direction'} = '';

$result_errors{'node_empty_direction'} = '';

$result_nodes_list{'node_empty_direction'} = '1|name
';

$result_sections_list{'node_empty_direction'} = '';

$result_sectioning_root{'node_empty_direction'} = '';

$result_headings_list{'node_empty_direction'} = '';

1;
