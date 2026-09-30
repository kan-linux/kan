use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'note_in_strong_end_of_line'} = '*document_root C2
 *before_node_section
 *@node C5 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *paragraph C3
   {bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv }
   *@strong C1 l3
    *brace_container C1
     {note a}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv }
   *@strong C1 l5
    *brace_container C2
     {note\\n}
     {a}
   {\\n}
';


$result_texis{'note_in_strong_end_of_line'} = '@node Top

bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv @strong{note a}

bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv @strong{note
a}
';


$result_texts{'note_in_strong_end_of_line'} = '
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv note a

bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv note
a
';

$result_errors{'note_in_strong_end_of_line'} = '';

$result_nodes_list{'note_in_strong_end_of_line'} = '1|Top
';

$result_sections_list{'note_in_strong_end_of_line'} = '';

$result_sectioning_root{'note_in_strong_end_of_line'} = '';

$result_headings_list{'note_in_strong_end_of_line'} = '';


$result_converted{'info'}->{'note_in_strong_end_of_line'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv *note
a*

   bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb vvvvvvvvvvvvvvvv *note
a*


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'note_in_strong_end_of_line'} = '* W l3|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

* W l5|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

';

1;
