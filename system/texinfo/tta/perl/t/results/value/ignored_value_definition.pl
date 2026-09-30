use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ignored_value_definition'} = '*document_root C1
 *before_node_section C5
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{aa|outside}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:aa outside}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmt C2 l3
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw:\\n@set aa in inlinefmt tex\\n}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {outside.\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{outside}
    >*@value C1
     >*brace_container C1
      >{aa}
   >value_expansion<end;1><p:7>
';


$result_texis{'ignored_value_definition'} = '@set aa outside

@inlinefmt{tex,
@set aa in inlinefmt tex
}

outside.
';


$result_texts{'ignored_value_definition'} = '


outside.
';

$result_errors{'ignored_value_definition'} = '';

$result_nodes_list{'ignored_value_definition'} = '';

$result_sections_list{'ignored_value_definition'} = '';

$result_sectioning_root{'ignored_value_definition'} = '';

$result_headings_list{'ignored_value_definition'} = '';

1;
