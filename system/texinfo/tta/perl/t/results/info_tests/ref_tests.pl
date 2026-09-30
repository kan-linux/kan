use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ref_tests'} = '*document_root C2
 *before_node_section C1
  {empty_line:\\n}
 *@node C7 l2 {Top}
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
  *paragraph C6
   *@ref C1 l4
    *brace_arg C4
    |EXTRA
    |manual_content:{m}
    |node_content:{in ref followed by comma}
     {(}
     {m}
     {)}
     {in ref followed by comma}
   {, \\n}
   *@ref C1 l5
    *brace_arg C4
    |EXTRA
    |manual_content:{m}
    |node_content:{in ref not followed by comma}
     {(}
     {m}
     {)}
     {in ref not followed by comma}
   { after ref.\\n}
   *@code C1 l6
    *brace_container C1
     *@ref C1 l6
      *brace_arg C4
      |EXTRA
      |manual_content:{m}
      |node_content:{in ref followed by end command}
       {(}
       {m}
       {)}
       {in ref followed by end command}
   {.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@ref C2 l9
    *brace_arg C4
    |EXTRA
    |manual_content:{m}
    |node_content:{in ref followed by comma}
     {(}
     {m}
     {)}
     {in ref followed by comma}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {name}
   {,\\n}
   *@ref C2 l10
    *brace_arg C4
    |EXTRA
    |manual_content:{m}
    |node_content:{in ref not followed by comma}
     {(}
     {m}
     {)}
     {in ref not followed by comma}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {name}
   { after ref.\\n}
   *@code C1 l11
    *brace_container C1
     *@ref C2 l11
      *brace_arg C4
      |EXTRA
      |manual_content:{m}
      |node_content:{in ref followed by end command}
       {(}
       {m}
       {)}
       {in ref followed by end command}
      *brace_arg C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {name}
   {.\\n}
   *@ref C2 l12
    *brace_arg C4
    |EXTRA
    |manual_content:{m}
    |node_content:{in ref ending with a dot.}
     {(}
     {m}
     {)}
     {in ref ending with a dot.}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {name}
   { after ref.\\n}
  {empty_line:\\n}
';


$result_texis{'ref_tests'} = '
@node Top

@ref{(m)in ref followed by comma}, 
@ref{(m)in ref not followed by comma} after ref.
@code{@ref{(m)in ref followed by end command}}.


@ref{(m)in ref followed by comma, name},
@ref{(m)in ref not followed by comma, name} after ref.
@code{@ref{(m)in ref followed by end command, name}}.
@ref{(m)in ref ending with a dot., name} after ref.

';


$result_texts{'ref_tests'} = '

(m)in ref followed by comma, 
(m)in ref not followed by comma after ref.
(m)in ref followed by end command.


(m)in ref followed by comma,
(m)in ref not followed by comma after ref.
(m)in ref followed by end command.
(m)in ref ending with a dot. after ref.

';

$result_errors{'ref_tests'} = '';

$result_nodes_list{'ref_tests'} = '1|Top
';

$result_sections_list{'ref_tests'} = '';

$result_sectioning_root{'ref_tests'} = '';

$result_headings_list{'ref_tests'} = '';


$result_converted{'info'}->{'ref_tests'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

*note (m)in ref followed by comma::, *note (m)in ref not followed by
comma:: after ref.  ‘*note (m)in ref followed by end command::’.

   *note name: (m)in ref followed by comma, *note name: (m)in ref not
followed by comma. after ref.  ‘*note name: (m)in ref followed by end
command.’.  *note name: (m)in ref ending with a dot.. after ref.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'ref_tests'} = '* W l12|@ref node name should not contain `.\'
 warning: @ref node name should not contain `.\'

';

1;
