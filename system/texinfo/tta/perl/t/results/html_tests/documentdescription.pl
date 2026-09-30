use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'documentdescription'} = '*document_root C2
 *before_node_section C2
  *@documentdescription C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C15
    {in }
    *@code C1 l2
     *brace_container C1
      {documentdescri---ption}
    { --- }
    *@bullet C1 l2
     *brace_container
    { }
    *@enddots C1 l2
     *brace_container
    { }
    *@verb C1 l2
    |INFO
    |delimiter:{:}
     *brace_container C1
      {raw:"verb}
    { }
    *@aa C1 l2
     *brace_container
    { }
    *@^ C1 l2
     *brace_container C1
      *@dotless C1 l2
       *brace_container C1
        {i}
    { }
    *@email C1 l2
     *brace_arg C2
      *@code C1 l2
       *brace_container C1
        {some}
      {body}
    {\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{documentdescription}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {documentdescription}
  {empty_line:\\n}
 *@top C1 l5 {top}
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
';


$result_texis{'documentdescription'} = '@documentdescription
in @code{documentdescri---ption} --- @bullet{} @enddots{} @verb{:"verb:} @aa{} @^{@dotless{i}} @email{@code{some}body}
@end documentdescription

@top top
';


$result_texts{'documentdescription'} = '
top
***
';

$result_errors{'documentdescription'} = '';

$result_nodes_list{'documentdescription'} = '';

$result_sections_list{'documentdescription'} = '1|top
';

$result_sectioning_root{'documentdescription'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentdescription'} = '';


$result_converted{'html'}->{'documentdescription'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="in documentdescri---ption &mdash; &bull; ... &quot;verb &aring; &icirc; somebody (somebody)">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>

<div class="top-level-extent" id="top">
<h1 class="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>
</div>



</body>
</html>
';

1;
