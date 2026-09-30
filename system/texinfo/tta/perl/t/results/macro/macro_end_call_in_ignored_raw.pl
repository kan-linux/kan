use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_end_call_in_ignored_raw'} = '*document_root C1
 *before_node_section C3
  *@macro C4 l1
  |EXTRA
  |macro_name:{startraw}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: startraw\\n}
   {raw:@tex\\n}
   {raw:inT\\n}
   *@end C1 l4
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
   >*macro_call@startraw C1
    >*brace_arg
  *@tex C3 l6:@startraw
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *elided_rawpreformatted C2
    {raw:inT}
    >SOURCEMARKS
    >macro_expansion<end;1><p:3>
    {raw:\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
';


$result_texis{'macro_end_call_in_ignored_raw'} = '@macro startraw
@tex
inT
@end macro

@tex
inT
@end tex
';


$result_texts{'macro_end_call_in_ignored_raw'} = '
';

$result_errors{'macro_end_call_in_ignored_raw'} = '';

$result_nodes_list{'macro_end_call_in_ignored_raw'} = '';

$result_sections_list{'macro_end_call_in_ignored_raw'} = '';

$result_sectioning_root{'macro_end_call_in_ignored_raw'} = '';

$result_headings_list{'macro_end_call_in_ignored_raw'} = '';

1;
