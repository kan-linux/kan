use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'titlepage_and_setchapternewpage_on'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C4
   *@setchapternewpage C1 l1
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
   {empty_line:\\n}
   *@titlepage C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {in titlepage\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {titlepage}
   {empty_line:\\n}
';


$result_texis{'titlepage_and_setchapternewpage_on'} = '@setchapternewpage on

@titlepage
in titlepage
@end titlepage

';


$result_texts{'titlepage_and_setchapternewpage_on'} = '

';

$result_errors{'titlepage_and_setchapternewpage_on'} = '';

$result_nodes_list{'titlepage_and_setchapternewpage_on'} = '';

$result_sections_list{'titlepage_and_setchapternewpage_on'} = '';

$result_sectioning_root{'titlepage_and_setchapternewpage_on'} = '';

$result_headings_list{'titlepage_and_setchapternewpage_on'} = '';


$result_converted{'latex_text'}->{'titlepage_and_setchapternewpage_on'} = '\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%


\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue
in titlepage
\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
';

1;
