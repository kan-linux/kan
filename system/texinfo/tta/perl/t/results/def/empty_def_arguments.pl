use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_def_arguments'} = '*document_root C1
 *before_node_section C1
  *@deffn C10 l1
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
   *@deffnx C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:    \\n}
     *def_category C1
      *def_line_arg C1
       *@b C1 l2
        *brace_container C3
         {id }
         *@samp C1 l2
          *brace_container C1
           {i}
         { ule}
   *@deffnx C1 l3
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
   *@deffnx C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {aaa}
   *@deffnx C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg l5
     {spaces: }
     *def_name C1
      *bracketed_arg l5
   *@deffnx C1 l6
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg l6
   *@deffnx C1 l7
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l7
       {truc}
     {spaces: }
     *def_name C1
      *bracketed_arg l7
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
   *@deffnx C1 l8
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l8
       {truc}
   *@deffnx C1 l9
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg l9
     {spaces: }
     *def_name C1
      *bracketed_arg l9
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


$result_texis{'empty_def_arguments'} = '@deffn fset @var{i} a g
@deffnx @b{id @samp{i} ule}    
@deffnx 
@deffnx aaa
@deffnx {} {}
@deffnx{}
@deffnx{truc} { }
@deffnx{truc}
@deffnx{} {}
@end deffn
';


$result_texts{'empty_def_arguments'} = 'fset: i a g
id i ule: 
aaa: 
: 
: 
truc: 
truc: 
: 
';

$result_errors{'empty_def_arguments'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l2|missing name for @deffnx
 warning: missing name for @deffnx

* W l3|missing category for @deffnx
 warning: missing category for @deffnx

* W l4|missing name for @deffnx
 warning: missing name for @deffnx

* W l5|missing name for @deffnx
 warning: missing name for @deffnx

* W l6|missing name for @deffnx
 warning: missing name for @deffnx

* W l7|missing name for @deffnx
 warning: missing name for @deffnx

* W l8|missing name for @deffnx
 warning: missing name for @deffnx

* W l9|missing name for @deffnx
 warning: missing name for @deffnx

';

$result_nodes_list{'empty_def_arguments'} = '';

$result_sections_list{'empty_def_arguments'} = '';

$result_sectioning_root{'empty_def_arguments'} = '';

$result_headings_list{'empty_def_arguments'} = '';

$result_indices_sort_strings{'empty_def_arguments'} = 'fn:
 i
';

1;
