use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_call_in_macro'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{anorecurse}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: anorecurse{arg}\\n}
   {raw:@anorecurse{arg}\\n}
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
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call@anorecurse C1
    >*brace_arg
  >macro_expansion<2>
   >*macro_call@anorecurse C1
    >*brace_arg C1
     >{macro_call_arg_text:arg}
  >macro_expansion<end;1>
';


$result_texis{'recursive_call_in_macro'} = '@macro anorecurse{arg}
@anorecurse{arg}
@end macro


';


$result_texts{'recursive_call_in_macro'} = '

';

$result_errors{'recursive_call_in_macro'} = '* E l5:@anorecurse|recursive call of macro anorecurse is not allowed; use @rmacro if needed
 recursive call of macro anorecurse is not allowed; use @rmacro if needed (possibly involving @anorecurse)

';

$result_nodes_list{'recursive_call_in_macro'} = '';

$result_sections_list{'recursive_call_in_macro'} = '';

$result_sectioning_root{'recursive_call_in_macro'} = '';

$result_headings_list{'recursive_call_in_macro'} = '';

1;
