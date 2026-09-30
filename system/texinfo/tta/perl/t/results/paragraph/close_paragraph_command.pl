use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'close_paragraph_command'} = '*document_root C1
 *before_node_section C7
  *paragraph C1
   {para }
  *@titlefont C1 l1
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {in titlefont}
  *paragraph C1
   { after titlefont.\\n}
  {empty_line:\\n}
  *paragraph C1
   {p before sp\\n}
  *@sp C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {4}
  *paragraph C1
   {inew p after sp}
';


$result_texis{'close_paragraph_command'} = 'para @titlefont{in titlefont} after titlefont.

p before sp
@sp 4
inew p after sp';


$result_texts{'close_paragraph_command'} = 'para in titlefont after titlefont.

p before sp




inew p after sp';

$result_errors{'close_paragraph_command'} = '';

$result_nodes_list{'close_paragraph_command'} = '';

$result_sections_list{'close_paragraph_command'} = '';

$result_sectioning_root{'close_paragraph_command'} = '';

$result_headings_list{'close_paragraph_command'} = '';


$result_converted{'plaintext'}->{'close_paragraph_command'} = 'para
in titlefont
************   after titlefont.

   p before sp




   inew p after sp
';


$result_converted{'html_text'}->{'close_paragraph_command'} = '<p>para </p><h1 class="titlefont">in titlefont</h1><p> after titlefont.
</p>
<p>p before sp
</p><br>
<br>
<br>
<br>
<p>inew p after sp</p>';

1;
