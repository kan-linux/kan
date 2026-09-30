use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'value_after_brace_command'} = '*document_root C1
 *before_node_section C4
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{bracedletter|{a}}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:bracedletter {a}}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{unknowncmd|@unknown}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:unknowncmd @unknown}
  {empty_line:\\n}
  *paragraph C12
   *@ringaccent C1 l4
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;1><p:1>{{a}}
     |>*@value C1
      |>*brace_container C1
       |>{bracedletter}
   >SOURCEMARKS
   >value_expansion<end;1>
    *brace_container C1
     {a}
   {\\n}
   *@ringaccent l5
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;2><p:1>{@unknown}
     |>*@value C1
      |>*brace_container C1
       |>{unknowncmd}
   >SOURCEMARKS
   >value_expansion<end;2>
   {\\n}
   *@^ C1 l6
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;3><p:1>{{a}}
     |>*@value C1
      |>*brace_container C1
       |>{bracedletter}
   >SOURCEMARKS
   >value_expansion<end;3>
    *brace_container C1
     {a}
   {\\n}
   *@^ l7
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;4><p:1>{@unknown}
     |>*@value C1
      |>*brace_container C1
       |>{unknowncmd}
   >SOURCEMARKS
   >value_expansion<end;4>
   {\\n}
   *@code C1 l8
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;5><p:1>{{a}}
     |>*@value C1
      |>*brace_container C1
       |>{bracedletter}
   >SOURCEMARKS
   >value_expansion<end;5>
    *brace_container C1
     {a}
   {\\n}
   *@code l9
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;6><p:1>{@unknown}
     |>*@value C1
      |>*brace_container C1
       |>{unknowncmd}
   >SOURCEMARKS
   >value_expansion<end;6>
   {\\n}
';


$result_texis{'value_after_brace_command'} = '@set bracedletter {a}
@set unknowncmd @unknown

@ringaccent {a}
@ringaccent 
@^ {a}
@^ 
@code {a}
@code 
';


$result_texts{'value_after_brace_command'} = '
a*
*
a^
^
a

';

$result_errors{'value_after_brace_command'} = '* E l5|@ringaccent expected braces
 @ringaccent expected braces

* E l5|unknown command `unknown\'
 unknown command `unknown\'

* E l7|@^ expected braces
 @^ expected braces

* E l7|unknown command `unknown\'
 unknown command `unknown\'

* E l9|@code expected braces
 @code expected braces

* E l9|unknown command `unknown\'
 unknown command `unknown\'

';

$result_nodes_list{'value_after_brace_command'} = '';

$result_sections_list{'value_after_brace_command'} = '';

$result_sectioning_root{'value_after_brace_command'} = '';

$result_headings_list{'value_after_brace_command'} = '';

1;
