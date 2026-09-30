use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiline'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@verb C1 l1
   |INFO
   |delimiter:{@}
    *brace_container C3
     {raw:\\n}
     {raw:qdsqsddqsdsq\\n}
     {raw:\\n}
   {after verb.}
';


$result_texis{'multiline'} = '@verb{@
qdsqsddqsdsq

@}after verb.';


$result_texts{'multiline'} = '
qdsqsddqsdsq

after verb.';

$result_errors{'multiline'} = '';

$result_nodes_list{'multiline'} = '';

$result_sections_list{'multiline'} = '';

$result_sectioning_root{'multiline'} = '';

$result_headings_list{'multiline'} = '';

1;
