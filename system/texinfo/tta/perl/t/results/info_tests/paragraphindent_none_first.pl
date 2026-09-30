use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraphindent_none_first'} = '*document_root C1
 *before_node_section C11
  {empty_line:\\n}
  {spaces_before_paragraph:      }
  *paragraph C1
   {first\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:      }
  *paragraph C1
   {second\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{none}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {none}
  {empty_line:\\n}
  {spaces_before_paragraph:      }
  *paragraph C1
   {after none\\n}
';


$result_texis{'paragraphindent_none_first'} = '
      first

      second

@paragraphindent none

      after none
';


$result_texts{'paragraphindent_none_first'} = '
first

second


after none
';

$result_errors{'paragraphindent_none_first'} = '';

$result_nodes_list{'paragraphindent_none_first'} = '';

$result_sections_list{'paragraphindent_none_first'} = '';

$result_sectioning_root{'paragraphindent_none_first'} = '';

$result_headings_list{'paragraphindent_none_first'} = '';


$result_converted{'info'}->{'paragraphindent_none_first'} = 'This is , produced from .

first

   second

after none

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'paragraphindent_none_first'} = '* W |document without nodes
 warning: document without nodes

';

1;
