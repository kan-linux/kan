use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_deftypeop_name'} = '*document_root C1
 *before_node_section C1
  *@deftypeop C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deftypeop}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C2
       {Command}
       *@code C1 l1
        *brace_container C1
         {com}
     {spaces: }
     *def_class C1
      *bracketed_arg C2 l1
       {Window}
       *@code C1 l1
        *brace_container C1
         {int}
     {spaces: }
     *def_type C1
      *def_line_arg C2
       {expose}
       *@var C1 l1
        *brace_container C1
         {exp}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypeop}
';


$result_texis{'empty_deftypeop_name'} = '@deftypeop Command@code{com} {Window@code{int}} expose@var{exp}
@end deftypeop
';


$result_texts{'empty_deftypeop_name'} = 'Commandcom on Windowint: exposeexp 
';

$result_errors{'empty_deftypeop_name'} = '* W l1|missing name for @deftypeop
 warning: missing name for @deftypeop

';

$result_nodes_list{'empty_deftypeop_name'} = '';

$result_sections_list{'empty_deftypeop_name'} = '';

$result_sectioning_root{'empty_deftypeop_name'} = '';

$result_headings_list{'empty_deftypeop_name'} = '';

1;
