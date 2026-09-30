use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_in_copying'} = '*document_root C3
 *before_node_section C2
  *@copying C7 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *@heading C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |heading_number:{1}
    *line_arg C4
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in copying }
     *@@
     { }
     *@emph C1 l3
      *brace_container C1
       {heading}
   *index_entry_command@cindex C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_region:{copying}
   |index_entry:I{cp,1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cindex copying}
   {empty_line:\\n}
   *@subheading C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |heading_number:{2}
    *line_arg C4
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {second in copying }
     *@@
     { }
     *@emph C1 l6
      *brace_container C1
       {subheading}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{copying}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {copying}
  {empty_line:\\n}
 *@node C1 l9 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@node C3 l10 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *@insertcopying C1 l12
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'heading_in_copying'} = '@copying

@heading in copying @@ @emph{heading}
@cindex cindex copying

@subheading second in copying @@ @emph{subheading}
@end copying

@node Top
@node chap

@insertcopying
';


$result_texts{'heading_in_copying'} = '

';

$result_errors{'heading_in_copying'} = '* W l10|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'heading_in_copying'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'heading_in_copying'} = '';

$result_sectioning_root{'heading_in_copying'} = '';

$result_headings_list{'heading_in_copying'} = '1|in copying @@ @emph{heading}
2|second in copying @@ @emph{subheading}
';

$result_indices_sort_strings{'heading_in_copying'} = 'cp:
 cindex copying
';


$result_converted{'plaintext'}->{'heading_in_copying'} = 'in copying @ _heading_
======================

second in copying @ _subheading_
--------------------------------

';


$result_converted{'html'}->{'heading_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 
in copying @ heading
====================

second in copying @ subheading
- -->
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>

<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>


<h3 class="heading" id="in-copying-_0040-heading"><span>in copying @ <em class="emph">heading</em><a class="copiable-link" href="#in-copying-_0040-heading"> &para;</a></span></h3>
<a class="index-entry-id" id="index-copying-cindex-copying"></a>

<h4 class="subheading" id="second-in-copying-_0040-subheading"><span>second in copying @ <em class="emph">subheading</em><a class="copiable-link" href="#second-in-copying-_0040-subheading"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'heading_in_copying'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
