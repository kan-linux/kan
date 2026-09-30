use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_invalid_documentencoding'} = '*document_root C1
 *before_node_section C2
  *@macro C3 l1
  |EXTRA
  |macro_name:{badmacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: badmacro\\n}
   {raw:badm\\n}
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
  *@documentencoding C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   |>SOURCEMARKS
   |>macro_expansion<start;1><p:1>
    |>*macro_call@badmacro C1
     |>*brace_arg
  |EXTRA
  |global_command_number:{1}
  |text_arg:{badm}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {badm}
    >SOURCEMARKS
    >macro_expansion<end;1><p:4>
';


$result_texis{'macro_in_invalid_documentencoding'} = '@macro badmacro
badm
@end macro
@documentencoding badm
';


$result_texts{'macro_in_invalid_documentencoding'} = '';

$result_errors{'macro_in_invalid_documentencoding'} = '* W l4|encoding `badm\' is not a canonical texinfo encoding
 warning: encoding `badm\' is not a canonical texinfo encoding

* W l4|unhandled encoding name `badm\'
 warning: unhandled encoding name `badm\'

';

$result_nodes_list{'macro_in_invalid_documentencoding'} = '';

$result_sections_list{'macro_in_invalid_documentencoding'} = '';

$result_sectioning_root{'macro_in_invalid_documentencoding'} = '';

$result_headings_list{'macro_in_invalid_documentencoding'} = '';

1;
