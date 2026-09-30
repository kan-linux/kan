use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline_missing_first_arg'} = '*document_root C1
 *before_node_section C1
  *paragraph C4
   *@inlinefmt C2 l1
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *elided_brace_command_arg C1
     {raw: aaa}
   {. }
   *@inlineraw C2 l1
    *brace_arg
    *elided_brace_command_arg C1
     {raw: bbb}
   {.\\n}
';


$result_texis{'inline_missing_first_arg'} = '@inlinefmt{ , aaa}. @inlineraw{, bbb}.
';


$result_texts{'inline_missing_first_arg'} = '. .
';

$result_errors{'inline_missing_first_arg'} = '* W l1|@inlinefmt missing first argument
 warning: @inlinefmt missing first argument

* W l1|@inlineraw missing first argument
 warning: @inlineraw missing first argument

';

$result_nodes_list{'inline_missing_first_arg'} = '';

$result_sections_list{'inline_missing_first_arg'} = '';

$result_sectioning_root{'inline_missing_first_arg'} = '';

$result_headings_list{'inline_missing_first_arg'} = '';

1;
