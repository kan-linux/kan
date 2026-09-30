use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_in_quotation'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@quotation C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C2
    {Quotation }
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {quotation}
  {empty_line:\\n}
  *@quotation C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C2
    {Quotation no space}
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {quotation}
';


$result_texis{'comment_in_quotation'} = '
@quotation
Quotation @c
@end quotation 

@quotation
Quotation no space@c
@end quotation 
';


$result_texts{'comment_in_quotation'} = '
Quotation 
Quotation no space';

$result_errors{'comment_in_quotation'} = '';

$result_nodes_list{'comment_in_quotation'} = '';

$result_sections_list{'comment_in_quotation'} = '';

$result_sectioning_root{'comment_in_quotation'} = '';

$result_headings_list{'comment_in_quotation'} = '';


$result_converted{'plaintext'}->{'comment_in_quotation'} = '     Quotation

     Quotation no space
';


$result_converted{'html_text'}->{'comment_in_quotation'} = '
<blockquote class="quotation">
<p>Quotation </p></blockquote>

<blockquote class="quotation">
<p>Quotation no space</p></blockquote>
';

1;
