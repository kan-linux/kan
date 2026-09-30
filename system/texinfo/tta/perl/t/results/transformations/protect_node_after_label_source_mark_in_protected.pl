use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_node_after_label_source_mark_in_protected'} = '*document_root C1
 *before_node_section C5
  *@macro C3 l1
  |EXTRA
  |macro_name:{vvv}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: vvv {}\\n}
   {raw:some text .,\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{punct|,.}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:punct ,.}
  {empty_line:\\n}
  *paragraph C5
   {There is some text }
   >SOURCEMARKS
   >macro_expansion<start;1><p:9>
    >*macro_call@vvv C1
     >*brace_arg
   *@asis C1
    *brace_container C1
     {.,,,..}
     >SOURCEMARKS
     >macro_expansion<end;1><p:2>
     >value_expansion<start;1><p:3>{,.}
      >*@value C1
       >*brace_container C1
        >{punct}
     >value_expansion<end;1><p:5>
   { and after}
   *@asis C1
    *brace_container C1
     {.}
   {\\n}
';


$result_texis{'protect_node_after_label_source_mark_in_protected'} = '@macro vvv {}
some text .,
@end macro

@set punct ,.

There is some text @asis{.,,,..} and after@asis{.}
';


$result_texts{'protect_node_after_label_source_mark_in_protected'} = '

There is some text .,,,.. and after.
';

$result_errors{'protect_node_after_label_source_mark_in_protected'} = '';

$result_nodes_list{'protect_node_after_label_source_mark_in_protected'} = '';

$result_sections_list{'protect_node_after_label_source_mark_in_protected'} = '';

$result_sectioning_root{'protect_node_after_label_source_mark_in_protected'} = '';

$result_headings_list{'protect_node_after_label_source_mark_in_protected'} = '';

1;
