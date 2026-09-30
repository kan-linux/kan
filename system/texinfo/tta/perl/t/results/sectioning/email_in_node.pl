use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'email_in_node'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {@email{ a } @email{c , d} @email{ , e}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a-c-}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@email C1 l1
     *brace_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument: }
     |spaces_before_argument:
      |{spaces_before_argument: }
      {a}
    { }
    *@email C2 l1
     *brace_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument: }
      {c}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {d}
    { }
    *@email C2 l1
     *brace_arg
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {e}
';


$result_texis{'email_in_node'} = '@node @email{ a } @email{c , d} @email{ , e}
';


$result_texts{'email_in_node'} = '';

$result_errors{'email_in_node'} = '';

$result_nodes_list{'email_in_node'} = '1|@email{ a } @email{c , d} @email{ , e}
';

$result_sections_list{'email_in_node'} = '';

$result_sectioning_root{'email_in_node'} = '';

$result_headings_list{'email_in_node'} = '';

1;
