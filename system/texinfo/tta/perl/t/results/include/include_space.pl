use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_space'} = '*document_root C1
 *before_node_section C2
  {}
  >SOURCEMARKS
  >include<start;1>
   >*@include C1 l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{inc_file.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:  \\n}
     >{inc_file.texi}
  *paragraph C1
   {In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
';


$result_texis{'include_space'} = 'In included file.
';


$result_texts{'include_space'} = 'In included file.
';

$result_errors{'include_space'} = '';

$result_nodes_list{'include_space'} = '';

$result_sections_list{'include_space'} = '';

$result_sectioning_root{'include_space'} = '';

$result_headings_list{'include_space'} = '';

1;
