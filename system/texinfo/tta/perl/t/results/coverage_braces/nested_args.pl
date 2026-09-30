use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested_args'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@xref C4 l1
    *brace_arg C3
    |EXTRA
    |node_content:{@@ @samp{in samp}}
     *@@
     { }
     *@samp C1 l1
      *brace_container C1
       {in samp}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {descr }
     *@b C1 l1
      *brace_container C1
       {in b}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {S}
     *@~ C1 l1
      *brace_container C1
       {e}
     {ction}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: \\n}
     *@cite C1 l2
      *brace_container C1
       {manual}
   {.}
';


$result_texis{'nested_args'} = '@xref{@@ @samp{in samp}, descr @b{in b}, S@~{e}ction, 
@cite{manual}}.';


$result_texts{'nested_args'} = '@ in samp.';

$result_errors{'nested_args'} = '';

$result_nodes_list{'nested_args'} = '';

$result_sections_list{'nested_args'} = '';

$result_sectioning_root{'nested_args'} = '';

$result_headings_list{'nested_args'} = '';


$result_converted{'plaintext'}->{'nested_args'} = 'See descr in b: (‘manual’)@ in samp.
';


$result_converted{'html_text'}->{'nested_args'} = '<p>See <a data-manual="manual" href="manual.html#g_t_0040-in-samp">S&#7869;ction</a>.</p>';


$result_converted{'latex_text'}->{'nested_args'} = 'See Section ``S\\~{e}ction\'\' in \\texttt{\\Texinfocommandstyletextcite{manual}}.';


$result_converted{'docbook'}->{'nested_args'} = '<para>See section &#8220;S&#7869;ction&#8221; in <filename><citetitle>manual</citetitle></filename>.</para>';

1;
