use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ifclear_in_ifset_set'} = '*document_root C1
 *before_node_section C5
  {empty_line:\\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{a|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:a}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifset C1 l4
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
  >expanded_conditional_command<start;2><p:1>
   >*@ifclear C1 l5
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|comment_at_end:
      >|*@c C1
      >||INFO
      >||spaces_before_argument:
       >||{spaces_before_argument: }
       >|*line_arg C1
       >||INFO
       >||spaces_after_argument:
        >||{spaces_after_argument:\\n}
        >|{rawline_text:- ok, ignored}
     >|spaces_after_argument:
      >|{spaces_after_argument: }
      >{ok}
  *@end C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{junky   - ok, ignored}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {junky   - ok, ignored}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:WRONG - missing @end ifset.}
';


$result_texis{'ifclear_in_ifset_set'} = '
@set a

@end junky   - ok, ignored
@c WRONG - missing @end ifset.
';


$result_texts{'ifclear_in_ifset_set'} = '

';

$result_errors{'ifclear_in_ifset_set'} = '* W l6|unknown @end junky
 warning: unknown @end junky

* E l7|unmatched `@end ifset\'
 unmatched `@end ifset\'

* E l8|expected @end ifclear
 expected @end ifclear

* E l8|expected @end ifset
 expected @end ifset

';

$result_nodes_list{'ifclear_in_ifset_set'} = '';

$result_sections_list{'ifclear_in_ifset_set'} = '';

$result_sectioning_root{'ifclear_in_ifset_set'} = '';

$result_headings_list{'ifclear_in_ifset_set'} = '';

1;
