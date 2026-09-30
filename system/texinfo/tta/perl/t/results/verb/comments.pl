use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comments'} = '*document_root C1
 *before_node_section C3
  *paragraph C2
   *@verb C1 l1
   |INFO
   |delimiter:{a}
    *brace_container C2
     {raw: comment @c comment\\n}
     {raw:in a verb }
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:comment}
  {empty_line:\\n}
  *paragraph C4
   {something }
   *@verb C1 l4
   |INFO
   |delimiter:{,}
    *brace_container C1
     {raw: in verb}
   { }
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
     {rawline_text:other comment}
';


$result_texis{'comments'} = '@verb{a comment @c comment
in a verb a}@c comment

something @verb{, in verb,} @c other comment';


$result_texts{'comments'} = ' comment @c comment
in a verb 
something  in verb ';

$result_errors{'comments'} = '';

$result_nodes_list{'comments'} = '';

$result_sections_list{'comments'} = '';

$result_sectioning_root{'comments'} = '';

$result_headings_list{'comments'} = '';

1;
