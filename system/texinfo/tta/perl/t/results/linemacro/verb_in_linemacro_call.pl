use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_in_linemacro_call'} = '*document_root C1
 *before_node_section C3
  *@linemacro C6 l1
  |EXTRA
  |macro_name:{mycommand}
  |misc_args:A{a|b|c|d}
   *arguments_line C1
    {macro_line: mycommand {a, b, c, d}\\n}
   {raw:first \\a\\\\n}
   {raw:second \\b\\\\n}
   {raw:third \\c\\\\n}
   {raw:@defline \\a\\ \\d\\\\n}
   *@end C1 l6
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
  *@defblock C4 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *before_defline C1
    *paragraph C7
     {first Name\\n}
     >SOURCEMARKS
     >linemacro_expansion<start;1>
      >*linemacro_call@mycommand C4
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >*linemacro_arg C1
        >{bracketed_linemacro_arg:Name}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{macro_call_arg_text:@verb{: in verb :}}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{bracketed_linemacro_arg:A @verb{| in bracketed |} }
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{macro_call_arg_text:other {j}}
     {second }
     *@verb C1 l9:@mycommand
     |INFO
     |delimiter:{:}
      *brace_container C1
       {raw: in verb }
     {\\n}
     {third A }
     *@verb C1 l9:@mycommand
     |INFO
     |delimiter:{|}
      *brace_container C1
       {raw: in bracketed }
     { \\n}
   *@defline C1 l9:@mycommand
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{other}
   |original_def_cmdname:{defline}
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Name}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {other}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9:@mycommand
      >SOURCEMARKS
      >linemacro_expansion<end;1>
       {j}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defblock}
';


$result_texis{'verb_in_linemacro_call'} = '@linemacro mycommand {a, b, c, d}
first \\a\\
second \\b\\
third \\c\\
@defline \\a\\ \\d\\
@end linemacro

@defblock
first Name
second @verb{: in verb :}
third A @verb{| in bracketed |} 
@defline Name other {j}
@end defblock
';


$result_texts{'verb_in_linemacro_call'} = '
first Name
second  in verb 
third A  in bracketed  
Name: other j
';

$result_errors{'verb_in_linemacro_call'} = '';

$result_nodes_list{'verb_in_linemacro_call'} = '';

$result_sections_list{'verb_in_linemacro_call'} = '';

$result_sectioning_root{'verb_in_linemacro_call'} = '';

$result_headings_list{'verb_in_linemacro_call'} = '';

1;
