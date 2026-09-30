use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_macrobody'} = '*document_root C1
 *before_node_section C5
  *@macro C2 l1
  |EXTRA
  |macro_name:{nomacrobody}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: nomacrobody {arg}\\n}
   *@end C1 l2
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
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call_line@nomacrobody C1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*line_arg C1
     >{line arg}
  >macro_expansion<end;1>
  {empty_line:\\n}
  *paragraph C1
   {.\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@nomacrobody C1
     >*brace_arg C1
      >{macro_call_arg_text:arg brace}
   >macro_expansion<end;2>
';


$result_texis{'no_macrobody'} = '@macro nomacrobody {arg}
@end macro



.
';


$result_texts{'no_macrobody'} = '


.
';

$result_errors{'no_macrobody'} = '';

$result_nodes_list{'no_macrobody'} = '';

$result_sections_list{'no_macrobody'} = '';

$result_sectioning_root{'no_macrobody'} = '';

$result_headings_list{'no_macrobody'} = '';

1;
