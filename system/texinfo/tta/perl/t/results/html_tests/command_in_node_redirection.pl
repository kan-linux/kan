use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_node_redirection'} = '*document_root C3
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
 *@top C4 l2 {t @r{in r}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {t }
    *@r C1 l2
     *brace_container C1
      {in r}
  {empty_line:\\n}
  *@anchor C1 l4
  |EXTRA
  |is_target:{1}
  |normalized:{yyyy}
   *brace_arg C1
    {yyyy}
  {spaces_after_close_brace:\\n}
';


$result_texis{'command_in_node_redirection'} = '@node Top
@top t @r{in r}

@anchor{yyyy}
';


$result_texts{'command_in_node_redirection'} = 't in r
******

';

$result_errors{'command_in_node_redirection'} = '';

$result_nodes_list{'command_in_node_redirection'} = '1|Top
 associated_section: t @r{in r}
 associated_title_command: t @r{in r}
';

$result_sections_list{'command_in_node_redirection'} = '1|t @r{in r}
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'command_in_node_redirection'} = 'level: -1
list:
 1|t @r{in r}
';

$result_headings_list{'command_in_node_redirection'} = '';

1;
