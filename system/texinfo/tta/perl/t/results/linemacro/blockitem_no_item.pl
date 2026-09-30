use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'blockitem_no_item'} = '*document_root C1
 *before_node_section C3
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{mycommand}
  |misc_args:A{a|b|c}
   *arguments_line C1
    {macro_line: mycommand {a, b, c}\\n}
   {raw:\\a\\, \\b\\ \\c\\\\n}
   *@end C1 l3
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
  *@itemize C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *before_item C1
    *paragraph C3
     {AA\\n}
     {d, e f }
     >SOURCEMARKS
     >linemacro_expansion<start;1>
      >*linemacro_call@mycommand C3
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >*linemacro_arg C1
        >{macro_call_arg_text:d}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{macro_call_arg_text:e}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{macro_call_arg_text:f @\\n@end itemize}
     *@\\n
   *@end C1 l8:@mycommand
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:7>
';


$result_texis{'blockitem_no_item'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@itemize
AA
d, e f @
@end itemize
';


$result_texts{'blockitem_no_item'} = '
AA
d, e f  ';

$result_errors{'blockitem_no_item'} = '* W l5|@itemize has text but no @item
 warning: @itemize has text but no @item

';

$result_nodes_list{'blockitem_no_item'} = '';

$result_sections_list{'blockitem_no_item'} = '';

$result_sectioning_root{'blockitem_no_item'} = '';

$result_headings_list{'blockitem_no_item'} = '';

1;
