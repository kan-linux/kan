use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'user_defined_txiinternalvalue'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{txiinternalvalue}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: txiinternalvalue\\n}
   {raw:user internalvalue\\n}
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
  *paragraph C1
   {user internalvalue\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@txiinternalvalue
   >macro_expansion<end;1><p:18>
';


$result_texis{'user_defined_txiinternalvalue'} = '@macro txiinternalvalue
user internalvalue
@end macro

user internalvalue
';


$result_texts{'user_defined_txiinternalvalue'} = '
user internalvalue
';

$result_errors{'user_defined_txiinternalvalue'} = '';

$result_nodes_list{'user_defined_txiinternalvalue'} = '';

$result_sections_list{'user_defined_txiinternalvalue'} = '';

$result_sectioning_root{'user_defined_txiinternalvalue'} = '';

$result_headings_list{'user_defined_txiinternalvalue'} = '';

1;
