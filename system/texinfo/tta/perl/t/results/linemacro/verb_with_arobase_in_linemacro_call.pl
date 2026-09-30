use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_with_arobase_in_linemacro_call'} = '*document_root C1
 *before_node_section C3
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{mycommand}
  |misc_args:A{a|b|c}
   *arguments_line C1
    {macro_line: mycommand {a, b, c}\\n}
   {raw:\\a\\, \\b\\ \\c\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;1><p:1>
   >*linemacro_call@mycommand C1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{macro_call_arg_text:@verb{@ in verb @} and next\\n}
  *paragraph C3
   *@verb C1 l5:@mycommand
   |INFO
   |delimiter:{@}
    *brace_container C1
     {raw: in verb }
   { and next\\n}
   {,  }
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:3>
';


$result_texis{'verb_with_arobase_in_linemacro_call'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@verb{@ in verb @} and next
,  ';


$result_texts{'verb_with_arobase_in_linemacro_call'} = '
 in verb  and next
,  ';

$result_errors{'verb_with_arobase_in_linemacro_call'} = '* E l5|@mycommand missing closing brace
 @mycommand missing closing brace

';

$result_nodes_list{'verb_with_arobase_in_linemacro_call'} = '';

$result_sections_list{'verb_with_arobase_in_linemacro_call'} = '';

$result_sectioning_root{'verb_with_arobase_in_linemacro_call'} = '';

$result_headings_list{'verb_with_arobase_in_linemacro_call'} = '';

1;
