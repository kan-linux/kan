use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlinefmtifelse_nesting'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@inlinefmtifelse C3 l1
   |EXTRA
   |expand_index:{2}
   |format:{info}
    *brace_arg C1
     {info}
    *elided_brace_command_arg C1
     {raw: @footnote{See.}}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@emph C1 l1
      *brace_container C1
       {text}
   {\\n}
';


$result_texis{'inlinefmtifelse_nesting'} = '@inlinefmtifelse{info, @footnote{See.}, @emph{text}}
';


$result_texts{'inlinefmtifelse_nesting'} = 'text
';

$result_errors{'inlinefmtifelse_nesting'} = '';

$result_nodes_list{'inlinefmtifelse_nesting'} = '';

$result_sections_list{'inlinefmtifelse_nesting'} = '';

$result_sectioning_root{'inlinefmtifelse_nesting'} = '';

$result_headings_list{'inlinefmtifelse_nesting'} = '';

1;
