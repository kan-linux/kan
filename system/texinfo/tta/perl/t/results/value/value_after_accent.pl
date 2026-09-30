use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'value_after_accent'} = '*document_root C1
 *before_node_section C2
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{a_letter|a}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:a_letter a}
  *paragraph C3
   *@ringaccent C1 l2
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    |>SOURCEMARKS
    |>value_expansion<start;1><p:1>{a}
     |>*@value C1
      |>*brace_container C1
       |>{a_letter}
   >SOURCEMARKS
   >value_expansion<end;1>
    *following_arg C1
     {a}
   {\\n}
   *@~ C1 l3
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>value_expansion<start;2>{a}
     |>*@value C1
      |>*brace_container C1
       |>{a_letter}
   >SOURCEMARKS
   >value_expansion<end;2>
    *following_arg C1
     {a}
';


$result_texis{'value_after_accent'} = '@set a_letter a
@ringaccent a
@~a';


$result_texts{'value_after_accent'} = 'a*
a~';

$result_errors{'value_after_accent'} = '';

$result_nodes_list{'value_after_accent'} = '';

$result_sections_list{'value_after_accent'} = '';

$result_sectioning_root{'value_after_accent'} = '';

$result_headings_list{'value_after_accent'} = '';

1;
