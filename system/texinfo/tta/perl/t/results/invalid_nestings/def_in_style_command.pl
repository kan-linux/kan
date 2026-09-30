use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_in_style_command'} = '*document_root C1
 *before_node_section C2
  *paragraph C1
   *@code C1 l1
    *brace_container C1
     {\\n}
  *@defun C3 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l2
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{name}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defun}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {args...}
   *def_item C1
    *paragraph C1
     {text\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defun}
';


$result_texis{'def_in_style_command'} = '@code{
}@defun name args...
text
@end defun
';


$result_texts{'def_in_style_command'} = '
Function: name args...
text
';

$result_errors{'def_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'def_in_style_command'} = '';

$result_sections_list{'def_in_style_command'} = '';

$result_sectioning_root{'def_in_style_command'} = '';

$result_headings_list{'def_in_style_command'} = '';

$result_indices_sort_strings{'def_in_style_command'} = 'fn:
 name
';

1;
