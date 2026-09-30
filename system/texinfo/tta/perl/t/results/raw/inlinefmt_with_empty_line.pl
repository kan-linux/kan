use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlinefmt_with_empty_line'} = '*document_root C1
 *before_node_section C3
  *paragraph C2
   {A }
   *@inlinefmt C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {plaintext `` \\n}
     {empty_line:\\n}
  *paragraph C3
   *@lbracechar C1 l3
    *brace_container
   {  a.  Now html\\n}
   *@inlinefmt C2 l4
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {html}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {in \\n}
     {empty_line:\\n}
  *paragraph C3
   {<i>}
   *@acronym C1 l6
    *brace_arg C1
     {HTML}
   {</i>.\\n}
';


$result_texis{'inlinefmt_with_empty_line'} = 'A @inlinefmt{plaintext, plaintext `` 

}@lbracechar{}  a.  Now html
@inlinefmt{html, in 

}<i>@acronym{HTML}</i>.
';


$result_texts{'inlinefmt_with_empty_line'} = 'A plaintext " 

{  a.  Now html
in 

<i>HTML</i>.
';

$result_errors{'inlinefmt_with_empty_line'} = '* E l1|@inlinefmt missing closing brace
 @inlinefmt missing closing brace

* E l3|misplaced }
 misplaced }

* E l4|@inlinefmt missing closing brace
 @inlinefmt missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'inlinefmt_with_empty_line'} = '';

$result_sections_list{'inlinefmt_with_empty_line'} = '';

$result_sectioning_root{'inlinefmt_with_empty_line'} = '';

$result_headings_list{'inlinefmt_with_empty_line'} = '';

1;
