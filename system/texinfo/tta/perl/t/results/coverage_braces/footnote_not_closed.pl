use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_not_closed'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   {AAA}
   *@footnote C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C3
     *paragraph C1
      {in footnote\\n}
     {empty_line:\\n}
     *paragraph C1
      {Second paragraph.\\n}
';


$result_texis{'footnote_not_closed'} = 'AAA@footnote{ in footnote

Second paragraph.
}';


$result_texts{'footnote_not_closed'} = 'AAA';

$result_errors{'footnote_not_closed'} = '* E l1|@footnote missing closing brace
 @footnote missing closing brace

';

$result_nodes_list{'footnote_not_closed'} = '';

$result_sections_list{'footnote_not_closed'} = '';

$result_sectioning_root{'footnote_not_closed'} = '';

$result_headings_list{'footnote_not_closed'} = '';

1;
