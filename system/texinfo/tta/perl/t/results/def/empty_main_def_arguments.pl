use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_main_def_arguments'} = '*document_root C1
 *before_node_section C1
  *@deffn C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {NNN}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
';


$result_texis{'empty_main_def_arguments'} = '@deffn NNN
@end deffn
';


$result_texts{'empty_main_def_arguments'} = 'NNN: 
';

$result_errors{'empty_main_def_arguments'} = '* W l1|missing name for @deffn
 warning: missing name for @deffn

';

$result_nodes_list{'empty_main_def_arguments'} = '';

$result_sections_list{'empty_main_def_arguments'} = '';

$result_sectioning_root{'empty_main_def_arguments'} = '';

$result_headings_list{'empty_main_def_arguments'} = '';

1;
