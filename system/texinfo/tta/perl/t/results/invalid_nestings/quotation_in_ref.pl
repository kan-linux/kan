use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'quotation_in_ref'} = '*document_root C2
 *before_node_section
 *@node C5 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *paragraph C1
   *@xref C2 l3
    *brace_arg C1
     {first}
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument:\\n}
  *@quotation C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {quotation in ref\\n}
   *@end C1 l6
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
  *paragraph C1
   {.\\n}
';


$result_texis{'quotation_in_ref'} = '@node first

@xref{first,
}@quotation
quotation in ref
@end quotation
.
';


$result_texts{'quotation_in_ref'} = '
firstquotation in ref
.
';

$result_errors{'quotation_in_ref'} = '* E l3|@xref missing closing brace
 @xref missing closing brace

* E l7|misplaced }
 misplaced }

';

$result_nodes_list{'quotation_in_ref'} = '1|first
';

$result_sections_list{'quotation_in_ref'} = '';

$result_sectioning_root{'quotation_in_ref'} = '';

$result_headings_list{'quotation_in_ref'} = '';

1;
