use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'itemx_in_itemize_enumerate_in_table'} = '*document_root C1
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
     *@strong l1
   *table_entry C2
    *table_term C1
     *@item C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
    *table_definition C6
     {empty_line:\\n}
     *paragraph C1
      {In item, nested itemize\\n}
     *@itemize C3 l5
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *before_item C1
       *@itemx C1 l6
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {in nested itemize itemx}
      *@end C1 l7
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{itemize}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {itemize}
     {empty_line:\\n}
     *@enumerate C3 l9
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *before_item C1
       *@itemx C1 l10
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {in nested enumerate itemx}
      *@end C1 l11
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{enumerate}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {enumerate}
     {empty_line:\\n}
   *@end C1 l13
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


$result_texis{'itemx_in_itemize_enumerate_in_table'} = '@table @strong
@item item

In item, nested itemize
@itemize
@itemx in nested itemize itemx
@end itemize

@enumerate
@itemx in nested enumerate itemx
@end enumerate

@end table
';


$result_texts{'itemx_in_itemize_enumerate_in_table'} = 'item

In item, nested itemize
in nested itemize itemx

in nested enumerate itemx

';

$result_errors{'itemx_in_itemize_enumerate_in_table'} = '* E l6|@itemx outside of table or list
 @itemx outside of table or list

* W l5|@itemize has text but no @item
 warning: @itemize has text but no @item

* E l10|@itemx outside of table or list
 @itemx outside of table or list

* W l9|@enumerate has text but no @item
 warning: @enumerate has text but no @item

';

$result_nodes_list{'itemx_in_itemize_enumerate_in_table'} = '';

$result_sections_list{'itemx_in_itemize_enumerate_in_table'} = '';

$result_sectioning_root{'itemx_in_itemize_enumerate_in_table'} = '';

$result_headings_list{'itemx_in_itemize_enumerate_in_table'} = '';


$result_converted{'plaintext'}->{'itemx_in_itemize_enumerate_in_table'} = '*item*

     In item, nested itemize
     in nested itemize itemx

     in nested enumerate itemx

';


$result_converted{'xml'}->{'itemx_in_itemize_enumerate_in_table'} = '<table commandarg="strong" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="strong">item</itemformat></item>
</tableterm><tableitem>
<para>In item, nested itemize
</para><itemize endspaces=" ">
<beforefirstitem><itemx spaces=" ">in nested itemize itemx</itemx>
</beforefirstitem></itemize>

<enumerate first="1" endspaces=" ">
<beforefirstitem><itemx spaces=" ">in nested enumerate itemx</itemx>
</beforefirstitem></enumerate>

</tableitem></tableentry></table>
';

1;
