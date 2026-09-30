use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ref_empty_node'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C8
   *@ref C4 l2
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   { }
   *@ref C5 l2
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Manual}
   { }
   *@inforef C3 l2
    *brace_arg
    *brace_arg
    *brace_arg C1
     {imanual}
   {\\n}
   *@xref C5 l3
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Bidule}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Truc}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {file}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Printed}
   {.\\n}
';


$result_texis{'ref_empty_node'} = '
@ref{,,,manual} @ref{,,, , Manual} @inforef{,,imanual}
@xref{ , Bidule, Truc, file, Printed}.
';


$result_texts{'ref_empty_node'} = '
  
.
';

$result_errors{'ref_empty_node'} = '* W l2|@inforef is obsolete
 warning: @inforef is obsolete

';

$result_nodes_list{'ref_empty_node'} = '';

$result_sections_list{'ref_empty_node'} = '';

$result_sectioning_root{'ref_empty_node'} = '';

$result_headings_list{'ref_empty_node'} = '';

1;
