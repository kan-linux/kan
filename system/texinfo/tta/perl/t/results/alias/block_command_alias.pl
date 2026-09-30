use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'block_command_alias'} = '*document_root C1
 *before_node_section C3
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{lang|lisp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {lang=lisp}
  {empty_line:\\n}
  *@lisp C2 l3
  |INFO
  |alias_of:{lang}
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {in lang\\n}
    *@end C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{lang}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {lang}
';


$result_texis{'block_command_alias'} = '@alias lang=lisp

@lisp
in lang
@end lang
';


$result_texts{'block_command_alias'} = '
in lang
';

$result_errors{'block_command_alias'} = '* W l1|environment command lisp as argument to @alias
 warning: environment command lisp as argument to @alias

* W l5|unknown @end lang
 warning: unknown @end lang

* E l3|no matching `@end lisp\'
 no matching `@end lisp\'

';

$result_nodes_list{'block_command_alias'} = '';

$result_sections_list{'block_command_alias'} = '';

$result_sectioning_root{'block_command_alias'} = '';

$result_headings_list{'block_command_alias'} = '';

1;
