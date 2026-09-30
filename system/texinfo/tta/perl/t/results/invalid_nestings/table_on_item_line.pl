use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_on_item_line'} = '*document_root C1
 *before_node_section C2
  *@table C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l1
   *table_entry C2
    *table_term C1
     *@item C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C2
       {item }
       *@table C1 l2
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *arguments_line C1
         *block_line_arg C1
         |INFO
         |spaces_after_argument:
          |{spaces_after_argument:\\n}
          *@asis l2
    *table_definition C1
     {spaces_before_paragraph:   }
   *table_entry C2
    *table_term C1
     *@item C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in nested table item}
    *table_definition C2
     {spaces_before_paragraph:   }
     *paragraph C2
      {in nested table line\\n}
      {   }
   *@end C1 l5
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
  *paragraph C1
   {in table line\\n}
';


$result_texis{'table_on_item_line'} = '@table @asis
@item item @table @asis
   @item in nested table item
   in nested table line
   @end table
in table line
';


$result_texts{'table_on_item_line'} = 'item 
in nested table item
in nested table line
   in table line
';

$result_errors{'table_on_item_line'} = '* W l2|@table should only appear at the beginning of a line
 warning: @table should only appear at the beginning of a line

* W l2|@table should not appear in @item
 warning: @table should not appear in @item

* E l2|no matching `@end table\'
 no matching `@end table\'

* E l7|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'table_on_item_line'} = '';

$result_sections_list{'table_on_item_line'} = '';

$result_sectioning_root{'table_on_item_line'} = '';

$result_headings_list{'table_on_item_line'} = '';

1;
