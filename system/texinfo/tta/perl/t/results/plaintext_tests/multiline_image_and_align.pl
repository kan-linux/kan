use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiline_image_and_align'} = '*document_root C1
 *before_node_section C9
  *@center C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@image C1 l1
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
  {empty_line:\\n}
  *@center C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {CCCC }
    *@image C1 l3
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
  {empty_line:\\n}
  *@center C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fffffffffffffffffffffffffffffffffffffff }
    *@image C1 l5
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
  {empty_line:\\n}
  *@center C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {dddd }
    *@image C1 l7
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
    { iiiii}
  {empty_line:\\n}
  *@flushright C7 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C3
    {AAA\\n}
    *@image C1 l11
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
    {\\n}
   {empty_line:\\n}
   *paragraph C5
    {BBB }
    *@image C1 l13
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
    { gggg }
    *@image C1 l13
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
    {\\n}
   {empty_line:\\n}
   *paragraph C3
    {HHH\\n}
    *@image C1 l16
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {figure}
    { JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ\\n}
   *@end C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushright}
';


$result_texis{'multiline_image_and_align'} = '@center @image{figure}

@center CCCC @image{figure} 

@center fffffffffffffffffffffffffffffffffffffff @image{figure}

@center dddd @image{figure} iiiii

@flushright
AAA
@image{figure}

BBB @image{figure} gggg @image{figure}

HHH
@image{figure} JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@end flushright
';


$result_texts{'multiline_image_and_align'} = 'figure

CCCC figure

fffffffffffffffffffffffffffffffffffffff figure

dddd figure iiiii

AAA
figure

BBB figure gggg figure

HHH
figure JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
';

$result_errors{'multiline_image_and_align'} = '';

$result_nodes_list{'multiline_image_and_align'} = '';

$result_sections_list{'multiline_image_and_align'} = '';

$result_sectioning_root{'multiline_image_and_align'} = '';

$result_headings_list{'multiline_image_and_align'} = '';


$result_converted{'plaintext'}->{'multiline_image_and_align'} = '                               1  A  B  
                               2  C  D
                               3  E  F

                        CCCC   1  A  B  
                               2  C  D
                               3  E  F

fffffffffffffffffffffffffffffffffffffff   1  A  B  
                               2  C  D
                               3  E  F

                        dddd   1  A  B  
                               2  C  D
                           3  E  F iiiii

                                                                    AAA
                                                             1  A  B  
                                                             2  C  D
                                                             3  E  F

                                                       BBB   1  A  B  
                                                             2  C  D
                                              3  E  F gggg   1  A  B  
                                                             2  C  D
                                                             3  E  F

                                                                    HHH
                                                             1  A  B  
                                                             2  C  D
                        3  E  F JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
';

1;
