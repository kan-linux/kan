use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ignored_text'} = '*document_root C2
 *before_node_section
 *@node C2 l1 {before ignore}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{before-ignore}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    |>SOURCEMARKS
    |>ignored_conditional_block<1><p:1>
     |>*@ifinfo C1 l1
      |>*arguments_line C1
       |>*block_line_arg
       |>|INFO
       |>|spaces_after_argument:
        |>|{spaces_after_argument:\\n}
    {before ignore}
  *paragraph C1
   {in ifinfo\\n}
';


$result_texis{'ignored_text'} = '@node before ignore in ifinfo
';


$result_texts{'ignored_text'} = 'in ifinfo
';

$result_errors{'ignored_text'} = '* W l1|@ifinfo should only appear at the beginning of a line
 warning: @ifinfo should only appear at the beginning of a line

* E l1|no matching `@end ifinfo\'
 no matching `@end ifinfo\'

* E l3|bad argument to @end: ifinfo on the node line
 bad argument to @end: ifinfo on the node line

* E l3|unmatched `@end ifinfo\'
 unmatched `@end ifinfo\'

';

$result_nodes_list{'ignored_text'} = '1|before ignore
';

$result_sections_list{'ignored_text'} = '';

$result_sectioning_root{'ignored_text'} = '';

$result_headings_list{'ignored_text'} = '';


$result_converted{'plaintext'}->{'ignored_text'} = 'in ifinfo
';


$result_converted{'xml'}->{'ignored_text'} = '<node identifier="before-ignore" spaces=" "><nodename trailingspaces=" ">before ignore</nodename></node><para>in ifinfo
</para>';

1;
