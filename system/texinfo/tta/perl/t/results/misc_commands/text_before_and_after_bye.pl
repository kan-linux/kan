use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'text_before_and_after_bye'} = '*document_root C3
 *before_node_section C1
  *paragraph C1
   {Before bye }
 *@bye C1
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
  *line_arg C1
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
   {rawline_text:on bye line}
 *postamble_after_end C2
  {text_after_end:\\n}
  {text_after_end:after bye\\n}
';


$result_texis{'text_before_and_after_bye'} = 'Before bye @bye on bye line

after bye
';


$result_texts{'text_before_and_after_bye'} = 'Before bye ';

$result_errors{'text_before_and_after_bye'} = '* W l1|@bye should only appear at the beginning of a line
 warning: @bye should only appear at the beginning of a line

* W l1|remaining argument on @bye line: on bye line
 warning: remaining argument on @bye line: on bye line

';

$result_nodes_list{'text_before_and_after_bye'} = '';

$result_sections_list{'text_before_and_after_bye'} = '';

$result_sectioning_root{'text_before_and_after_bye'} = '';

$result_headings_list{'text_before_and_after_bye'} = '';

1;
