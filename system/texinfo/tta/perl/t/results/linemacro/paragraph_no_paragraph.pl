use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraph_no_paragraph'} = '*document_root C1
 *before_node_section C8
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
  *@*
  { }
  >SOURCEMARKS
  >linemacro_expansion<start;1><p:1>
   >*linemacro_call@mycommand C3
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{macro_call_arg_text:@anchor{aa}}
    >*linemacro_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >{macro_call_arg_text:definite}
    >*linemacro_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >{macro_call_arg_text:and @code{more}}
  *@anchor C1 l5:@mycommand
  |EXTRA
  |is_target:{1}
  |normalized:{aa}
   *brace_arg C1
    {aa}
  *paragraph C3
   {, definite and }
   *@code C1 l5:@mycommand
   >SOURCEMARKS
   >linemacro_expansion<end;1>
    *brace_container C1
     {more}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {Some text a\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;2><p:10>
    >*linemacro_call@mycommand C3
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*linemacro_arg C1
      >{bracketed_linemacro_arg:a\\n  protected}
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:in}
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@var{the\\n call}}
   {  protected, in }
   *@var C1 l9:@mycommand
   >SOURCEMARKS
   >linemacro_expansion<end;2>
    *brace_container C2
     {the\\n}
     { call}
   {\\n}
   {and after.\\n}
';


$result_texis{'paragraph_no_paragraph'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@* @anchor{aa}, definite and @code{more}

Some text a
  protected, in @var{the
 call}
and after.
';


$result_texts{'paragraph_no_paragraph'} = '

 , definite and more

Some text a
  protected, in the
 call
and after.
';

$result_errors{'paragraph_no_paragraph'} = '';

$result_nodes_list{'paragraph_no_paragraph'} = '';

$result_sections_list{'paragraph_no_paragraph'} = '';

$result_sectioning_root{'paragraph_no_paragraph'} = '';

$result_headings_list{'paragraph_no_paragraph'} = '';

1;
