use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'value_zero'} = '*document_root C1
 *before_node_section C2
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{zero|0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:zero 0}
  *paragraph C2
   {Value\\n}
   {0}
   >SOURCEMARKS
   >value_expansion<start;1>{0}
    >*@value C1
     >*brace_container C1
      >{zero}
   >value_expansion<end;1><p:1>
';


$result_texis{'value_zero'} = '@set zero 0
Value
0';


$result_texts{'value_zero'} = 'Value
0';

$result_errors{'value_zero'} = '';

$result_nodes_list{'value_zero'} = '';

$result_sections_list{'value_zero'} = '';

$result_sectioning_root{'value_zero'} = '';

$result_headings_list{'value_zero'} = '';

1;
