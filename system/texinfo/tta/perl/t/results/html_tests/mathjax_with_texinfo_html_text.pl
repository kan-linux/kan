use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'mathjax_with_texinfo_html_text'} = '*document_root C1
 *before_node_section C3
  *@displaymath C7 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {a}
   *@sup C1 l2
    *brace_container C3
     {b - \\frac}
     *balanced_braces C1 l2
      {{\\xi}}
     *balanced_braces C3 l2
      {{phi }
      *@copyright C1 l2
       *brace_container
      {}}
   { }
   *@dotless C1 l2
    *brace_container C1
     {i}
   {\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *paragraph C3
   {Some }
   *@math C1 l5
    *brace_command_context C8
     {a }
     *@minus C1 l5
      *brace_container
     { b }
     *@geq C1 l5
      *brace_container
     { }
     *@AA C1 l5
      *brace_container
     { }
     *@^ C1 l5
      *following_arg C1
       {e}
   {.\\n}
';


$result_texis{'mathjax_with_texinfo_html_text'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'mathjax_with_texinfo_html_text'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'mathjax_with_texinfo_html_text'} = '';

$result_nodes_list{'mathjax_with_texinfo_html_text'} = '';

$result_sections_list{'mathjax_with_texinfo_html_text'} = '';

$result_sectioning_root{'mathjax_with_texinfo_html_text'} = '';

$result_headings_list{'mathjax_with_texinfo_html_text'} = '';


$result_converted{'html_text'}->{'mathjax_with_texinfo_html_text'} = '<pre class="displaymath tex2jax_process">\\[a^{b - \\frac{\\xi}{phi \\copyright{}}} \\imath{}
\\]</pre>
<p>Some <em class="math tex2jax_process">\\(a - b \\geq{} \\mathord{\\text{\\AA{}}} \\hat{e}\\)</em>.
</p>';

1;
