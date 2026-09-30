use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_no_node'} = '*document_root C2
 *before_node_section
 *@top C3 l1 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *paragraph C3
   {F}
   *@footnote C1 l3
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {In footnote}
   {.\\n}
';


$result_texis{'footnote_no_node'} = '@top top

F@footnote{In footnote}.
';


$result_texts{'footnote_no_node'} = 'top
***

F.
';

$result_errors{'footnote_no_node'} = '';

$result_nodes_list{'footnote_no_node'} = '';

$result_sections_list{'footnote_no_node'} = '1|top
';

$result_sectioning_root{'footnote_no_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'footnote_no_node'} = '';


$result_converted{'plaintext'}->{'footnote_no_node'} = 'top
***

F(1).

   ---------- Footnotes ----------

   (1) In footnote

';


$result_converted{'html_text'}->{'footnote_no_node'} = '<div class="top-level-extent" id="top">
<h1 class="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>F<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote</p>
</div>
</div>
';


$result_converted{'latex_text'}->{'footnote_no_node'} = '\\part*{{top}}

F\\footnote{In footnote}.
';


$result_converted{'docbook'}->{'footnote_no_node'} = '<chapter label="">
<title>top</title>

<para>F<footnote><para>In footnote</para></footnote>.
</para></chapter>
';

1;
