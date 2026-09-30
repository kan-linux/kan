use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_abbr_acronym'} = '*document_root C1
 *before_node_section C1
  *paragraph C16
   *@abbr C1 l1
    *brace_arg C1
     {AAA}
   {. }
   *@acronym C1 l1
    *brace_arg C1
     {BBB}
   {. }
   *@abbr C1 l1
    *brace_arg C1
     {aaa}
   {. }
   *@acronym C1 l1
    *brace_arg C1
     {bbb}
   {. Next.\\n}
   *@abbr C2 l2
    *brace_arg C1
     {AAA}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {expL}
   {. }
   *@acronym C2 l2
    *brace_arg C1
     {BBB}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {explA}
   {. }
   *@abbr C2 l2
    *brace_arg C1
     {aaa}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {expl}
   {. \\n}
   *@acronym C2 l3
    *brace_arg C1
     {bbb}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {expla}
   {. Last.\\n}
';


$result_texis{'punctuation_abbr_acronym'} = '@abbr{AAA}. @acronym{BBB}. @abbr{aaa}. @acronym{bbb}. Next.
@abbr{AAA, expL}. @acronym{BBB, explA}. @abbr{aaa, expl}. 
@acronym{bbb, expla}. Last.
';


$result_texts{'punctuation_abbr_acronym'} = 'AAA. BBB. aaa. bbb. Next.
AAA (expL). BBB (explA). aaa (expl). 
bbb (expla). Last.
';

$result_errors{'punctuation_abbr_acronym'} = '';

$result_nodes_list{'punctuation_abbr_acronym'} = '';

$result_sections_list{'punctuation_abbr_acronym'} = '';

$result_sectioning_root{'punctuation_abbr_acronym'} = '';

$result_headings_list{'punctuation_abbr_acronym'} = '';


$result_converted{'plaintext'}->{'punctuation_abbr_acronym'} = 'AAA.  BBB.  aaa.  bbb.  Next.  AAA (expL). BBB (explA). aaa (expl).  bbb
(expla).  Last.
';

1;
