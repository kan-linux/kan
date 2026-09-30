use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'indicateurl_end_lines'} = '*document_root C1
 *before_node_section C4
  *paragraph C2
   *@indicateurl C1 l1
    *brace_container C2
     {http://begin\\n}
     {continue on other line}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   *@indicateurl C1 l4
    *brace_container C2
     {http://begin2\\n}
     {empty_line:\\n}
  *paragraph C1
   {cut by blank line\\n}
';


$result_texis{'indicateurl_end_lines'} = '@indicateurl{http://begin
continue on other line}

@indicateurl{http://begin2

}cut by blank line
';


$result_texts{'indicateurl_end_lines'} = 'http://begin
continue on other line

http://begin2

cut by blank line
';

$result_errors{'indicateurl_end_lines'} = '* E l4|@indicateurl missing closing brace
 @indicateurl missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'indicateurl_end_lines'} = '';

$result_sections_list{'indicateurl_end_lines'} = '';

$result_sectioning_root{'indicateurl_end_lines'} = '';

$result_headings_list{'indicateurl_end_lines'} = '';

1;
