use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_titlepage_and_setchapternewpage_odd'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@setchapternewpage C1 l1
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
';


$result_texis{'no_titlepage_and_setchapternewpage_odd'} = '@setchapternewpage odd
';


$result_texts{'no_titlepage_and_setchapternewpage_odd'} = '';

$result_errors{'no_titlepage_and_setchapternewpage_odd'} = '';

$result_nodes_list{'no_titlepage_and_setchapternewpage_odd'} = '';

$result_sections_list{'no_titlepage_and_setchapternewpage_odd'} = '';

$result_sectioning_root{'no_titlepage_and_setchapternewpage_odd'} = '';

$result_headings_list{'no_titlepage_and_setchapternewpage_odd'} = '';


$result_converted{'latex_text'}->{'no_titlepage_and_setchapternewpage_odd'} = '\\pagestyle{double}%
\\begin{document}
';

1;
