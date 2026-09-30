use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_at_end_command'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C21
   {Text. Email }
   *@email C2 l2
    *brace_arg C1
     {.}
    *brace_arg C1
     {.}
   { dmn }
   *@dmn C1 l2
    *brace_container C1
     {1.}
   { and text. indicateurl }
   *@indicateurl C1 l2
    *brace_container C1
     {.}
   { and \\n}
   {then kbd }
   *@kbd C1 l3
    *brace_container C1
     {.}
   { and math }
   *@math C1 l3
    *brace_command_context C1
     {.}
   { and cite }
   *@cite C1 l3
    *brace_container C1
     {.}
   { and emph }
   *@emph C1 l3
    *brace_container C1
     {.}
   { text. \\n}
   {asis in code }
   *@code C1 l4
    *brace_container C1
     *@asis C1 l4
      *brace_container C1
       {.}
   { text. a dot before a emph open .}
   *@emph C1 l4
    *brace_container C1
     { and in emph.}
   {\\n}
';


$result_texis{'punctuation_at_end_command'} = '
Text. Email @email{.,.} dmn @dmn{1.} and text. indicateurl @indicateurl{.} and 
then kbd @kbd{.} and math @math{.} and cite @cite{.} and emph @emph{.} text. 
asis in code @code{@asis{.}} text. a dot before a emph open .@emph{ and in emph.}
';


$result_texts{'punctuation_at_end_command'} = '
Text. Email . dmn 1. and text. indicateurl . and 
then kbd . and math . and cite . and emph . text. 
asis in code . text. a dot before a emph open . and in emph.
';

$result_errors{'punctuation_at_end_command'} = '';

$result_nodes_list{'punctuation_at_end_command'} = '';

$result_sections_list{'punctuation_at_end_command'} = '';

$result_sectioning_root{'punctuation_at_end_command'} = '';

$result_headings_list{'punctuation_at_end_command'} = '';


$result_converted{'plaintext'}->{'punctuation_at_end_command'} = 'Text.  Email .  <.> dmn 1. and text.  indicateurl ‘.’ and then kbd ‘.’
and math . and cite ‘.’ and emph _._  text.  asis in code ‘.’ text.  a
dot before a emph open ._  and in emph._
';

1;
