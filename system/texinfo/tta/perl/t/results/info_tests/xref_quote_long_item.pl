use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'xref_quote_long_item'} = '*document_root C1
 *before_node_section C1
  *@table C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l1
   *before_item C1
    {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@code C1 l3
        *brace_container C2
         *@@
         {verbatiminclude}
    *table_definition C2
     *paragraph C2
      *@xref C4 l4
       *brace_arg C5
       |EXTRA
       |node_content:{Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar@comma{} $configuration_information@comma{} $verbatiminclude)}
        {Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar}
        *@comma C1 l4
         *brace_container
        { $configuration_information}
        *@comma C1 l4
         *brace_container
        { $verbatiminclude)}
       *brace_arg
       *brace_arg C1
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument:\\n}
        {Texinfo::Convert::Utils::expand_verbatiminclude}
       *brace_arg C1
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        {tp_api}
      {.\\n}
     {empty_line:\\n}
   *@end C1 l7
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


$result_texis{'xref_quote_long_item'} = '@table @asis

@item @code{@@verbatiminclude}
@xref{Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar@comma{} $configuration_information@comma{} $verbatiminclude),,
Texinfo::Convert::Utils::expand_verbatiminclude, tp_api}.

@end table
';


$result_texts{'xref_quote_long_item'} = '
@verbatiminclude
Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar, $configuration_information, $verbatiminclude).

';

$result_errors{'xref_quote_long_item'} = '';

$result_nodes_list{'xref_quote_long_item'} = '';

$result_sections_list{'xref_quote_long_item'} = '';

$result_sectioning_root{'xref_quote_long_item'} = '';

$result_headings_list{'xref_quote_long_item'} = '';


$result_converted{'info'}->{'xref_quote_long_item'} = 'This is , produced from .

‘@verbatiminclude’
     *Note Texinfo::Convert::Utils::expand_verbatiminclude:
     (tp_api)Texinfo::Convert::Utils $tree =
     expand_verbatiminclude($registrar, $configuration_information,
     $verbatiminclude).


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'xref_quote_long_item'} = '* W |document without nodes
 warning: document without nodes

';

1;
