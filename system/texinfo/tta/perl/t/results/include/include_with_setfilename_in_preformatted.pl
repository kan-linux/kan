use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_with_setfilename_in_preformatted'} = '*document_root C1
 *before_node_section C1
  *@example C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted
   >SOURCEMARKS
   >include<start;1>
    >*@include C1 l2
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{included_file_with_setfilename.texi}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
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
   *preformatted C3
    {empty_line:\\n}
    {In included file.\\n}
    >SOURCEMARKS
    >include<end;1><p:18>
    {after include\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
     {example}
';


$result_texis{'include_with_setfilename_in_preformatted'} = '@example

In included file.
after include
@end example';


$result_texts{'include_with_setfilename_in_preformatted'} = '
In included file.
after include
';

$result_errors{'include_with_setfilename_in_preformatted'} = '';

$result_nodes_list{'include_with_setfilename_in_preformatted'} = '';

$result_sections_list{'include_with_setfilename_in_preformatted'} = '';

$result_sectioning_root{'include_with_setfilename_in_preformatted'} = '';

$result_headings_list{'include_with_setfilename_in_preformatted'} = '';


$result_converted{'info'}->{'include_with_setfilename_in_preformatted'} = 'This is , produced from .


     In included file.
     after include

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'include_with_setfilename_in_preformatted'} = '* W |document without nodes
 warning: document without nodes

';

1;
