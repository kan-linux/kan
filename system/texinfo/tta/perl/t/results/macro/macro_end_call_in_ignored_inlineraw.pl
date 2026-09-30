use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_end_call_in_ignored_inlineraw'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{startraw}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: startraw\\n}
   {raw:Para @inlineraw{tex, in@something\\n}
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
   {Para }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@startraw C1
     >*brace_arg
   *@inlineraw C2 l5:@startraw
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw: in@something\\nstill ignored}
     >SOURCEMARKS
     >macro_expansion<end;1><p:13>
   {. After.\\n}
';


$result_texis{'macro_end_call_in_ignored_inlineraw'} = '@macro startraw
Para @inlineraw{tex, in@something
@end macro

Para @inlineraw{tex, in@something
still ignored}. After.
';


$result_texts{'macro_end_call_in_ignored_inlineraw'} = '
Para . After.
';

$result_errors{'macro_end_call_in_ignored_inlineraw'} = '';

$result_nodes_list{'macro_end_call_in_ignored_inlineraw'} = '';

$result_sections_list{'macro_end_call_in_ignored_inlineraw'} = '';

$result_sectioning_root{'macro_end_call_in_ignored_inlineraw'} = '';

$result_headings_list{'macro_end_call_in_ignored_inlineraw'} = '';

1;
