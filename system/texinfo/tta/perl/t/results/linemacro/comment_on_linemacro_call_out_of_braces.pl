use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_on_linemacro_call_out_of_braces'} = '*document_root C1
 *before_node_section C7
  *@linemacro C5 l1
  |EXTRA
  |macro_name:{lm}
  |misc_args:A{a|b|c}
   *arguments_line C1
    {macro_line: lm {a, b, c}\\n}
   {raw:first |\\a\\|\\n}
   {raw:second |\\b\\|\\n}
   {raw:third |\\c\\|\\n}
   *@end C1 l5
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
   {first |something protected|\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C2
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*linemacro_arg C1
      >{bracketed_linemacro_arg:something protected}
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:}
   {second ||\\n}
   {third ||}
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:8>
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:comment {in braces}}
  {empty_line:\\n}
  *paragraph C4
   {first ||\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;2>
    >*linemacro_call@lm C1
     >*linemacro_arg C1
      >{macro_call_arg_text:}
   {second ||\\n}
   {third ||}
   >SOURCEMARKS
   >linemacro_expansion<end;2><p:8>
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:comment early n l m}
  {empty_line:\\n}
  *paragraph C5
   {first |aaa\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;3>
    >*linemacro_call@lm C3
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*linemacro_arg C1
      >{bracketed_linemacro_arg:aaa\\n  }
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:rest}
     >*linemacro_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:}
   {  |\\n}
   {second |rest|\\n}
   {third ||}
   >SOURCEMARKS
   >linemacro_expansion<end;3><p:8>
   *@comment C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:on second {line comment}}
';


$result_texis{'comment_on_linemacro_call_out_of_braces'} = '@linemacro lm {a, b, c}
first |\\a\\|
second |\\b\\|
third |\\c\\|
@end linemacro

first |something protected|
second ||
third ||@c comment {in braces}

first ||
second ||
third ||@c comment early n l m

first |aaa
  |
second |rest|
third ||@comment on second {line comment}
';


$result_texts{'comment_on_linemacro_call_out_of_braces'} = '
first |something protected|
second ||
third ||
first ||
second ||
third ||
first |aaa
  |
second |rest|
third ||';

$result_errors{'comment_on_linemacro_call_out_of_braces'} = '';

$result_nodes_list{'comment_on_linemacro_call_out_of_braces'} = '';

$result_sections_list{'comment_on_linemacro_call_out_of_braces'} = '';

$result_sectioning_root{'comment_on_linemacro_call_out_of_braces'} = '';

$result_headings_list{'comment_on_linemacro_call_out_of_braces'} = '';

1;
