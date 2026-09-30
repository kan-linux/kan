use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'synindex_too_much_args'} = '*document_root C1
 *before_node_section C1
  *@syncodeindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp fn    truc}
';


$result_texis{'synindex_too_much_args'} = '@syncodeindex cp fn    truc
';


$result_texts{'synindex_too_much_args'} = '';

$result_errors{'synindex_too_much_args'} = '* E l1|bad argument to @syncodeindex: cp fn    truc
 bad argument to @syncodeindex: cp fn    truc

';

$result_nodes_list{'synindex_too_much_args'} = '';

$result_sections_list{'synindex_too_much_args'} = '';

$result_sectioning_root{'synindex_too_much_args'} = '';

$result_headings_list{'synindex_too_much_args'} = '';

1;
