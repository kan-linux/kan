use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'insert_copying_and_paragraph'} = '*document_root C1
 *before_node_section C4
  *@copying C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {In copying.\\n}
   *@end C1 l3
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
  *paragraph C1
   {Insertcopying\\n}
  *@insertcopying C1 l6
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'insert_copying_and_paragraph'} = '@copying
In copying.
@end copying

Insertcopying
@insertcopying
';


$result_texts{'insert_copying_and_paragraph'} = '
Insertcopying
';

$result_errors{'insert_copying_and_paragraph'} = '';

$result_nodes_list{'insert_copying_and_paragraph'} = '';

$result_sections_list{'insert_copying_and_paragraph'} = '';

$result_sectioning_root{'insert_copying_and_paragraph'} = '';

$result_headings_list{'insert_copying_and_paragraph'} = '';


$result_converted{'plaintext'}->{'insert_copying_and_paragraph'} = 'Insertcopying
   In copying.
';

1;
