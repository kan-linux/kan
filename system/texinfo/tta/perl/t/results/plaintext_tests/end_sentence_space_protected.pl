use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_sentence_space_protected'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {Some text. }
   *@\\n
   {Next sentence.\\n}
';


$result_texis{'end_sentence_space_protected'} = 'Some text. @
Next sentence.
';


$result_texts{'end_sentence_space_protected'} = 'Some text.  Next sentence.
';

$result_errors{'end_sentence_space_protected'} = '';

$result_nodes_list{'end_sentence_space_protected'} = '';

$result_sections_list{'end_sentence_space_protected'} = '';

$result_sectioning_root{'end_sentence_space_protected'} = '';

$result_headings_list{'end_sentence_space_protected'} = '';


$result_converted{'plaintext'}->{'end_sentence_space_protected'} = 'Some text.   Next sentence.
';

1;
