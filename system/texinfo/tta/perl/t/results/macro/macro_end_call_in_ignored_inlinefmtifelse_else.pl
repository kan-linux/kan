use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{endcallinignoredinlineelse}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: endcallinignoredinlineelse\\n}
   {raw:own, ignored\\n}
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
  *paragraph C3
   {Toto }
   *@inlinefmtifelse C3 l5
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {before shown}
     >SOURCEMARKS
     >macro_expansion<start;1><p:9>
      >*macro_call@endcallinignoredinlineelse C1
       >*brace_arg
    *elided_brace_command_arg C1
     {raw: ignored after}
     >SOURCEMARKS
     >macro_expansion<end;1><p:8>
   { done.\\n}
';


$result_texis{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '@macro endcallinignoredinlineelse
own, ignored
@end macro

Toto @inlinefmtifelse{html, before shown, ignored after} done.
';


$result_texts{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '
Toto before shown done.
';

$result_errors{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_nodes_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_sections_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_sectioning_root{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_headings_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

1;
