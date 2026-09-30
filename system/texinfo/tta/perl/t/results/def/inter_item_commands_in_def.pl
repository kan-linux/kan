use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inter_item_commands_in_def'} = '*document_root C1
 *before_node_section C1
  *@deffn C7 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |*@var C1
       |*brace_container C1
        |{i}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l1
        *brace_container C1
         {i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {g}
   *inter_def_item C2
    *@c C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:comment before first deffnx}
    {empty_line:\\n}
   *@deffnx C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*brace_arg C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |{log trap1}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     *def_category C1
      *def_line_arg C1
       {Command}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l4
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       {log trap1}
     {spaces: }
     *def_arg C1
      *bracketed_arg l4
   *inter_def_item C1
    *index_entry_command@cindex C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {between deffnx}
   *@deffnx C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |*@b C1
       |*brace_container C3
        |{id }
        |*@samp C1
         |*brace_container C1
          |{i}
        |{ ule}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffnx}
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {cmde2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@b C1 l6
        *brace_container C3
         {id }
         *@samp C1 l6
          *brace_container C1
           {i}
         { ule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {truc}
   *def_item C3
    *index_entry_command@cindex C1 l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{cp,2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {cindex in deff item}
    {empty_line:\\n}
    *paragraph C1
     {In deff item.\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
';


$result_texis{'inter_item_commands_in_def'} = '@deffn fset @var{i} a g
@c comment before first deffnx

@deffnx Command { log trap1} {}  
@cindex between deffnx
@deffnx cmde2 @b{id @samp{i} ule} truc
@cindex cindex in deff item

In deff item.
@end deffn
';


$result_texts{'inter_item_commands_in_def'} = 'fset: i a g

Command: log trap1 
cmde2: id i ule truc

In deff item.
';

$result_errors{'inter_item_commands_in_def'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l5|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l6|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l7|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'inter_item_commands_in_def'} = '';

$result_sections_list{'inter_item_commands_in_def'} = '';

$result_sectioning_root{'inter_item_commands_in_def'} = '';

$result_headings_list{'inter_item_commands_in_def'} = '';

$result_indices_sort_strings{'inter_item_commands_in_def'} = 'cp:
 between deffnx
 cindex in deff item
fn:
 i
 id i ule
 log trap1
';


$result_converted{'plaintext'}->{'inter_item_commands_in_def'} = ' -- fset: I a g

 -- Command: log trap1
 -- cmde2: id i ule truc

     In deff item.
';

1;
