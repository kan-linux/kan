use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'three_setchapternewpage_on_odd_off'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
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
   *@setchapternewpage C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{odd}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {odd}
   {empty_line:\\n}
   *@setchapternewpage C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{off}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {off}
';


$result_texis{'three_setchapternewpage_on_odd_off'} = '@setchapternewpage on

@setchapternewpage odd

@setchapternewpage off
';


$result_texts{'three_setchapternewpage_on_odd_off'} = '

';

$result_errors{'three_setchapternewpage_on_odd_off'} = '* W l3|multiple @setchapternewpage
 warning: multiple @setchapternewpage

* W l5|multiple @setchapternewpage
 warning: multiple @setchapternewpage

';

$result_nodes_list{'three_setchapternewpage_on_odd_off'} = '';

$result_sections_list{'three_setchapternewpage_on_odd_off'} = '';

$result_sectioning_root{'three_setchapternewpage_on_odd_off'} = '';

$result_headings_list{'three_setchapternewpage_on_odd_off'} = '';


$result_converted{'latex_text'}->{'three_setchapternewpage_on_odd_off'} = '\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\makeatletter
\\patchcmd{\\chapter}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{}{}
\\makeatother
\\pagestyle{double}%

\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}}{}{}
\\makeatother
\\pagestyle{empty}%
\\begin{document}
';

1;
