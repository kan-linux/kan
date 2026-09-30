use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_inlineifcond_end_in_empty_ignored'} = '*document_root C1
 *before_node_section C4
  *@macro C3 l1
  |EXTRA
  |macro_name:{setargendignored}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: setargendignored\\n}
   {raw:ag,\\n}
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
  *paragraph C3
   {Toto }
   *@inlineifset C2 l4
   |EXTRA
   |format:{flag}
    *brace_arg C1
     {flag}
     >SOURCEMARKS
     >macro_expansion<start;1><p:2>
      >*macro_call@setargendignored C1
       >*brace_arg
    *elided_brace_command_arg C1
     {raw:}
     >SOURCEMARKS
     >macro_expansion<end;1>
   {. After.\\n}
  {empty_line:\\n}
  *paragraph C3
   {Again with space }
   *@inlineifset C2 l6
   |EXTRA
   |format:{flag}
    *brace_arg C1
     {flag}
     >SOURCEMARKS
     >macro_expansion<start;2><p:2>
      >*macro_call@setargendignored C1
       >*brace_arg
    *elided_brace_command_arg C1
     {raw: }
     >SOURCEMARKS
     >macro_expansion<end;2>
   {. After.\\n}
';


$result_texis{'macro_inlineifcond_end_in_empty_ignored'} = '@macro setargendignored
ag,
@end macro
Toto @inlineifset{flag,}. After.

Again with space @inlineifset{flag, }. After.
';


$result_texts{'macro_inlineifcond_end_in_empty_ignored'} = 'Toto . After.

Again with space . After.
';

$result_errors{'macro_inlineifcond_end_in_empty_ignored'} = '';

$result_nodes_list{'macro_inlineifcond_end_in_empty_ignored'} = '';

$result_sections_list{'macro_inlineifcond_end_in_empty_ignored'} = '';

$result_sectioning_root{'macro_inlineifcond_end_in_empty_ignored'} = '';

$result_headings_list{'macro_inlineifcond_end_in_empty_ignored'} = '';

1;
