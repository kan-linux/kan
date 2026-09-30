use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_with_setfilename'} = '*document_root C1
 *before_node_section C4
  {}
  >SOURCEMARKS
  >include<start;1>
   >*@include C1 l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{included_file_with_setfilename.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument: \\n}
     >{included_file_with_setfilename.texi}
  >setfilename<1>
   >*@setfilename C1 included_file_with_setfilename.texi:l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{included_file.info}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{included_file.info}
  {empty_line:\\n}
  *paragraph C1
   {In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
  *@setfilename C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{include_with_setfilename.info}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {include_with_setfilename.info}
';


$result_texis{'include_with_setfilename'} = '
In included file.
@setfilename include_with_setfilename.info
';


$result_texts{'include_with_setfilename'} = '
In included file.
';

$result_errors{'include_with_setfilename'} = '';

$result_nodes_list{'include_with_setfilename'} = '';

$result_sections_list{'include_with_setfilename'} = '';

$result_sectioning_root{'include_with_setfilename'} = '';

$result_headings_list{'include_with_setfilename'} = '';


$result_converted{'info'}->{'include_with_setfilename'} = 'This is include_with_setfilename.info, produced from .

In included file.

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'include_with_setfilename'} = '* W |document without nodes
 warning: document without nodes

';

1;
