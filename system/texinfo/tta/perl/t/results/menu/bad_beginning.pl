use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_beginning'} = '*document_root C1
 *before_node_section C1
  *@menu C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C6
     {*   \\n}
     {*\\n}
     {*something::\\n}
     {*}
     *@code C1 l5
      *brace_container C1
       {in code}
     {::\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
     {menu}
';


$result_texis{'bad_beginning'} = '@menu
*   
*
*something::
*@code{in code}::
@end menu';


$result_texts{'bad_beginning'} = '*   
*
*something::
*in code::
';

$result_errors{'bad_beginning'} = '';

$result_nodes_list{'bad_beginning'} = '';

$result_sections_list{'bad_beginning'} = '';

$result_sectioning_root{'bad_beginning'} = '';

$result_headings_list{'bad_beginning'} = '';

1;
