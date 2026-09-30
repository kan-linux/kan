use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'transparent_text'} = '*document_root C1
 *before_node_section C1
  *paragraph C5
   {AA}
   *@footnote C1 l1
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {in footnote}
   {). B (}
   *@emph C1 l1
    *brace_container C1
     {C}
   {). D.\\n}
';


$result_texis{'transparent_text'} = 'AA@footnote{in footnote}). B (@emph{C}). D.
';


$result_texts{'transparent_text'} = 'AA). B (C). D.
';

$result_errors{'transparent_text'} = '';

$result_nodes_list{'transparent_text'} = '';

$result_sections_list{'transparent_text'} = '';

$result_sectioning_root{'transparent_text'} = '';

$result_headings_list{'transparent_text'} = '';


$result_converted{'plaintext'}->{'transparent_text'} = 'AA(1)). B (_C_). D.

   ---------- Footnotes ----------

   (1) in footnote

';

1;
