use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_not_closed'} = '*document_root C1
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
     >{macro_call_arg_text:@verb{: in verb\\n\\n}
  *paragraph C1
   *@verb C1 l6:@mycommand
   |INFO
   |delimiter:{:}
    *brace_container C3
     {raw: in verb\\n}
     {raw:\\n}
     {raw:,  }
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:3>
';


$result_texis{'verb_not_closed'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@verb{: in verb

,  :}';


$result_texts{'verb_not_closed'} = '
 in verb

,  ';

$result_errors{'verb_not_closed'} = '* E l6|@mycommand missing closing brace
 @mycommand missing closing brace

* E l6:@mycommand|@verb missing closing delimiter sequence: :}
 @verb missing closing delimiter sequence: :} (possibly involving @mycommand)

';

$result_nodes_list{'verb_not_closed'} = '';

$result_sections_list{'verb_not_closed'} = '';

$result_sectioning_root{'verb_not_closed'} = '';

$result_headings_list{'verb_not_closed'} = '';

1;
