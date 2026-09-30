use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'contents_arg_and_comment'} = '*document_root C1
 *before_node_section C1
  *@contents C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:v}
    {rawline_text:aa }
';


$result_texis{'contents_arg_and_comment'} = '@contents aa @comment v
';


$result_texts{'contents_arg_and_comment'} = '';

$result_errors{'contents_arg_and_comment'} = '* W l1|remaining argument on @contents line: aa 
 warning: remaining argument on @contents line: aa 

';

$result_nodes_list{'contents_arg_and_comment'} = '';

$result_sections_list{'contents_arg_and_comment'} = '';

$result_sectioning_root{'contents_arg_and_comment'} = '';

$result_headings_list{'contents_arg_and_comment'} = '';

1;
