use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'tex_expanded_in_caption_multiple_time'} = '*document_root C1
 *before_node_section C3
  *@float C5 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{A}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{B}
   *arguments_line C2
    *block_line_arg C1
     {A}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {B}
   *paragraph C1
    {My float.\\n}
   *@caption C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
    *brace_command_context C1
     *@tex C3 l4
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *rawpreformatted C1
       {aa\\n}
      *@end C1 l6
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{tex}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {tex}
   {spaces_after_close_brace:\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{A}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A}
';


$result_texis{'tex_expanded_in_caption_multiple_time'} = '@float A, B
My float.
@caption{
@tex
aa
@end tex
}
@end float

@listoffloats A
';


$result_texts{'tex_expanded_in_caption_multiple_time'} = 'A, B
My float.

';

$result_errors{'tex_expanded_in_caption_multiple_time'} = '';

$result_floats{'tex_expanded_in_caption_multiple_time'} = 'A: 1
 F1: {B}
  C: @tex
   aa
   @end tex
';

$result_nodes_list{'tex_expanded_in_caption_multiple_time'} = '';

$result_sections_list{'tex_expanded_in_caption_multiple_time'} = '';

$result_sectioning_root{'tex_expanded_in_caption_multiple_time'} = '';

$result_headings_list{'tex_expanded_in_caption_multiple_time'} = '';


$result_converted{'html'}->{'tex_expanded_in_caption_multiple_time'} = '<!DOCTYPE html>
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



</head>

<body>
<div class="float" id="B">
<p>My float.
</p><div class="caption">aa
</div></div>
<dl class="listoffloats">
<dt><a href="#B">A 1</a></dt><dd class="caption-in-listoffloats">aa
</dd>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'tex_expanded_in_caption_multiple_time'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

* W l4|raw format tex is not converted
 warning: raw format tex is not converted

';

1;
