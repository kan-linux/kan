use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'value_on_ifset'} = '*document_root C1
 *before_node_section C5
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{xval|x}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:xval x}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{x|1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:x 1}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifset C1 l4
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >|>SOURCEMARKS
    >|>value_expansion<start;1><p:1>{x}
     >|>*@value C1
      >|>*brace_container C1
       >|>{xval}
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{x}
      >>SOURCEMARKS
      >>value_expansion<end;1><p:1>
  *paragraph C1
   {XVAL SET\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:9>
    >*@end C1 l6
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifset C5 l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{b}
    >{raw:@ifset @value{xval}\\n}
    >{raw:INTERNALXV\\n}
    >{raw:@end ifset\\n}
    >*@end C1 l12
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
';


$result_texis{'value_on_ifset'} = '@set xval x
@set x 1

XVAL SET

';


$result_texts{'value_on_ifset'} = '
XVAL SET

';

$result_errors{'value_on_ifset'} = '';

$result_nodes_list{'value_on_ifset'} = '';

$result_sections_list{'value_on_ifset'} = '';

$result_sectioning_root{'value_on_ifset'} = '';

$result_headings_list{'value_on_ifset'} = '';

1;
