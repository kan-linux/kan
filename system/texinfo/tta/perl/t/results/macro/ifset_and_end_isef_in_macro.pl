use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifset_and_end_isef_in_macro'} = '*document_root C1
 *before_node_section C4
  *@macro C3 l1
  |EXTRA
  |macro_name:{beginifset}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: beginifset {}\\n}
   {raw:@ifset a\\n}
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
  *@macro C3 l5
  |EXTRA
  |macro_name:{endifset}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: endifset {}\\n}
   {raw:@end ifset\\n}
   *@end C1 l7
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@beginifset
  >ignored_conditional_block<1><p:1>
   >*@ifset C3 l9:@beginifset
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
      >>SOURCEMARKS
      >>macro_expansion<end;1><p:1>
    >{raw:in ifset\\n}
    >{raw:@endifset\\n}
';


$result_texis{'ifset_and_end_isef_in_macro'} = '@macro beginifset {}
@ifset a
@end macro

@macro endifset {}
@end ifset
@end macro

';


$result_texts{'ifset_and_end_isef_in_macro'} = '

';

$result_errors{'ifset_and_end_isef_in_macro'} = '* E l9:@beginifset|no matching `@end ifset\'
 no matching `@end ifset\' (possibly involving @beginifset)

';

$result_nodes_list{'ifset_and_end_isef_in_macro'} = '';

$result_sections_list{'ifset_and_end_isef_in_macro'} = '';

$result_sectioning_root{'ifset_and_end_isef_in_macro'} = '';

$result_headings_list{'ifset_and_end_isef_in_macro'} = '';

1;
