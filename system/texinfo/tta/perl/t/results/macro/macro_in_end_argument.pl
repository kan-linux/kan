use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_end_argument'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{acartouche}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: acartouche\\n}
   {raw:cartouche\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@cartouche C2 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    |>SOURCEMARKS
    |>macro_expansion<start;1><p:1>
     |>*macro_call@acartouche C1
      |>*brace_arg
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
     >SOURCEMARKS
     >macro_expansion<end;1><p:9>
';


$result_texis{'macro_in_end_argument'} = '@macro acartouche
cartouche
@end macro

@cartouche
@end cartouche
';


$result_texts{'macro_in_end_argument'} = '
';

$result_errors{'macro_in_end_argument'} = '';

$result_nodes_list{'macro_in_end_argument'} = '';

$result_sections_list{'macro_in_end_argument'} = '';

$result_sectioning_root{'macro_in_end_argument'} = '';

$result_headings_list{'macro_in_end_argument'} = '';

1;
