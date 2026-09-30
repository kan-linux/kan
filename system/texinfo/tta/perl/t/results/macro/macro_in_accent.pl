use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_accent'} = '*document_root C1
 *before_node_section C7
  *@macro C3 l1
  |EXTRA
  |macro_name:{aletter}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: aletter\\n}
   {raw:a\\n}
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
  *@macro C3 l5
  |EXTRA
  |macro_name:{aspace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: aspace\\n}
   {raw:  \\n}
   *@end C1 l7
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
  *paragraph C8
   *@ringaccent C1 l9
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>macro_expansion<start;1><p:1>
     |>*macro_call@aletter C1
      |>*brace_arg
   >SOURCEMARKS
   >macro_expansion<end;1>
    *following_arg C1
     {a}
   {.\\n}
   *@ringaccent C1 l10
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>macro_expansion<start;2>
     |>*macro_call@aletter C1
      |>*brace_arg
   >SOURCEMARKS
   >macro_expansion<end;2>
    *following_arg C1
     {a}
   {.\\n}
   *@~ C1 l11
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>macro_expansion<start;3>
     |>*macro_call@aletter C1
      |>*brace_arg
   >SOURCEMARKS
   >macro_expansion<end;3>
    *following_arg C1
     {a}
   {.\\n}
   *@~ C1 l12
    *brace_container C1
     {a}
     >SOURCEMARKS
     >macro_expansion<start;4>
      >*macro_call@aletter C1
       >*brace_arg
     >macro_expansion<end;4><p:1>
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C1 l14
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:  }
    |>SOURCEMARKS
    |>macro_expansion<start;5>
     |>*macro_call@aspace C1
      |>*brace_arg
    |>macro_expansion<end;5><p:2>
    |>macro_expansion<start;6><p:2>
     |>*macro_call@aletter C1
      |>*brace_arg
   >SOURCEMARKS
   >macro_expansion<end;6>
    *following_arg C1
     {a}
   {.\\n}
';


$result_texis{'macro_in_accent'} = '@macro aletter
a
@end macro

@macro aspace
  
@end macro

@ringaccent a.
@ringaccenta.
@~a.
@~{a}.

@ringaccent  a.
';


$result_texts{'macro_in_accent'} = '

a*.
a*.
a~.
a~.

a*.
';

$result_errors{'macro_in_accent'} = '';

$result_nodes_list{'macro_in_accent'} = '';

$result_sections_list{'macro_in_accent'} = '';

$result_sectioning_root{'macro_in_accent'} = '';

$result_headings_list{'macro_in_accent'} = '';

1;
