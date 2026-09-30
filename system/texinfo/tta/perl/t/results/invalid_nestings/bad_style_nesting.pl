use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_style_nesting'} = '*document_root C1
 *before_node_section C2
  *paragraph C1
   *@code C1 l1
    *brace_container C1
     {\\n}
  *@quotation C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in quotation\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'bad_style_nesting'} = '@code{
}@quotation
in quotation
@end quotation
';


$result_texts{'bad_style_nesting'} = '
in quotation
';

$result_errors{'bad_style_nesting'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l3|misplaced }
 misplaced }

';

$result_nodes_list{'bad_style_nesting'} = '';

$result_sections_list{'bad_style_nesting'} = '';

$result_sectioning_root{'bad_style_nesting'} = '';

$result_headings_list{'bad_style_nesting'} = '';

1;
