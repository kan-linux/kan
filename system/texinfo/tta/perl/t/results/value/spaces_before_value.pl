use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'spaces_before_value'} = '*document_root C1
 *before_node_section C3
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{var|val}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:var val}
  {empty_line:\\n}
  *paragraph C1
   {val\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{val}
    >*@value C1
    >|INFO
    >|spaces_after_cmd_before_arg:
     >|{spaces_after_cmd_before_arg:  }
     >*brace_container C1
      >{var}
   >value_expansion<end;1><p:3>
';


$result_texis{'spaces_before_value'} = '@set var val

val
';


$result_texts{'spaces_before_value'} = '
val
';

$result_errors{'spaces_before_value'} = '';

$result_nodes_list{'spaces_before_value'} = '';

$result_sections_list{'spaces_before_value'} = '';

$result_sectioning_root{'spaces_before_value'} = '';

$result_headings_list{'spaces_before_value'} = '';

1;
