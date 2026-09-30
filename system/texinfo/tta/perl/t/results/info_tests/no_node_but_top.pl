use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_node_but_top'} = '*document_root C2
 *before_node_section
 *@top C1 l1 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
';


$result_texis{'no_node_but_top'} = '@top top
';


$result_texts{'no_node_but_top'} = 'top
***
';

$result_errors{'no_node_but_top'} = '';

$result_nodes_list{'no_node_but_top'} = '';

$result_sections_list{'no_node_but_top'} = '1|top
';

$result_sectioning_root{'no_node_but_top'} = 'level: -1
list:
 1|top
';

$result_headings_list{'no_node_but_top'} = '';


$result_converted{'info'}->{'no_node_but_top'} = 'This is , produced from .

top
***


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'no_node_but_top'} = '* W |document without nodes
 warning: document without nodes

';

1;
