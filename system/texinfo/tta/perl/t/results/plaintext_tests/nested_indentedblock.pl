use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested_indentedblock'} = '*document_root C1
 *before_node_section C3
  *@example C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {in example\\n}
   *@indentedblock C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {   f  f  f``g\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{indentedblock}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {indentedblock}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@indentedblock C5 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {spaces_before_paragraph:   }
   *paragraph C1
    {v  v  v``a\\n}
   *@example C3 l10
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {in example\\n}
    *@end C1 l12
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{example}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {example}
   *@end C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{indentedblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {indentedblock}
';


$result_texis{'nested_indentedblock'} = '@example
in example
@indentedblock
   f  f  f``g
@end indentedblock
@end example

@indentedblock
   v  v  v``a
@example
in example
@end example
@end indentedblock
';


$result_texts{'nested_indentedblock'} = 'in example
   f  f  f``g

v  v  v"a
in example
';

$result_errors{'nested_indentedblock'} = '';

$result_nodes_list{'nested_indentedblock'} = '';

$result_sections_list{'nested_indentedblock'} = '';

$result_sectioning_root{'nested_indentedblock'} = '';

$result_headings_list{'nested_indentedblock'} = '';


$result_converted{'plaintext'}->{'nested_indentedblock'} = '     in example
             f  f  f``g

     v v v"a
          in example
';

1;
