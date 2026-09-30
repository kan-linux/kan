use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlineraw_not_closed'} = '*document_root C2
 *before_node_section C1
  *paragraph C1
   *@inlineraw C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {aa\\n}
 *@section C1 l2 {sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec}
';


$result_texis{'inlineraw_not_closed'} = '@inlineraw{html, aa
}@section sec
';


$result_texts{'inlineraw_not_closed'} = 'aa
1 sec
=====
';

$result_errors{'inlineraw_not_closed'} = '* E l1|@section seen before @inlineraw closing brace
 @section seen before @inlineraw closing brace

';

$result_nodes_list{'inlineraw_not_closed'} = '';

$result_sections_list{'inlineraw_not_closed'} = '1|sec
';

$result_sectioning_root{'inlineraw_not_closed'} = 'level: 1
list:
 1|sec
';

$result_headings_list{'inlineraw_not_closed'} = '';

1;
