use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'on_index_entry_line'} = '*document_root C1
 *before_node_section C1
  *index_entry_command@cindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C8
    *@indent l1
    {ignorable_spaces_after_command: }
    *@titlefont C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {in titlefont}
    { }
    *@anchor C1 l1
    |EXTRA
    |is_target:{1}
    |normalized:{in-anchor}
     *brace_arg C1
      {in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {footnote}
    { }
    *@exdent C1 l1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {exdent}
';


$result_texis{'on_index_entry_line'} = '@cindex @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_index_entry_line'} = '';

$result_errors{'on_index_entry_line'} = '* W l1|@indent should not appear on @cindex line
 warning: @indent should not appear on @cindex line

* W l1|@titlefont should not appear on @cindex line
 warning: @titlefont should not appear on @cindex line

* W l1|@anchor should not appear on @cindex line
 warning: @anchor should not appear on @cindex line

* W l1|@footnote should not appear on @cindex line
 warning: @footnote should not appear on @cindex line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @cindex line
 warning: @exdent should not appear on @cindex line

* W l1|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'on_index_entry_line'} = '';

$result_sections_list{'on_index_entry_line'} = '';

$result_sectioning_root{'on_index_entry_line'} = '';

$result_headings_list{'on_index_entry_line'} = '';

$result_indices_sort_strings{'on_index_entry_line'} = 'cp:
 in titlefont  exdent

';

1;
