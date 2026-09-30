use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'begin_like_comment_on_set_line'} = '*document_root C1
 *before_node_section C4
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:x@come with me}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{y|some thing @commentary is it}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:y some thing @commentary is it}
  {empty_line:\\n}
  *paragraph C3
   {!}
   *@value C1
    *brace_container C1
     {x}
   {! !some thing  is it!\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:3>{some thing @commentary is it}
    >*@value C1
     >*brace_container C1
      >{y}
   >value_expansion<end;1><p:20>
';


$result_texis{'begin_like_comment_on_set_line'} = '@set x@come with me
@set y some thing @commentary is it

!@value{x}! !some thing  is it!
';


$result_texts{'begin_like_comment_on_set_line'} = '
!x! !some thing  is it!
';

$result_errors{'begin_like_comment_on_set_line'} = '* E l1|bad name for @set
 bad name for @set

* W l4|undefined flag: x
 warning: undefined flag: x

* E l4|unknown command `commentary\'
 unknown command `commentary\'

';

$result_nodes_list{'begin_like_comment_on_set_line'} = '';

$result_sections_list{'begin_like_comment_on_set_line'} = '';

$result_sectioning_root{'begin_like_comment_on_set_line'} = '';

$result_headings_list{'begin_like_comment_on_set_line'} = '';

1;
