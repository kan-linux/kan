use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_simple'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
    {first}
';


$result_texis{'node_simple'} = '@node first';


$result_texts{'node_simple'} = '';

$result_errors{'node_simple'} = '';

$result_nodes_list{'node_simple'} = '1|first
';

$result_sections_list{'node_simple'} = '';

$result_sectioning_root{'node_simple'} = '';

$result_headings_list{'node_simple'} = '';

1;
