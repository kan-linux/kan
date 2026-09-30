use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_call_empty_middle_arg'} = '*document_root C1
 *before_node_section C7
  *@macro C5 l1
  |EXTRA
  |macro_name:{threea}
  |misc_args:A{aa|bb|cc}
   *arguments_line C1
    {macro_line: threea {aa, bb, cc}\\n}
   {raw:first \\aa\\,\\n}
   {raw:second \\bb\\,\\n}
   {raw:third \\cc\\,\\n}
   *@end C1 l5
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
  *paragraph C3
   {first j,\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@threea C3
     >*brace_arg C1
      >{macro_call_arg_text:j}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:k}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:l}
   {second k,\\n}
   {third l,\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:8>
  {empty_line:\\n}
  *paragraph C3
   {first m,\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@threea C3
     >*brace_arg C1
      >{macro_call_arg_text:m}
     >*brace_arg
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:n}
   {second ,\\n}
   {third n,\\n}
   >SOURCEMARKS
   >macro_expansion<end;2><p:8>
  {empty_line:\\n}
  *paragraph C3
   {first o,\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@threea C3
     >*brace_arg C1
      >{macro_call_arg_text:o}
     >*brace_arg
     >*brace_arg C1
      >{macro_call_arg_text:p}
   {second ,\\n}
   {third p,\\n}
   >SOURCEMARKS
   >macro_expansion<end;3><p:8>
';


$result_texis{'macro_call_empty_middle_arg'} = '@macro threea {aa, bb, cc}
first \\aa\\,
second \\bb\\,
third \\cc\\,
@end macro

first j,
second k,
third l,

first m,
second ,
third n,

first o,
second ,
third p,
';


$result_texts{'macro_call_empty_middle_arg'} = '
first j,
second k,
third l,

first m,
second ,
third n,

first o,
second ,
third p,
';

$result_errors{'macro_call_empty_middle_arg'} = '';

$result_nodes_list{'macro_call_empty_middle_arg'} = '';

$result_sections_list{'macro_call_empty_middle_arg'} = '';

$result_sectioning_root{'macro_call_empty_middle_arg'} = '';

$result_headings_list{'macro_call_empty_middle_arg'} = '';

1;
