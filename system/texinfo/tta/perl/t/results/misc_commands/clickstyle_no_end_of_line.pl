use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'clickstyle_no_end_of_line'} = '*document_root C1
 *before_node_section C1
  *@clickstyle C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{@result}
   *line_arg C1
    {rawline_text:@result}
';


$result_texis{'clickstyle_no_end_of_line'} = '@clickstyle @result';


$result_texts{'clickstyle_no_end_of_line'} = '';

$result_errors{'clickstyle_no_end_of_line'} = '* W l1|@clickstyle is obsolete
 warning: @clickstyle is obsolete

';

$result_nodes_list{'clickstyle_no_end_of_line'} = '';

$result_sections_list{'clickstyle_no_end_of_line'} = '';

$result_sectioning_root{'clickstyle_no_end_of_line'} = '';

$result_headings_list{'clickstyle_no_end_of_line'} = '';

1;
