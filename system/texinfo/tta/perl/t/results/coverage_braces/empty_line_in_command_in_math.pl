use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_line_in_command_in_math'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@math C1 l1
    *brace_command_context C3
     {a }
     *@code C1 l1
      *brace_container C3
       {in code\\n}
       {empty_line:\\n}
       {after line}
     { b}
';


$result_texis{'empty_line_in_command_in_math'} = '@math{a @code{in code

after line} b}';


$result_texts{'empty_line_in_command_in_math'} = 'a in code

after line b';

$result_errors{'empty_line_in_command_in_math'} = '';

$result_nodes_list{'empty_line_in_command_in_math'} = '';

$result_sections_list{'empty_line_in_command_in_math'} = '';

$result_sectioning_root{'empty_line_in_command_in_math'} = '';

$result_headings_list{'empty_line_in_command_in_math'} = '';

1;
