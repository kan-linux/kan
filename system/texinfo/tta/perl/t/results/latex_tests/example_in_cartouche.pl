use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'example_in_cartouche'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@cartouche C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {Normal cartouche\\n}
   {empty_line:\\n}
   *paragraph C1
    {New para\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
  {empty_line:\\n}
  *@cartouche C3 l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@example C3 l8
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C2
     {% pwd\\n}
     {/usr/local/share/emacs\\n}
    *@end C1 l11
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
   *@end C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
';


$result_texis{'example_in_cartouche'} = '@cartouche
Normal cartouche

New para
@end cartouche

@cartouche
@example
% pwd
/usr/local/share/emacs
@end example
@end cartouche
';


$result_texts{'example_in_cartouche'} = 'Normal cartouche

New para

% pwd
/usr/local/share/emacs
';

$result_errors{'example_in_cartouche'} = '';

$result_nodes_list{'example_in_cartouche'} = '';

$result_sections_list{'example_in_cartouche'} = '';

$result_sectioning_root{'example_in_cartouche'} = '';

$result_headings_list{'example_in_cartouche'} = '';


$result_converted{'latex_text'}->{'example_in_cartouche'} = '\\begin{document}
\\begin{mdframed}[style=Texinfocartouche]
Normal cartouche

New para
\\end{mdframed}

\\begin{mdframed}[style=Texinfocartouche]
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\% pwd
/usr/local/share/emacs
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{mdframed}
';

1;
