use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'commands_and_punctuation'} = '*document_root C1
 *before_node_section C1
  *paragraph C9
   {SomthingA}
   *@.
   {   and now inhibit.}
   *@:
   { Now dots }
   *@dots C1 l1
    *brace_container
   { and enddots }
   *@enddots C1 l1
    *brace_container
   { and}
';


$result_texis{'commands_and_punctuation'} = 'SomthingA@.   and now inhibit.@: Now dots @dots{} and enddots @enddots{} and';


$result_texts{'commands_and_punctuation'} = 'SomthingA.   and now inhibit. Now dots ... and enddots ... and';

$result_errors{'commands_and_punctuation'} = '';

$result_nodes_list{'commands_and_punctuation'} = '';

$result_sections_list{'commands_and_punctuation'} = '';

$result_sectioning_root{'commands_and_punctuation'} = '';

$result_headings_list{'commands_and_punctuation'} = '';


$result_converted{'plaintext'}->{'commands_and_punctuation'} = 'SomthingA.  and now inhibit. Now dots ... and enddots ...  and
';

1;
