use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'clickstyle_and_comments'} = '*document_root C1
 *before_node_section C7
  *@clickstyle C1 l1
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{@comment}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@comment a}
  *@clickstyle C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{@comment}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@comment b}
  *@clickstyle C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:nocmd@comment c}
  *@clickstyle C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:more than one word @comment d}
  *@clickstyle C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{@result}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:e}
    {rawline_text:@result}
  *@clickstyle C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{@result}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:f}
    {rawline_text:@result   }
  *@clickstyle C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{@result}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@result on the same line @comment g}
';


$result_texis{'clickstyle_and_comments'} = '@clickstyle@comment a
@clickstyle @comment b
@clickstyle nocmd@comment c
@clickstyle more than one word @comment d
@clickstyle @result@comment e
@clickstyle @result   @comment f
@clickstyle @result on the same line @comment g
';


$result_texts{'clickstyle_and_comments'} = '';

$result_errors{'clickstyle_and_comments'} = '* W l1|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l1|remaining argument on @clickstyle line: a
 warning: remaining argument on @clickstyle line: a

* W l2|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l2|remaining argument on @clickstyle line: b
 warning: remaining argument on @clickstyle line: b

* W l3|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* E l3|@clickstyle should only accept an @-command as argument, not ` nocmd@comment c
\'
 @clickstyle should only accept an @-command as argument, not ` nocmd@comment c
\'

* W l4|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* E l4|@clickstyle should only accept an @-command as argument, not ` more than one word @comment d
\'
 @clickstyle should only accept an @-command as argument, not ` more than one word @comment d
\'

* W l5|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l6|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l7|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l7|remaining argument on @clickstyle line: on the same line @comment g
 warning: remaining argument on @clickstyle line: on the same line @comment g

';

$result_nodes_list{'clickstyle_and_comments'} = '';

$result_sections_list{'clickstyle_and_comments'} = '';

$result_sectioning_root{'clickstyle_and_comments'} = '';

$result_headings_list{'clickstyle_and_comments'} = '';

1;
