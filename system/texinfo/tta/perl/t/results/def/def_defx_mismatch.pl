use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_defx_mismatch'} = '*document_root C1
 *before_node_section C1
  *@defun C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*brace_arg C1
      |{my def}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defun}
    *block_line_arg C9
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
      *bracketed_arg C1 l1
       {my def}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {args}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l1
        *brace_container C1
         {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@dots C1 l1
        *brace_container
   *@deffnx C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*brace_arg C1
      |{name}
   |index_entry:I{fn,2}
   |not_after_command:{1}
   |original_def_cmdname:{deffnx}
    *line_arg C11
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l2
       {type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l2
       {name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {now}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {the}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {args}
   *def_item C3
    {empty_line:\\n}
    *paragraph C1
     {In defun.\\n}
    {empty_line:\\n}
   *@end C1 l6
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


$result_texis{'def_defx_mismatch'} = '@defun {my def} args @var{arg} @dots{}
@deffnx {type} {name} and now the args

In defun.

@end defun
';


$result_texts{'def_defx_mismatch'} = 'Function: my def args arg ...
type: name and now the args

In defun.

';

$result_errors{'def_defx_mismatch'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l2|must be after `@deffn\' to use `@deffnx\'
 must be after `@deffn\' to use `@deffnx\'

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'def_defx_mismatch'} = '';

$result_sections_list{'def_defx_mismatch'} = '';

$result_sectioning_root{'def_defx_mismatch'} = '';

$result_headings_list{'def_defx_mismatch'} = '';

$result_indices_sort_strings{'def_defx_mismatch'} = 'fn:
 my def
 name
';

1;
