use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraph_and_macro'} = '*document_root C1
 *before_node_section C19
  *@macro C2 l1
  |EXTRA
  |macro_name:{aempty}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: aempty\\n}
   *@end C1 l2
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
  *@macro C3 l4
  |EXTRA
  |macro_name:{aspace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: aspace\\n}
   {raw:   \\n}
   *@end C1 l6
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
  *@macro C3 l8
  |EXTRA
  |macro_name:{word}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: word\\n}
   {raw:a word\\n}
   *@end C1 l10
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
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call@aempty C1
    >*brace_arg
  >macro_expansion<end;1>
  {empty_line:\\n}
  {empty_line:    \\n}
  >SOURCEMARKS
  >macro_expansion<start;2><p:2>
   >*macro_call@aempty C1
    >*brace_arg
  >macro_expansion<end;2><p:2>
  {empty_line:\\n}
  {spaces_before_paragraph: }
  >SOURCEMARKS
  >macro_expansion<start;3>
   >*macro_call@aempty C1
    >*brace_arg
  >macro_expansion<end;3>
  *paragraph C1
   {text after empty.\\n}
  {empty_line:\\n}
  {empty_line:   \\n}
  >SOURCEMARKS
  >macro_expansion<start;4>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;4><p:3>
  {empty_line:\\n}
  {empty_line:       \\n}
  >SOURCEMARKS
  >macro_expansion<start;5><p:2>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;5><p:5>
  {empty_line:\\n}
  {spaces_before_paragraph:    }
  >SOURCEMARKS
  >macro_expansion<start;6>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;6><p:3>
  *paragraph C1
   {text after space.\\n}
';


$result_texis{'paragraph_and_macro'} = '@macro aempty
@end macro

@macro aspace
   
@end macro

@macro word
a word
@end macro



    

 text after empty.

   

       

    text after space.
';


$result_texts{'paragraph_and_macro'} = '




    

text after empty.

   

       

text after space.
';

$result_errors{'paragraph_and_macro'} = '';

$result_nodes_list{'paragraph_and_macro'} = '';

$result_sections_list{'paragraph_and_macro'} = '';

$result_sectioning_root{'paragraph_and_macro'} = '';

$result_headings_list{'paragraph_and_macro'} = '';

1;
