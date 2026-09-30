use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraphindent_in_preamble_and_in_document'} = '*document_root C5
 *before_node_section C3
  *preamble_before_content C4
   *@copying C5 l1
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {In copying.\\n}
    {empty_line:\\n}
    *paragraph C1
     {Copying second para.\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
   *@paragraphindent C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {1}
   {empty_line:\\n}
  *paragraph C1
   {After paragraphindent.\\n}
  {empty_line:\\n}
 *@node C1 l11 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C10 l12 {test @@paragraphindent in preamble effect in preamble}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {test }
    *@@
    {paragraphindent in preamble effect in preamble}
  {empty_line:\\n}
  *paragraph C1
   {First para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {Second para.\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {3}
  {empty_line:\\n}
  *paragraph C1
   {Third para after second paragraphindent.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'paragraphindent_in_preamble_and_in_document'} = '@copying
In copying.

Copying second para.
@end copying

@paragraphindent 1

After paragraphindent.

@node Top
@top test @@paragraphindent in preamble effect in preamble

First para.

Second para.

@paragraphindent 3

Third para after second paragraphindent.

@bye

';


$result_texts{'paragraphindent_in_preamble_and_in_document'} = '

After paragraphindent.

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

Second para.


Third para after second paragraphindent.

';

$result_errors{'paragraphindent_in_preamble_and_in_document'} = '';

$result_nodes_list{'paragraphindent_in_preamble_and_in_document'} = '1|Top
 associated_section: test @@paragraphindent in preamble effect in preamble
 associated_title_command: test @@paragraphindent in preamble effect in preamble
';

$result_sections_list{'paragraphindent_in_preamble_and_in_document'} = '1|test @@paragraphindent in preamble effect in preamble
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'paragraphindent_in_preamble_and_in_document'} = 'level: -1
list:
 1|test @@paragraphindent in preamble effect in preamble
';

$result_headings_list{'paragraphindent_in_preamble_and_in_document'} = '';


$result_converted{'info'}->{'paragraphindent_in_preamble_and_in_document'} = 'This is , produced from .

In copying.

 Copying second para.

 After paragraphindent.


File: ,  Node: Top,  Up: (dir)

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

 Second para.

   Third para after second paragraphindent.


Tag Table:
Node: Top88

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
