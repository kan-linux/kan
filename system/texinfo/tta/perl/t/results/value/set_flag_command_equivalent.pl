use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'set_flag_command_equivalent'} = '*document_root C1
 *before_node_section C5
  *@set C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{txicodequoteundirected|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txicodequoteundirected}
  {empty_line:\\n}
  *paragraph C1
   {.\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{}
    >*@value C1
     >*brace_container C1
      >{txicodequoteundirected}
   >value_expansion<end;1>
  {empty_line:\\n}
  *@clear C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{txicodequoteundirected}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txicodequoteundirected}
';


$result_texis{'set_flag_command_equivalent'} = '@set txicodequoteundirected

.

@clear txicodequoteundirected
';


$result_texts{'set_flag_command_equivalent'} = '
.

';

$result_errors{'set_flag_command_equivalent'} = '';

$result_nodes_list{'set_flag_command_equivalent'} = '';

$result_sections_list{'set_flag_command_equivalent'} = '';

$result_sectioning_root{'set_flag_command_equivalent'} = '';

$result_headings_list{'set_flag_command_equivalent'} = '';

1;
