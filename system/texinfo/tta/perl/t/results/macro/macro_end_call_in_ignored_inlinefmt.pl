use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_end_call_in_ignored_inlinefmt'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{startfmt}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: startfmt\\n}
   {raw:Para @inlinefmt{tex, inT\\n}
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
    >*macro_call@startfmt C1
     >*brace_arg
   *@inlinefmt C2 l5:@startfmt
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw: inT\\nstill ignored}
     >SOURCEMARKS
     >macro_expansion<end;1><p:4>
   {. After.\\n}
';


$result_texis{'macro_end_call_in_ignored_inlinefmt'} = '@macro startfmt
Para @inlinefmt{tex, inT
@end macro

Para @inlinefmt{tex, inT
still ignored}. After.
';


$result_texts{'macro_end_call_in_ignored_inlinefmt'} = '
Para . After.
';

$result_errors{'macro_end_call_in_ignored_inlinefmt'} = '';

$result_nodes_list{'macro_end_call_in_ignored_inlinefmt'} = '';

$result_sections_list{'macro_end_call_in_ignored_inlinefmt'} = '';

$result_sectioning_root{'macro_end_call_in_ignored_inlinefmt'} = '';

$result_headings_list{'macro_end_call_in_ignored_inlinefmt'} = '';

1;
