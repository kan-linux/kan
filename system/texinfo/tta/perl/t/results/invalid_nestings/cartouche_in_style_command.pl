use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cartouche_in_style_command'} = '*document_root C1
 *before_node_section C3
  *paragraph C1
   *@code C1 l1
    *brace_container C1
     {\\n}
  *@cartouche C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {cartouche\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
  {empty_line:\\n}
';


$result_texis{'cartouche_in_style_command'} = '@code{
}@cartouche
cartouche
@end cartouche

';


$result_texts{'cartouche_in_style_command'} = '
cartouche

';

$result_errors{'cartouche_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'cartouche_in_style_command'} = '';

$result_sections_list{'cartouche_in_style_command'} = '';

$result_sectioning_root{'cartouche_in_style_command'} = '';

$result_headings_list{'cartouche_in_style_command'} = '';

1;
