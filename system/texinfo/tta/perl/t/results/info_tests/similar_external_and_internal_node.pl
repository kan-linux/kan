use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'similar_external_and_internal_node'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {aa}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{aa}
  *arguments_line C2
   *line_arg C1
    {aa}
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{toto}
   |node_content:{bb}
   |normalized:{bb}
    {(}
    {toto}
    {)}
    {bb}
  {empty_line:\\n}
  *paragraph C8
   *@xref C4 l3
    *brace_arg C1
    |EXTRA
    |node_content:{@emph{aa}}
     *@emph C1 l3
      *brace_container C1
       {aa}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {ext}
   {.\\n}
   *@xref C5 l4
    *brace_arg C1
    |EXTRA
    |node_content:{@var{aa}}
     *@var C1 l4
      *brace_container C1
       {aa}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {Book}
   {.\\n}
   *@xref C1 l5
    *brace_arg C1
    |EXTRA
    |node_content:{@emph{aa}}
    |normalized:{aa}
     *@emph C1 l5
      *brace_container C1
       {aa}
   {.\\n}
   *@xref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:{@var{aa}}
    |normalized:{aa}
     *@var C1 l6
      *brace_container C1
       {aa}
   {.\\n}
';


$result_texis{'similar_external_and_internal_node'} = '@node aa, (toto)bb

@xref{@emph{aa},,,ext}.
@xref{@var{aa},,,,Book}.
@xref{@emph{aa}}.
@xref{@var{aa}}.
';


$result_texts{'similar_external_and_internal_node'} = '
aa.
aa.
aa.
aa.
';

$result_errors{'similar_external_and_internal_node'} = '* W l5|@xref to `@emph{aa}\', different from node name `aa\'
 warning: @xref to `@emph{aa}\', different from node name `aa\'

* W l6|@xref to `@var{aa}\', different from node name `aa\'
 warning: @xref to `@var{aa}\', different from node name `aa\'

';

$result_nodes_list{'similar_external_and_internal_node'} = '1|aa
 node_directions:
  next-> (toto)bb

';

$result_sections_list{'similar_external_and_internal_node'} = '';

$result_sectioning_root{'similar_external_and_internal_node'} = '';

$result_headings_list{'similar_external_and_internal_node'} = '';


$result_converted{'info'}->{'similar_external_and_internal_node'} = 'This is , produced from .


File: ,  Node: aa,  Next: (toto)bb

*Note (ext)_aa_::.  *Note ()AA::.  *Note aa::.  *Note aa::.


Tag Table:
Node: aa27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'similar_external_and_internal_node'} = '* W |document without Top node
 warning: document without Top node

';

1;
