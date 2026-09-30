use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'text_before_after'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   {before }
   *@macro C3 l1
   |EXTRA
   |macro_name:{mymacro}
   |misc_args:A{}
    *arguments_line C1
     {macro_line: mymacro\\n}
    {raw:in macro\\n}
    *@end C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{macro after}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {macro after}
';


$result_texis{'text_before_after'} = 'before @macro mymacro
in macro
@end macro after
';


$result_texts{'text_before_after'} = 'before ';

$result_errors{'text_before_after'} = '* W l1|@macro should only appear at the beginning of a line
 warning: @macro should only appear at the beginning of a line

* E l3|bad argument to @end: macro after
 bad argument to @end: macro after

';

$result_nodes_list{'text_before_after'} = '';

$result_sections_list{'text_before_after'} = '';

$result_sectioning_root{'text_before_after'} = '';

$result_headings_list{'text_before_after'} = '';

1;
