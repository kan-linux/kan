use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'too_much_args'} = '*document_root C1
 *before_node_section C3
  *@macro C4 l1
  |EXTRA
  |macro_name:{twoargs}
  |misc_args:A{first|second}
   *arguments_line C1
    {macro_line: twoargs {first, second}\\n}
   {raw:first arg: \\first\\\\n}
   {raw:second arg: \\second\\\\n}
   *@end C1 l4
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
  *paragraph C2
   {first arg: one\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@twoargs C2
     >*brace_arg C1
      >{macro_call_arg_text:one}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:two, three}
   {second arg: two, three.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:22>
';


$result_texis{'too_much_args'} = '@macro twoargs {first, second}
first arg: \\first\\
second arg: \\second\\
@end macro

first arg: one
second arg: two, three.
';


$result_texts{'too_much_args'} = '
first arg: one
second arg: two, three.
';

$result_errors{'too_much_args'} = '* E l6|macro `twoargs\' called with too many args
 macro `twoargs\' called with too many args

';

$result_nodes_list{'too_much_args'} = '';

$result_sections_list{'too_much_args'} = '';

$result_sectioning_root{'too_much_args'} = '';

$result_headings_list{'too_much_args'} = '';

1;
