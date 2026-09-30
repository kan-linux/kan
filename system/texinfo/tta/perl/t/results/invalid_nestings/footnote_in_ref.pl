use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_in_ref'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *paragraph C1
   *@xref C2 l3
    *brace_arg C1
     {first}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Text}
     *@footnote C1 l3
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C3
       *paragraph C1
        {First para\\n}
       {empty_line:\\n}
       *paragraph C1
        {seond para}
     {.}
';


$result_texis{'footnote_in_ref'} = '@node first

@xref{first, Text@footnote{First para

seond para}.}';


$result_texts{'footnote_in_ref'} = '
first';

$result_errors{'footnote_in_ref'} = '* W l3|@footnote should not appear anywhere inside @xref
 warning: @footnote should not appear anywhere inside @xref

* E l3|@xref missing closing brace
 @xref missing closing brace

';

$result_nodes_list{'footnote_in_ref'} = '1|first
';

$result_sections_list{'footnote_in_ref'} = '';

$result_sectioning_root{'footnote_in_ref'} = '';

$result_headings_list{'footnote_in_ref'} = '';

1;
