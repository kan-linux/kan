use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiline_verb_after_space'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {AA }
   *@verb C1 l1
   |INFO
   |delimiter:{*}
    *brace_container C2
     {raw:aa\\n}
     {raw:bb}
   {.\\n}
';


$result_texis{'multiline_verb_after_space'} = 'AA @verb{*aa
bb*}.
';


$result_texts{'multiline_verb_after_space'} = 'AA aa
bb.
';

$result_errors{'multiline_verb_after_space'} = '';

$result_nodes_list{'multiline_verb_after_space'} = '';

$result_sections_list{'multiline_verb_after_space'} = '';

$result_sectioning_root{'multiline_verb_after_space'} = '';

$result_headings_list{'multiline_verb_after_space'} = '';


$result_converted{'plaintext'}->{'multiline_verb_after_space'} = 'AA aa
bb.
';

1;
