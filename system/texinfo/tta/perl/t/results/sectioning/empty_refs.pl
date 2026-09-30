use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_refs'} = '*document_root C1
 *before_node_section C1
  *paragraph C4
   *@xref C1 l1
    *brace_arg C1
    |EXTRA
    |node_content:{@:}
     *@:
   {.\\n}
   *@xref C1 l2
    *brace_arg C1
    |EXTRA
    |node_content:{@asis{ }}
    |normalized:{-}
     *@asis C1 l2
      *brace_container C1
       { }
   {.\\n}
';


$result_texis{'empty_refs'} = '@xref{@:}.
@xref{@asis{ }}.
';


$result_texts{'empty_refs'} = '.
 .
';

$result_errors{'empty_refs'} = '* E l1|@xref reference to nonexistent node `@:\'
 @xref reference to nonexistent node `@:\'

* E l2|@xref reference to nonexistent node `@asis{ }\'
 @xref reference to nonexistent node `@asis{ }\'

';

$result_nodes_list{'empty_refs'} = '';

$result_sections_list{'empty_refs'} = '';

$result_sectioning_root{'empty_refs'} = '';

$result_headings_list{'empty_refs'} = '';

1;
