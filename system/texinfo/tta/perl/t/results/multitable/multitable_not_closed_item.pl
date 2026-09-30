use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_not_closed_item'} = '*document_root C1
 *before_node_section C1
  *@multitable C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {r}
     { }
     *bracketed_arg C1 l1
      {t}
   *multitable_body C1
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {rt \\n}
';


$result_texis{'multitable_not_closed_item'} = '@multitable {r} {t}
@item rt 
';


$result_texts{'multitable_not_closed_item'} = 'rt 
';

$result_errors{'multitable_not_closed_item'} = '* E l1|no matching `@end multitable\'
 no matching `@end multitable\'

';

$result_nodes_list{'multitable_not_closed_item'} = '';

$result_sections_list{'multitable_not_closed_item'} = '';

$result_sectioning_root{'multitable_not_closed_item'} = '';

$result_headings_list{'multitable_not_closed_item'} = '';

1;
