use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_line_in_paragraph'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {documentlanguage on its line\\n}
   *@documentlanguage C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     {en}
   {line following documentlanguage\\n}
';


$result_texis{'command_line_in_paragraph'} = 'documentlanguage on its line
@documentlanguage  en  
line following documentlanguage
';


$result_texts{'command_line_in_paragraph'} = 'documentlanguage on its line
line following documentlanguage
';

$result_errors{'command_line_in_paragraph'} = '';

$result_nodes_list{'command_line_in_paragraph'} = '';

$result_sections_list{'command_line_in_paragraph'} = '';

$result_sectioning_root{'command_line_in_paragraph'} = '';

$result_headings_list{'command_line_in_paragraph'} = '';

1;
