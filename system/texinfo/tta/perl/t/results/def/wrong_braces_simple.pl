use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'wrong_braces_simple'} = '*document_root C1
 *before_node_section C9
  *@deffn C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
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
  {empty_line:\\n}
  *@deffn C2 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l4
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {after}
   *@end C1 l5
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
  {empty_line:\\n}
  *@deffn C2 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l7
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg l7
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument:\\n}
   *@end C1 l8
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
  {empty_line:\\n}
  *@deffn C2 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l10
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l10
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
      |spaces_before_argument:
       |{spaces_before_argument: }
       {and after}
   *@end C1 l11
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
  {empty_line:\\n}
  *@deffn C6 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l13
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{b}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {e}
   *@deffnx C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deffnx}
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
   *@deffnx C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,7}
   |original_def_cmdname:{deffnx}
    *line_arg C11
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {after}
   *@deffnx C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,8}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg l16
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument:\\n}
   *@deffnx C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l17
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
      |spaces_before_argument:
       |{spaces_before_argument: }
       {and after}
   *@end C1 l18
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


$result_texis{'wrong_braces_simple'} = '@deffn truc machin bidule chose and 
@end deffn

@deffn truc machin bidule chose and  after
@end deffn

@deffn truc machin bidule chose and {
}@end deffn

@deffn truc machin bidule chose and { and after
}@end deffn

@deffn a b c d e
@deffnx truc machin bidule chose and 
@deffnx truc machin bidule chose and  after
@deffnx truc machin bidule chose and {
}@deffnx truc machin bidule chose and { and after
}@end deffn
';


$result_texts{'wrong_braces_simple'} = 'truc: machin bidule chose and

truc: machin bidule chose and  after

truc: machin bidule chose and 

truc: machin bidule chose and and after

a: b c d e
truc: machin bidule chose and
truc: machin bidule chose and  after
truc: machin bidule chose and 
truc: machin bidule chose and and after
';

$result_errors{'wrong_braces_simple'} = '* E l1|misplaced }
 misplaced }

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l4|misplaced }
 misplaced }

* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l7|misplaced {
 misplaced {

* W l7|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l10|misplaced {
 misplaced {

* W l10|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l14|misplaced }
 misplaced }

* W l14|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l15|misplaced }
 misplaced }

* W l15|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l16|misplaced {
 misplaced {

* W l16|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l17|misplaced {
 misplaced {

* W l17|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'wrong_braces_simple'} = '';

$result_sections_list{'wrong_braces_simple'} = '';

$result_sectioning_root{'wrong_braces_simple'} = '';

$result_headings_list{'wrong_braces_simple'} = '';

$result_indices_sort_strings{'wrong_braces_simple'} = 'fn:
 b
 machin
 machin
 machin
 machin
 machin
 machin
 machin
 machin
';

1;
