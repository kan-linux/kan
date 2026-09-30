use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'one_node_explicit_directions_anchor'} = '*document_root C2
 *before_node_section
 *@node C6 l1 {one node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{one-node}
  *arguments_line C4
   *line_arg C1
    {one node}
   *line_arg
   *line_arg
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
  *paragraph C1
   {Top node\\n}
  {empty_line:\\n}
  *paragraph C3
   {anchor ref }
   *@anchor C1 l4
   |EXTRA
   |is_target:{1}
   |normalized:{ref}
    *brace_arg C1
     {ref}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {ref to ref }
   *@ref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:{ref}
    |normalized:{ref}
     {ref}
   {.\\n}
';


$result_texis{'one_node_explicit_directions_anchor'} = '@node one node,,,(dir)
Top node

anchor ref @anchor{ref}.

ref to ref @ref{ref}.
';


$result_texts{'one_node_explicit_directions_anchor'} = 'Top node

anchor ref .

ref to ref ref.
';

$result_errors{'one_node_explicit_directions_anchor'} = '';

$result_nodes_list{'one_node_explicit_directions_anchor'} = '1|one node
 node_directions:
  up->(dir)

';

$result_sections_list{'one_node_explicit_directions_anchor'} = '';

$result_sectioning_root{'one_node_explicit_directions_anchor'} = '';

$result_headings_list{'one_node_explicit_directions_anchor'} = '';


$result_converted{'info'}->{'one_node_explicit_directions_anchor'} = 'This is , produced from .


File: ,  Node: one node,  Up: (dir)

Top node

   anchor ref .

   ref to ref *note ref::.


Tag Table:
Node: one node27
Ref: ref89

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'one_node_explicit_directions_anchor'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'one_node_explicit_directions_anchor'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#one-node" rel="start" title="one node">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h4 class="node" id="one-node"><span>one node<a class="copiable-link" href="#one-node"> &para;</a></span></h4>
<p>Top node
</p>
<p>anchor ref <a class="anchor" id="ref"></a>.
</p>
<p>ref to ref <a class="ref" href="#ref">ref</a>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'one_node_explicit_directions_anchor'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
