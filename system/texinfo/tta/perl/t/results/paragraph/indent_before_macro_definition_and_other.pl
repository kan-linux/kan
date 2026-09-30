use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'indent_before_macro_definition_and_other'} = '*document_root C1
 *before_node_section C14
  {empty_line:\\n}
  *@indent l2
  {ignorable_spaces_after_command:\\n}
  *@author C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {someone}
  *@image C1 l4
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {my_image}
  {\\n}
  *@vskip C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:0pt plus 1filll}
  *@html C3 l6
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*@ifnothtml C3 l9
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:not html\\n}
    >*@end C1 l11
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnothtml}
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {<code>in c</code>\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html}
  *@setchapternewpage C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  *@anchor C1 l13
  |EXTRA
  |is_target:{1}
  |normalized:{spot}
   *brace_arg C1
    {spot}
  {spaces_after_close_brace:\\n}
  *index_entry_command@cpindex C1 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ei}
  *@macro C3 l15
  |EXTRA
  |macro_name:{aaa}
  |misc_args:A{g}
   *arguments_line C1
    {macro_line: aaa {g}\\n}
   {raw:ll /g/\\n}
   *@end C1 l17
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
  *paragraph C1
  |EXTRA
  |indent:{1}
   {HHERE\\n}
';


$result_texis{'indent_before_macro_definition_and_other'} = '
@indent
@author someone
@image{my_image}
@vskip 0pt plus 1filll
@html
<code>in c</code>
@end html
@setchapternewpage on
@anchor{spot}
@cpindex ei
@macro aaa {g}
ll /g/
@end macro
HHERE
';


$result_texts{'indent_before_macro_definition_and_other'} = '
someone
my_image
<code>in c</code>
HHERE
';

$result_errors{'indent_before_macro_definition_and_other'} = '* W l3|@author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments
 warning: @author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments

* W l14|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'indent_before_macro_definition_and_other'} = '';

$result_sections_list{'indent_before_macro_definition_and_other'} = '';

$result_sectioning_root{'indent_before_macro_definition_and_other'} = '';

$result_headings_list{'indent_before_macro_definition_and_other'} = '';

$result_indices_sort_strings{'indent_before_macro_definition_and_other'} = 'cp:
 ei
';


$result_converted{'plaintext'}->{'indent_before_macro_definition_and_other'} = '[my_image]
   HHERE
';

$result_converted_errors{'plaintext'}->{'indent_before_macro_definition_and_other'} = '* W l4|could not find @image file `my_image.txt\' nor alternate text
 warning: could not find @image file `my_image.txt\' nor alternate text

';


$result_converted{'html_text'}->{'indent_before_macro_definition_and_other'} = '
<img class="image" src="my_image.jpg" alt="my_image">
<code>in c</code>
<a class="anchor" id="spot"></a><a class="index-entry-id" id="index-ei"></a>
<p>HHERE
</p>';

$result_converted_errors{'html_text'}->{'indent_before_macro_definition_and_other'} = '* W l4|@image file `my_image\' (for HTML) not found, using `my_image.jpg\'
 warning: @image file `my_image\' (for HTML) not found, using `my_image.jpg\'

';

1;
