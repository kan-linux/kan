use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'defx_after_preformatted_with_text'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@deffn C4 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *def_line C1 l2
    |EXTRA
    |def_command:{deffn}
    |def_index_element:
     |* C1
      |*def_line_arg C1
       |*@var C1
        |*brace_container C1
         |{i}
    |index_entry:I{fn,1}
    |original_def_cmdname:{deffn}
     *block_line_arg C7
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *def_category C1
       *def_line_arg C1
        {fset}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        *@var C1 l2
         *brace_container C1
          {i}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {a}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {g}
    *inter_def_item C1
     *preformatted C2
      {Text in preformatted.\\n}
      {empty_line:\\n}
    *@deffnx C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |def_command:{deffn}
    |def_index_element:
     |* C1
      |*def_line_arg C1
       |{bidulr}
    |index_entry:I{fn,2}
    |not_after_command:{1}
    |original_def_cmdname:{deffnx}
     *line_arg C5
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *def_category C1
       *bracketed_arg C1 l5
        {truc}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {bidulr}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {machin...}
    *@end C1 l6
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
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'defx_after_preformatted_with_text'} = '@example
@deffn fset @var{i} a g
Text in preformatted.

@deffnx {truc} bidulr machin...
@end deffn
@end example
';


$result_texts{'defx_after_preformatted_with_text'} = 'fset: i a g
Text in preformatted.

truc: bidulr machin...
';

$result_errors{'defx_after_preformatted_with_text'} = '* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l5|must be after `@deffn\' to use `@deffnx\'
 must be after `@deffn\' to use `@deffnx\'

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'defx_after_preformatted_with_text'} = '';

$result_sections_list{'defx_after_preformatted_with_text'} = '';

$result_sectioning_root{'defx_after_preformatted_with_text'} = '';

$result_headings_list{'defx_after_preformatted_with_text'} = '';

$result_indices_sort_strings{'defx_after_preformatted_with_text'} = 'fn:
 bidulr
 i
';

1;
