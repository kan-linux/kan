use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'leading_space_in_def_arg'} = '*document_root C1
 *before_node_section C1
  *@deffn C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*brace_arg C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |{name}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {category}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
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


$result_texis{'leading_space_in_def_arg'} = '@deffn category { name} arg
@end deffn
';


$result_texts{'leading_space_in_def_arg'} = 'category: name arg
';

$result_errors{'leading_space_in_def_arg'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'leading_space_in_def_arg'} = '';

$result_sections_list{'leading_space_in_def_arg'} = '';

$result_sectioning_root{'leading_space_in_def_arg'} = '';

$result_headings_list{'leading_space_in_def_arg'} = '';

$result_indices_sort_strings{'leading_space_in_def_arg'} = 'fn:
 name
';


$result_converted{'plaintext'}->{'leading_space_in_def_arg'} = ' -- category: name arg
';

1;
