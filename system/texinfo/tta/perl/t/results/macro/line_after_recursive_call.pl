use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'line_after_recursive_call'} = '*document_root C1
 *before_node_section C2
  *@macro C5 l1
  |EXTRA
  |macro_name:{mac}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: mac\\n}
   {raw:ggg\\n}
   {raw:@mac xxx\\n}
   {raw:fff\\n}
   *@end C1 l5
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
   {ggg\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mac
   { xxx\\n}
   >SOURCEMARKS
   >macro_expansion<2>
    >*macro_call@mac
   {fff}
   >SOURCEMARKS
   >macro_expansion<end;1><p:3>
';


$result_texis{'line_after_recursive_call'} = '@macro mac
ggg
@mac xxx
fff
@end macro
ggg
 xxx
fff';


$result_texts{'line_after_recursive_call'} = 'ggg
 xxx
fff';

$result_errors{'line_after_recursive_call'} = '* E l6:@mac|recursive call of macro mac is not allowed; use @rmacro if needed
 recursive call of macro mac is not allowed; use @rmacro if needed (possibly involving @mac)

';

$result_nodes_list{'line_after_recursive_call'} = '';

$result_sections_list{'line_after_recursive_call'} = '';

$result_sectioning_root{'line_after_recursive_call'} = '';

$result_headings_list{'line_after_recursive_call'} = '';

1;
