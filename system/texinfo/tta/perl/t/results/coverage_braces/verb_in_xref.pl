use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_in_xref'} = '*document_root C1
 *before_node_section C4
  *@anchor C1 l1
  |EXTRA
  |is_target:{1}
  |normalized:{point}
   *brace_arg C1
    {point}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C2 l3
    *brace_arg C1
    |EXTRA
    |node_content:{point}
    |normalized:{point}
     {point}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@verb C1 l3
     |INFO
     |delimiter:{*}
      *brace_container C4
       {raw:with\\n}
       {raw:verb\\n}
       {raw:\\n}
       {raw:ggg }
   {.\\n}
';


$result_texis{'verb_in_xref'} = '@anchor{point}

@xref{point, @verb{*with
verb

ggg *}}.
';


$result_texts{'verb_in_xref'} = '
point.
';

$result_errors{'verb_in_xref'} = '* W l3|@verb should not appear anywhere inside @xref
 warning: @verb should not appear anywhere inside @xref

';

$result_nodes_list{'verb_in_xref'} = '';

$result_sections_list{'verb_in_xref'} = '';

$result_sectioning_root{'verb_in_xref'} = '';

$result_headings_list{'verb_in_xref'} = '';


$result_converted{'plaintext'}->{'verb_in_xref'} = 'See with
verb

ggg : point.
';


$result_converted{'html_text'}->{'verb_in_xref'} = '<a class="anchor" id="point"></a>
<p>See <a class="xref" href="#point"><code class="verb">with<br>verb<br><br>ggg&nbsp;</code></a>.
</p>';


$result_converted{'latex_text'}->{'verb_in_xref'} = '\\label{anchor:point}%

See \\hyperref[anchor:point]{[point], page~\\pageref*{anchor:point}}.
';


$result_converted{'docbook'}->{'verb_in_xref'} = '<anchor id="point"/>
<para>See <link linkend="point"><literal>with
verb

ggg </literal></link>.
</para>';

1;
