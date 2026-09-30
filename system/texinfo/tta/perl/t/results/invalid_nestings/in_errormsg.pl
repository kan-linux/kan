use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'in_errormsg'} = '*document_root C1
 *before_node_section C7
  {empty_line:\\n}
  *@anchor C1 l2
  |EXTRA
  |is_target:{1}
  |normalized:{in-ref}
   *brace_arg C1
    {in ref}
  {spaces_after_close_brace:\\n}
  *paragraph C3
   {Text. }
   *@errormsg C1 l3
    *brace_arg C3
     *@anchor C1 l3
     |EXTRA
     |is_target:{1}
     |normalized:{in-anchor}
      *brace_arg C1
       {in anchor}
     {spaces_after_close_brace: }
     *@ref C1 l3
      *brace_arg C1
      |EXTRA
      |node_content:{in ref}
      |normalized:{in-ref}
       {in ref}
   {\\n}
  {empty_line:\\n}
  *@errormsg C1 l5
   *brace_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
  *@table C3 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l6
   *table_entry C1
    *table_term C1
     *@item C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
   *@end C1 l8
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


$result_texis{'in_errormsg'} = '
@anchor{in ref}
Text. @errormsg{@anchor{in anchor} @ref{in ref}}

@errormsg{
}@table @asis
@item item
@end table
';


$result_texts{'in_errormsg'} = '
Text. 

item
';

$result_errors{'in_errormsg'} = '* W l3|@anchor should not appear anywhere inside @errormsg
 warning: @anchor should not appear anywhere inside @errormsg

* W l3|@ref should not appear anywhere inside @errormsg
 warning: @ref should not appear anywhere inside @errormsg

* E l3|
 

* E l5|@errormsg missing closing brace
 @errormsg missing closing brace

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'in_errormsg'} = '';

$result_sections_list{'in_errormsg'} = '';

$result_sectioning_root{'in_errormsg'} = '';

$result_headings_list{'in_errormsg'} = '';

1;
