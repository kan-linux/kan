use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'newline_and_continuation_in_brace'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@linemacro C3 l2
  |EXTRA
  |macro_name:{mylinecommand}
  |misc_args:A{first|second|rest}
   *arguments_line C1
    {macro_line: mylinecommand {first, second, rest}\\n}
   {raw:@defline category \\first\\ \\second\\ \\rest\\\\n}
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
  *@defblock C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@mylinecommand C3
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{macro_call_arg_text:a@code{b c}d}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{bracketed_linemacro_arg:some arg @\\n   b}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{macro_call_arg_text:{next @\\n   last} line}
   *@defline C1 l9:@mylinecommand
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C3
      |{a}
      |*@code C1
       |*brace_container C1
        |{b c}
      |{d}
   |original_def_cmdname:{defline}
    *line_arg C13
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {category}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       {a}
       *@code C1 l9:@mylinecommand
        *brace_container C1
         {b c}
       {d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {some}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9:@mylinecommand
       {next    last}
       >SOURCEMARKS
       >defline_continuation<2><p:5>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {line}
       >SOURCEMARKS
       >linemacro_expansion<end;1><p:4>
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


$result_texis{'newline_and_continuation_in_brace'} = '
@linemacro mylinecommand {first, second, rest}
@defline category \\first\\ \\second\\ \\rest\\
@end linemacro

@defblock
@defline category a@code{b c}d some arg    b {next    last} line
@end defblock
';


$result_texts{'newline_and_continuation_in_brace'} = '

category: ab cd some arg    b next    last line
';

$result_errors{'newline_and_continuation_in_brace'} = '';

$result_nodes_list{'newline_and_continuation_in_brace'} = '';

$result_sections_list{'newline_and_continuation_in_brace'} = '';

$result_sectioning_root{'newline_and_continuation_in_brace'} = '';

$result_headings_list{'newline_and_continuation_in_brace'} = '';

1;
