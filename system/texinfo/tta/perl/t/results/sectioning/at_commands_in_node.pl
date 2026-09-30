use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'at_commands_in_node'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{A-sc-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}
  *arguments_line C1
   *line_arg C14
    {A }
    *@sc C1 l1
     *brace_container C1
      {sc}
    { node }
    *@" C1 l1
     *following_arg C1
      {i}
    { }
    *@" C1 l1
     *brace_container C1
      *@dotless C1 l1
       *brace_container C1
        {i}
    { }
    *@` C1 l1
     *brace_container C1
      *@= C1 l1
       *following_arg C1
        {E}
    { }
    *@l C1 l1
     *brace_container
    { }
    *@, C1 l1
     *brace_container C1
      *@\' C1 l1
       *following_arg C1
        {C}
    { }
    *@exclamdown C1 l1
     *brace_container
';


$result_texis{'at_commands_in_node'} = '@node A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}';


$result_texts{'at_commands_in_node'} = '';

$result_errors{'at_commands_in_node'} = '';

$result_nodes_list{'at_commands_in_node'} = '1|A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
';

$result_sections_list{'at_commands_in_node'} = '';

$result_sectioning_root{'at_commands_in_node'} = '';

$result_headings_list{'at_commands_in_node'} = '';

1;
