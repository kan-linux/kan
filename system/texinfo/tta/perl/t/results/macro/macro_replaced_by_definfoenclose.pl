use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_replaced_by_definfoenclose'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{phoo}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: phoo {arg}\\n}
   {raw:||\\arg\\||\\n}
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
  {empty_line:\\n}
  *@definfoenclose C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{phoo|;|:}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {phoo,;,:}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l7
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {aa}
   {\\n}
';


$result_texis{'macro_replaced_by_definfoenclose'} = '@macro phoo {arg}
||\\arg\\||
@end macro

@definfoenclose phoo,;,:

@phoo{aa}
';


$result_texts{'macro_replaced_by_definfoenclose'} = '

aa
';

$result_errors{'macro_replaced_by_definfoenclose'} = '* W l5|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'macro_replaced_by_definfoenclose'} = '';

$result_sections_list{'macro_replaced_by_definfoenclose'} = '';

$result_sectioning_root{'macro_replaced_by_definfoenclose'} = '';

$result_headings_list{'macro_replaced_by_definfoenclose'} = '';


$result_converted{'plaintext'}->{'macro_replaced_by_definfoenclose'} = ';aa:
';

1;
