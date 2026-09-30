use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'on_node_line'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {@ref{a, b, c, filename}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a}
  *arguments_line C2
   *line_arg C1
    *@ref C4 l1
     *brace_arg C1
     |EXTRA
     |node_content:{a}
      {a}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {b}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {c}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {filename}
   *line_arg C8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{@pxref{(somemanual)Top}}
   |node_content:{@anchor{in anchor}@footnote{footnote} @exdent exdent\\n}
   |normalized:{-}
    {(}
    *@pxref C1 l1
     *brace_arg C4
     |EXTRA
     |manual_content:{somemanual}
     |node_content:{Top}
      {(}
      {somemanual}
      {)}
      {Top}
    {)}
    { }
    *@anchor C1 l1
    |EXTRA
    |is_target:{1}
    |normalized:{in-anchor}
     *brace_arg C1
      {in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {footnote}
    { }
    *@exdent C1 l1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {exdent}
';


$result_texis{'on_node_line'} = '@node @ref{a, b, c, filename}, (@pxref{(somemanual)Top}) @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_node_line'} = '';

$result_errors{'on_node_line'} = '* W l1|@ref should not appear on @node line
 warning: @ref should not appear on @node line

* W l1|@pxref should not appear on @node line
 warning: @pxref should not appear on @node line

* W l1|@anchor should not appear on @node line
 warning: @anchor should not appear on @node line

* W l1|@footnote should not appear on @node line
 warning: @footnote should not appear on @node line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @node line
 warning: @exdent should not appear on @node line

';

$result_nodes_list{'on_node_line'} = '1|@ref{a, b, c, filename}
 node_directions:
  next-> (@pxref{(somemanual)Top}) @anchor{in anchor}@footnote{footnote} @exdent exdent

';

$result_sections_list{'on_node_line'} = '';

$result_sectioning_root{'on_node_line'} = '';

$result_headings_list{'on_node_line'} = '';


$result_converted{'plaintext'}->{'on_node_line'} = '';


$result_converted{'xml'}->{'on_node_line'} = '<node identifier="a" spaces=" "><nodename><ref label="a" manual="filename"><xrefnodename>a</xrefnodename><xrefinfoname spaces=" ">b</xrefinfoname><xrefprinteddesc spaces=" ">c</xrefprinteddesc><xrefinfofile spaces=" ">filename</xrefinfofile></ref></nodename><nodenext spaces=" ">(<pxref label="Top" manual="somemanual"><xrefnodename>(somemanual)Top</xrefnodename></pxref>) <anchor identifier="in-anchor">in anchor</anchor><footnote><para>footnote</para></footnote> <exdent spaces=" ">exdent</exdent>
</nodenext></node>';

1;
