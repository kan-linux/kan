use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'on_block_command_line'} = '*document_root C1
 *before_node_section C3
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      *@anchor C1 l1
      |EXTRA
      |is_target:{1}
      |normalized:{in-anchor}
       *brace_arg C1
        {in anchor}
     { }
     *@titlefont C1 l1
     |EXTRA
     |global_command_number:{1}
      *brace_container C1
       {in titlefont}
   *multitable_body C1
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C3 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *@titlefont C1 l2
      |EXTRA
      |global_command_number:{2}
       *brace_container C1
        {in titlefont}
      {\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
  {empty_line:\\n}
  *@quotation C2 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C8
     *@indent l5
     {ignorable_spaces_after_command: }
     *@titlefont C1 l5
     |EXTRA
     |global_command_number:{3}
      *brace_container C1
       {in titlefont}
     { }
     *@anchor C1 l5
     |EXTRA
     |is_target:{1}
     |normalized:{in-quotation-anchor}
      *brace_arg C1
       {in quotation anchor}
     *@footnote C1 l5
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {footnote}
     { }
     *@exdent C1 l5
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {exdent}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'on_block_command_line'} = '@multitable {@anchor{in anchor}} @titlefont{in titlefont}
@item @titlefont{in titlefont}
@end multitable

@quotation @indent @titlefont{in titlefont} @anchor{in quotation anchor}@footnote{footnote} @exdent exdent
@end quotation
';


$result_texts{'on_block_command_line'} = 'in titlefont

in titlefont  exdent
';

$result_errors{'on_block_command_line'} = '* W l1|@anchor should not appear on @multitable line
 warning: @anchor should not appear on @multitable line

* W l1|@titlefont should not appear on @multitable line
 warning: @titlefont should not appear on @multitable line

* W l1|unexpected argument on @multitable line: @titlefont{in titlefont}
 warning: unexpected argument on @multitable line: @titlefont{in titlefont}

* W l5|@indent should not appear on @quotation line
 warning: @indent should not appear on @quotation line

* W l5|@titlefont should not appear on @quotation line
 warning: @titlefont should not appear on @quotation line

* W l5|@anchor should not appear on @quotation line
 warning: @anchor should not appear on @quotation line

* W l5|@footnote should not appear on @quotation line
 warning: @footnote should not appear on @quotation line

* W l5|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l5|@exdent should not appear on @quotation line
 warning: @exdent should not appear on @quotation line

';

$result_nodes_list{'on_block_command_line'} = '';

$result_sections_list{'on_block_command_line'} = '';

$result_sectioning_root{'on_block_command_line'} = '';

$result_headings_list{'on_block_command_line'} = '';

1;
