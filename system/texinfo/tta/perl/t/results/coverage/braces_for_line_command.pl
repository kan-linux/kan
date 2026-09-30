use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'braces_for_line_command'} = '*document_root C1
 *before_node_section C1
  *@settitle C1 l1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {In title }
    *@sc C1 l1
     *brace_container C1
      {my string}
    { NEXT}
';


$result_texis{'braces_for_line_command'} = '@settitleIn title @sc{my string} NEXT
';


$result_texts{'braces_for_line_command'} = '';

$result_errors{'braces_for_line_command'} = '* E l1|misplaced {
 misplaced {

* E l1|misplaced }
 misplaced }

';

$result_nodes_list{'braces_for_line_command'} = '';

$result_sections_list{'braces_for_line_command'} = '';

$result_sectioning_root{'braces_for_line_command'} = '';

$result_headings_list{'braces_for_line_command'} = '';

1;
