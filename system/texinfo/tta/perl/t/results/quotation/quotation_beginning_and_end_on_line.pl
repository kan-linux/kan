use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'quotation_beginning_and_end_on_line'} = '*document_root C1
 *before_node_section C1
  *@quotation C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {in quotation}
   *@end C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'quotation_beginning_and_end_on_line'} = '@quotation in quotation @end quotation
';


$result_texts{'quotation_beginning_and_end_on_line'} = 'in quotation
';

$result_errors{'quotation_beginning_and_end_on_line'} = '* W l1|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

';

$result_nodes_list{'quotation_beginning_and_end_on_line'} = '';

$result_sections_list{'quotation_beginning_and_end_on_line'} = '';

$result_sectioning_root{'quotation_beginning_and_end_on_line'} = '';

$result_headings_list{'quotation_beginning_and_end_on_line'} = '';


$result_converted{'plaintext'}->{'quotation_beginning_and_end_on_line'} = '     in quotation: 
';


$result_converted{'html_text'}->{'quotation_beginning_and_end_on_line'} = '<blockquote class="quotation">
</blockquote>
';


$result_converted{'xml'}->{'quotation_beginning_and_end_on_line'} = '<quotation spaces=" " endspaces=" "><quotationtype>in quotation </quotationtype>
</quotation>
';


$result_converted{'docbook'}->{'quotation_beginning_and_end_on_line'} = '<blockquote></blockquote>';

1;
