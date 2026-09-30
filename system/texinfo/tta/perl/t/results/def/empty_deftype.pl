use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_deftype'} = '*document_root C1
 *before_node_section C7
  *@deftypefun C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deftypefun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{f}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C13
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_type C1
      *bracketed_arg l1
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {f}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {type&}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {x}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {Deftypefun.\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefun}
  {empty_line:\\n}
  *@defun C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l5
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{f}
   |index_entry:I{fn,2}
   |original_def_cmdname:{defun}
    *block_line_arg C11
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
       {f}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {type&}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {x}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {Defun.\\n}
   *@end C1 l7
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
  {empty_line:\\n}
  *@deftypemethod C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l9
   |EXTRA
   |def_command:{deftypemethod}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{f}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{f}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypemethod}
    *block_line_arg C15
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Method}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_type C1
      *bracketed_arg l9
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {f}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {type&}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {x}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {Deftypemethod.\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypemethod}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypemethod}
  {empty_line:\\n}
  *@defmethod C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l13
   |EXTRA
   |def_command:{defmethod}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{f}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{f}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defmethod}
    *block_line_arg C13
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Method}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {f}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {type&}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {x}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {Defmethod.\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defmethod}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defmethod}
';


$result_texis{'empty_deftype'} = '@deftypefun {} f (const type& x)
Deftypefun.
@end deftypefun

@defun f (const type& x)
Defun.
@end defun

@deftypemethod c {} f (const type& x)
Deftypemethod.
@end deftypemethod

@defmethod c f (const type& x)
Defmethod.
@end defmethod
';


$result_texts{'empty_deftype'} = 'Function:  f (const type& x)
Deftypefun.

Function: f (const type& x)
Defun.

Method on c:  f (const type& x)
Deftypemethod.

Method on c: f (const type& x)
Defmethod.
';

$result_errors{'empty_deftype'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l9|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'empty_deftype'} = '';

$result_sections_list{'empty_deftype'} = '';

$result_sectioning_root{'empty_deftype'} = '';

$result_headings_list{'empty_deftype'} = '';

$result_indices_sort_strings{'empty_deftype'} = 'fn:
 f
 f
 f on c
 f on c
';

1;
