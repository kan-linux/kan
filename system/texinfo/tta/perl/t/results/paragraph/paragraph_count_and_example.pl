use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraph_count_and_example'} = '*document_root C1
 *before_node_section C3
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {in example\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *paragraph C1
   {After.\\n}
';


$result_texis{'paragraph_count_and_example'} = '@example
in example
@end example

After.
';


$result_texts{'paragraph_count_and_example'} = 'in example

After.
';

$result_errors{'paragraph_count_and_example'} = '';

$result_nodes_list{'paragraph_count_and_example'} = '';

$result_sections_list{'paragraph_count_and_example'} = '';

$result_sectioning_root{'paragraph_count_and_example'} = '';

$result_headings_list{'paragraph_count_and_example'} = '';


$result_converted{'plaintext'}->{'paragraph_count_and_example'} = '     in example

   After.
';


$result_converted{'html_text'}->{'paragraph_count_and_example'} = '<div class="example">
<pre class="example-preformatted">in example
</pre></div>

<p>After.
</p>';

1;
