use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'spaces_info_lost'} = '*document_root C1
 *before_node_section C3
  *@display C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {text on display line}
   *preformatted C1
    {in bad display\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |text_arg:{display}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {display}
  {empty_line:\\n}
  *@verbatim C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
   {raw:in verbatim @g \\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {verbatim}
';


$result_texis{'spaces_info_lost'} = '@display  text on display line 
in bad display
@end  display 

@verbatim  
in verbatim @g 
@end  verbatim 
';


$result_texts{'spaces_info_lost'} = 'in bad display

in verbatim @g 
';

$result_errors{'spaces_info_lost'} = '* W l1|unexpected argument on @display line: text on display line
 warning: unexpected argument on @display line: text on display line

';

$result_nodes_list{'spaces_info_lost'} = '';

$result_sections_list{'spaces_info_lost'} = '';

$result_sectioning_root{'spaces_info_lost'} = '';

$result_headings_list{'spaces_info_lost'} = '';


$result_converted{'xml'}->{'spaces_info_lost'} = '<display spaces="  " endspaces="  "> 
<pre xml:space="preserve">in bad display
</pre></display> 

<verbatim xml:space="preserve" endspaces="  ">  
in verbatim @g 
</verbatim> 
';

1;
