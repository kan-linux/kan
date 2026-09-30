use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'author_outside_titlepage_quotation'} = '*document_root C1
 *before_node_section C1
  *@author C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Some One}
';


$result_texis{'author_outside_titlepage_quotation'} = '@author Some One
';


$result_texts{'author_outside_titlepage_quotation'} = 'Some One
';

$result_errors{'author_outside_titlepage_quotation'} = '* W l1|@author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments
 warning: @author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments

';

$result_nodes_list{'author_outside_titlepage_quotation'} = '';

$result_sections_list{'author_outside_titlepage_quotation'} = '';

$result_sectioning_root{'author_outside_titlepage_quotation'} = '';

$result_headings_list{'author_outside_titlepage_quotation'} = '';

1;
