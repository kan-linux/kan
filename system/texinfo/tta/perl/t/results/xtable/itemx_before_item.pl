use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'itemx_before_item'} = '*document_root C1
 *before_node_section C1
  *@table C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l1
   *table_entry C1
    *table_term C1
     *@itemx C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in itemx}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
';


$result_texis{'itemx_before_item'} = '@table @emph
@itemx in itemx
@end table
';


$result_texts{'itemx_before_item'} = 'in itemx
';

$result_errors{'itemx_before_item'} = '* E l2|@itemx should not begin @table
 @itemx should not begin @table

';

$result_nodes_list{'itemx_before_item'} = '';

$result_sections_list{'itemx_before_item'} = '';

$result_sectioning_root{'itemx_before_item'} = '';

$result_headings_list{'itemx_before_item'} = '';

1;
