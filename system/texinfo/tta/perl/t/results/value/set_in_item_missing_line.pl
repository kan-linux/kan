use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'set_in_item_missing_line'} = '*document_root C1
 *before_node_section C3
  *@table C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l1
   *table_entry C1
    *table_term C1
     *@item C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C2
       {xx }
       *@set C1
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |misc_args:A{n|}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {rawline_text:n}
   *table_entry C1
    *table_term C1
     *@item C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {jj}
   *@end C1 l4
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
  {empty_line:\\n}
  *@table C4 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l6
   *table_entry C1
    *table_term C1
     *@item C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C2
       {cxx }
       *@set C1
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |misc_args:A{cn|}
        *line_arg C1
        |INFO
        |comment_at_end:
         |*@c C1
          |*line_arg C1
          ||INFO
          ||spaces_after_argument:
           ||{spaces_after_argument:\\n}
           |{rawline_text:}
         {rawline_text:cn}
   *table_entry C1
    *table_term C1
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {jj}
   *@end C1 l9
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


$result_texis{'set_in_item_missing_line'} = '@table @code
@item xx @set n
@item jj
@end table

@table @code
@item cxx @set cn@c
@item jj
@end table
';


$result_texts{'set_in_item_missing_line'} = 'xx 
jj

cxx 
jj
';

$result_errors{'set_in_item_missing_line'} = '* W l2|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l7|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

';

$result_nodes_list{'set_in_item_missing_line'} = '';

$result_sections_list{'set_in_item_missing_line'} = '';

$result_sectioning_root{'set_in_item_missing_line'} = '';

$result_headings_list{'set_in_item_missing_line'} = '';

1;
