use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_one_column_too_much_cells'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {a}
   *multitable_body C4
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C8 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {a }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {additional tab }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {other additional tab }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {3rd  additiona tab\\n}
    *row C1
    |EXTRA
    |row_number:{2}
     *@item C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {a1\\n}
    *row C1
    |EXTRA
    |row_number:{3}
     *@item C8 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {a2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {additional tab2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {other additional tab2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {3rd  additional tab2\\n}
    *row C1
    |EXTRA
    |row_number:{4}
     *@item C4 l5
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {a3 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {one additional tab\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
';


$result_texis{'multitable_one_column_too_much_cells'} = '@multitable {a}
@item a  additional tab  other additional tab  3rd  additiona tab
@item a1
@item a2  additional tab2  other additional tab2  3rd  additional tab2
@item a3  one additional tab
@end multitable
';


$result_texts{'multitable_one_column_too_much_cells'} = 'a additional tab other additional tab 3rd  additiona tab
a1
a2 additional tab2 other additional tab2 3rd  additional tab2
a3 one additional tab
';

$result_errors{'multitable_one_column_too_much_cells'} = '* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l5|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

';

$result_nodes_list{'multitable_one_column_too_much_cells'} = '';

$result_sections_list{'multitable_one_column_too_much_cells'} = '';

$result_sectioning_root{'multitable_one_column_too_much_cells'} = '';

$result_headings_list{'multitable_one_column_too_much_cells'} = '';

1;
