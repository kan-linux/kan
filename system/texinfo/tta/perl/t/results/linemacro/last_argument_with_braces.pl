use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'last_argument_with_braces'} = '*document_root C1
 *before_node_section C3
  *@linemacro C4 l1
  |EXTRA
  |macro_name:{defbuiltin}
  |misc_args:A{symbol|rest}
   *arguments_line C1
    {macro_line: defbuiltin {symbol, rest}\\n}
   {raw:@defline \\symbol\\ f r\\n}
   {raw:@defline expand Builtin and \\rest\\\\n}
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
  *@defblock C10 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@defbuiltin C2
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{macro_call_arg_text:a last {} arg{ument}}
   *@defline C1 l7:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo}
   |original_def_cmdname:{defline}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {r}
   *@defline C1 l7:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{Builtin}
   |original_def_cmdname:{defline}
    *line_arg C14
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces: }
     *def_arg C1
      *bracketed_arg l7:@defbuiltin
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     *def_arg C1
      *bracketed_arg C1 l7:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;1>
       {ument}
   *def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;2><p:1>
     >*linemacro_call@defbuiltin C2
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{macro_call_arg_text:{} {}}
   *@defline C1 l9:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo}
   |original_def_cmdname:{defline}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {r}
   *@defline C1 l9:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{Builtin}
   |original_def_cmdname:{defline}
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg l9:@defbuiltin
     {spaces: }
     *def_arg C1
      *bracketed_arg l9:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;2>
   *def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;3><p:1>
     >*linemacro_call@defbuiltin C2
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{macro_call_arg_text:{second arg} remaining on {line}}
   *@defline C1 l11:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo}
   |original_def_cmdname:{defline}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {r}
   *@defline C1 l11:@defbuiltin
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{Builtin}
   |original_def_cmdname:{defline}
    *line_arg C13
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l11:@defbuiltin
       {second arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {remaining}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {on}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l11:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;3>
       {line}
   *@end C1 l12
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


$result_texis{'last_argument_with_braces'} = '@linemacro defbuiltin {symbol, rest}
@defline \\symbol\\ f r
@defline expand Builtin and \\rest\\
@end linemacro

@defblock
@defline my foo f r
@defline expand Builtin and a last {} arg{ument}

@defline my foo f r
@defline expand Builtin and {} {}

@defline my foo f r
@defline expand Builtin and {second arg} remaining on {line}
@end defblock
';


$result_texts{'last_argument_with_braces'} = '
my: foo f r
expand: Builtin and a last  argument

my: foo f r
expand: Builtin and  

my: foo f r
expand: Builtin and second arg remaining on line
';

$result_errors{'last_argument_with_braces'} = '';

$result_nodes_list{'last_argument_with_braces'} = '';

$result_sections_list{'last_argument_with_braces'} = '';

$result_sectioning_root{'last_argument_with_braces'} = '';

$result_headings_list{'last_argument_with_braces'} = '';

1;
