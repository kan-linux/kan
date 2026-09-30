use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_added_index_entry'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *@defindex C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{my}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {my}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@node C3 l4 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *index_entry_command@myindex C1 l6
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'empty_added_index_entry'} = '@defindex my

@node Top
@node chap

@myindex
';


$result_texts{'empty_added_index_entry'} = '

';

$result_errors{'empty_added_index_entry'} = '* W l6|@myindex missing argument
 warning: @myindex missing argument

* W l4|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_indices{'empty_added_index_entry'} = 'cp
fn C
ky C
my
pg C
tp C
vr C
';

$result_nodes_list{'empty_added_index_entry'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'empty_added_index_entry'} = '';

$result_sectioning_root{'empty_added_index_entry'} = '';

$result_headings_list{'empty_added_index_entry'} = '';


$result_converted{'info'}->{'empty_added_index_entry'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'empty_added_index_entry'} = '';


$result_converted{'html_text'}->{'empty_added_index_entry'} = '
<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<h4 class="node" id="chap"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

';


$result_converted{'xml'}->{'empty_added_index_entry'} = '<defindex spaces=" " value="my" line="my"></defindex>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

';

1;
