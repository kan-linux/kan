use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'style_not_closed_before_first_node'} = '*document_root C2
 *before_node_section C1
  *paragraph C1
   *@code C1 l1
    *brace_container C2
     {in code\\n}
     {empty_line:\\n}
 *@node C2 l3 {Top}
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
  *paragraph C1
   {In node\\n}
';


$result_texis{'style_not_closed_before_first_node'} = '@code{in code

}@node Top
In node
';


$result_texts{'style_not_closed_before_first_node'} = 'in code

In node
';

$result_errors{'style_not_closed_before_first_node'} = '* E l1|@code missing closing brace
 @code missing closing brace

';

$result_nodes_list{'style_not_closed_before_first_node'} = '1|Top
';

$result_sections_list{'style_not_closed_before_first_node'} = '';

$result_sectioning_root{'style_not_closed_before_first_node'} = '';

$result_headings_list{'style_not_closed_before_first_node'} = '';

1;
