use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_for_end'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{myend}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: myend\\n}
   {raw:@end\\n}
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
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@myend C1
      >*brace_arg
   *@end C1 l6:@myend
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    |>SOURCEMARKS
    |>macro_expansion<end;1>
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
';


$result_texis{'macro_for_end'} = '@macro myend
@end
@end macro

@cartouche
@end cartouche
';


$result_texts{'macro_for_end'} = '
';

$result_errors{'macro_for_end'} = '';

$result_nodes_list{'macro_for_end'} = '';

$result_sections_list{'macro_for_end'} = '';

$result_sectioning_root{'macro_for_end'} = '';

$result_headings_list{'macro_for_end'} = '';

1;
