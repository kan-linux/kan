use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_of_lines_protected'} = '*document_root C1
 *before_node_section C1
  *@deffn C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{deffn_name}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C19
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {deffn_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arguments}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {more}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l2
       {args   with end of line within}
       >SOURCEMARKS
       >defline_continuation<2><p:5>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {with}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@@
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@@
       >SOURCEMARKS
       >defline_continuation<3>
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l4
       {one last arg}
   *def_item C1
    *paragraph C1
     {deffn\\n}
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
';


$result_texis{'end_of_lines_protected'} = '@deffn category deffn_name arguments    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
';


$result_texts{'end_of_lines_protected'} = 'category: deffn_name arguments    more args   with end of line within with 3 @ @ one last arg
deffn
';

$result_errors{'end_of_lines_protected'} = '* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'end_of_lines_protected'} = '';

$result_sections_list{'end_of_lines_protected'} = '';

$result_sectioning_root{'end_of_lines_protected'} = '';

$result_headings_list{'end_of_lines_protected'} = '';

$result_indices_sort_strings{'end_of_lines_protected'} = 'fn:
 deffn_name
';


$result_converted{'plaintext'}->{'end_of_lines_protected'} = ' -- category: deffn_name arguments more args with end of line within
          with 3 @ @ one last arg
     deffn
';

1;
