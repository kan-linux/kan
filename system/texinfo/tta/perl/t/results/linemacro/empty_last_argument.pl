use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_last_argument'} = '*document_root C1
 *before_node_section C4
  *@defcodeindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{BI}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {BI}
  *@linemacro C4 l2
  |EXTRA
  |macro_name:{defbuiltin}
  |misc_args:A{symbol|rest}
   *arguments_line C1
    {macro_line: defbuiltin {symbol, rest}\\n}
   {raw:@BIindex \\symbol\\\\n}
   {raw:@defline Builtin \\symbol\\ \\rest\\\\n}
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
  *@defblock C8 l7
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
       >{macro_call_arg_text:foo}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{bracketed_linemacro_arg:}
   *before_defline C1
    *index_entry_command@BIindex C1 l8:@defbuiltin
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{BI,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {foo}
   *@defline C1 l8:@defbuiltin
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
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     |>SOURCEMARKS
     |>linemacro_expansion<end;1><p:1>
     *def_category C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
   *def_item C2
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;2><p:1>
     >*linemacro_call@defbuiltin C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{macro_call_arg_text:foo}
    *index_entry_command@BIindex C1 l10:@defbuiltin
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{BI,2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {foo}
   *@defline C1 l10:@defbuiltin
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
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     |>SOURCEMARKS
     |>linemacro_expansion<end;2><p:1>
     *def_category C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
   *def_item C2
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;3><p:1>
     >*linemacro_call@defbuiltin C2
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{macro_call_arg_text:foo}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{bracketed_linemacro_arg:{}}
    *index_entry_command@BIindex C1 l12:@defbuiltin
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{BI,3}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {foo}
   *@defline C1 l12:@defbuiltin
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
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     *def_arg C1
      *bracketed_arg l12:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;3>
   *@end C1 l13
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


$result_texis{'empty_last_argument'} = '@defcodeindex BI
@linemacro defbuiltin {symbol, rest}
@BIindex \\symbol\\
@defline Builtin \\symbol\\ \\rest\\
@end linemacro

@defblock
@BIindex foo
@defline Builtin foo 

@BIindex foo
@defline Builtin foo 

@BIindex foo
@defline Builtin foo {}
@end defblock
';


$result_texts{'empty_last_argument'} = '
Builtin: foo

Builtin: foo

Builtin: foo 
';

$result_errors{'empty_last_argument'} = '* W l8:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

* W l10:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

* W l12:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

';

$result_indices{'empty_last_argument'} = 'BI C
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'empty_last_argument'} = '';

$result_sections_list{'empty_last_argument'} = '';

$result_sectioning_root{'empty_last_argument'} = '';

$result_headings_list{'empty_last_argument'} = '';

$result_indices_sort_strings{'empty_last_argument'} = 'BI:
 foo
 foo
 foo
';

1;
