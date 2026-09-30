use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'settitle_and_headings'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C4
   *@settitle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Title }
     *@*
     { for a manual}
   {empty_line:\\n}
   *@headings C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{double}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {double}
   {empty_line:\\n}
 *@chapter C9 l5 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {More text\\n}
  {empty_line:\\n}
  *@page C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Another page\\n}
';


$result_texis{'settitle_and_headings'} = '@settitle Title @* for a manual

@headings double

@chapter chap

@page

More text

@page

Another page
';


$result_texts{'settitle_and_headings'} = '

1 chap
******



More text



Another page
';

$result_errors{'settitle_and_headings'} = '';

$result_nodes_list{'settitle_and_headings'} = '';

$result_sections_list{'settitle_and_headings'} = '1|chap
';

$result_sectioning_root{'settitle_and_headings'} = 'level: 0
list:
 1|chap
';

$result_headings_list{'settitle_and_headings'} = '';


$result_converted{'latex_text'}->{'settitle_and_headings'} = '
\\pagestyle{double}%

\\begin{document}
\\Texinfochapter{{chap}}

\\newpage{}%
\\phantom{blabla}%

More text

\\newpage{}%
\\phantom{blabla}%

Another page
';

1;
