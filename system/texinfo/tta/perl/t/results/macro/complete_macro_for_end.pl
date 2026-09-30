use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'complete_macro_for_end'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{theend}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: theend\\n}
   {raw:@end cartouche\\n}
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
     >*macro_call@theend C1
      >*brace_arg
   *@end C1 l6:@theend
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
     {cartouche}
     >SOURCEMARKS
     >macro_expansion<end;1><p:9>
';


$result_texis{'complete_macro_for_end'} = '@macro theend
@end cartouche
@end macro

@cartouche
@end cartouche';


$result_texts{'complete_macro_for_end'} = '
';

$result_errors{'complete_macro_for_end'} = '';

$result_nodes_list{'complete_macro_for_end'} = '';

$result_sections_list{'complete_macro_for_end'} = '';

$result_sectioning_root{'complete_macro_for_end'} = '';

$result_headings_list{'complete_macro_for_end'} = '';

1;
