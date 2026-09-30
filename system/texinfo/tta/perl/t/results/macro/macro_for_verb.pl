use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_for_verb'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{verbopen}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: verbopen {}\\n}
   {raw:@verb{\\n}
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@verbopen C1
    >*brace_arg
  *paragraph C2
   *@verb C1 l5:@verbopen
   |INFO
   |delimiter:{@}
    *brace_container C4
     {}
     >SOURCEMARKS
     >macro_expansion<end;1>
     {raw: some text\\n}
     {raw:\\n}
     {raw:@code\\n}
   {\\n}
';


$result_texis{'macro_for_verb'} = '@macro verbopen {}
@verb{
@end macro

@verb{@ some text

@code
@}
';


$result_texts{'macro_for_verb'} = '
 some text

@code

';

$result_errors{'macro_for_verb'} = '';

$result_nodes_list{'macro_for_verb'} = '';

$result_sections_list{'macro_for_verb'} = '';

$result_sectioning_root{'macro_for_verb'} = '';

$result_headings_list{'macro_for_verb'} = '';

1;
