use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_in_removed_before_item'} = '*document_root C1
 *before_node_section C1
  *@table C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l1
   *table_entry C1
    *table_term C3
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     >SOURCEMARKS
     >include<start;1>
      >*@include C1 l3
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
      >|EXTRA
      >|text_arg:{only_comment.texi}
       >*line_arg C1
       >|INFO
       >|spaces_after_argument:
        >|{spaces_after_argument:\\n}
        >{only_comment.texi}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:source mark holder comment}
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     >SOURCEMARKS
     >include<end;1>
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:in here}
     *@item C1 l4
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {FOO}
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


$result_texis{'include_in_removed_before_item'} = '@table @code
@c source mark holder comment
@c in here
@item FOO
@end table
';


$result_texts{'include_in_removed_before_item'} = 'FOO
';

$result_errors{'include_in_removed_before_item'} = '';

$result_nodes_list{'include_in_removed_before_item'} = '';

$result_sections_list{'include_in_removed_before_item'} = '';

$result_sectioning_root{'include_in_removed_before_item'} = '';

$result_headings_list{'include_in_removed_before_item'} = '';

1;
