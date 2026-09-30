use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protected_brace'} = '*document_root C1
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
     |*def_line_arg C1
      |*@{
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@{
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


$result_texis{'protected_brace'} = '@deffn c @{
@end deffn
';


$result_texts{'protected_brace'} = 'c: {
';

$result_errors{'protected_brace'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'protected_brace'} = '';

$result_sections_list{'protected_brace'} = '';

$result_sectioning_root{'protected_brace'} = '';

$result_headings_list{'protected_brace'} = '';

$result_indices_sort_strings{'protected_brace'} = 'fn:
 {
';


$result_converted{'plaintext'}->{'protected_brace'} = ' -- c: {
';

1;
