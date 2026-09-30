use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'alias_table_command'} = '*document_root C1
 *before_node_section C3
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{myalias|code}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {myalias = code}
  {empty_line:\\n}
  *@table C3 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l3
     |INFO
     |alias_of:{myalias}
   *table_entry C1
    *table_term C1
     *@item C1 l4
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {table item (code)}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
';


$result_texis{'alias_table_command'} = '@alias myalias = code

@table @code
@item table item (code)
@end table
';


$result_texts{'alias_table_command'} = '
table item (code)
';

$result_errors{'alias_table_command'} = '';

$result_nodes_list{'alias_table_command'} = '';

$result_sections_list{'alias_table_command'} = '';

$result_sectioning_root{'alias_table_command'} = '';

$result_headings_list{'alias_table_command'} = '';

1;
