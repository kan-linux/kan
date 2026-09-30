use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_in_linemacro_call'} = '*document_root C1
 *before_node_section C3
  *@linemacro C4 l1
  |EXTRA
  |macro_name:{lm}
  |misc_args:A{a|b}
   *arguments_line C1
    {macro_line: lm {a, b}\\n}
   {raw:c \\a\\ d\\n}
   {raw:\\b\\\\n}
   *@end C1 l4
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
  *paragraph C4
   {c }
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C2
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*linemacro_arg C1
      >{macro_call_arg_text:@code{\\nsomething @comment in}}
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:out}
   *@code C1 l7:@lm
    *brace_container C4
     {\\n}
     {something }
     *@comment C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:in} d}
     {out\\n}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:3>
   {\\n}
   {next\\n}
';


$result_texis{'comment_in_linemacro_call'} = '@linemacro lm {a, b}
c \\a\\ d
\\b\\
@end linemacro

c @code{
something @comment in} d
out
}
next
';


$result_texts{'comment_in_linemacro_call'} = '
c 
something out

next
';

$result_errors{'comment_in_linemacro_call'} = '';

$result_nodes_list{'comment_in_linemacro_call'} = '';

$result_sections_list{'comment_in_linemacro_call'} = '';

$result_sectioning_root{'comment_in_linemacro_call'} = '';

$result_headings_list{'comment_in_linemacro_call'} = '';

1;
