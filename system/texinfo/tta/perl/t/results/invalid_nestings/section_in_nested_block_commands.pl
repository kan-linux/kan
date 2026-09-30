use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_in_nested_block_commands'} = '*document_root C2
 *before_node_section C1
  *@table C2 l1
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
    *table_definition C3
     *paragraph C1
      {table line\\n}
     {empty_line:\\n}
     *@quotation C4 l5
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      {empty_line:\\n}
      *paragraph C1
       {in quotation\\n}
      {empty_line:\\n}
 *@section C1 l9 {a section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a section}
';


$result_texis{'section_in_nested_block_commands'} = '@table @strong
@item item
table line

@quotation

in quotation

@section a section
';


$result_texts{'section_in_nested_block_commands'} = 'item
table line


in quotation

1 a section
===========
';

$result_errors{'section_in_nested_block_commands'} = '* E l9|@section seen before @end quotation
 @section seen before @end quotation

* E l9|@section seen before @end table
 @section seen before @end table

';

$result_nodes_list{'section_in_nested_block_commands'} = '';

$result_sections_list{'section_in_nested_block_commands'} = '1|a section
';

$result_sectioning_root{'section_in_nested_block_commands'} = 'level: 1
list:
 1|a section
';

$result_headings_list{'section_in_nested_block_commands'} = '';


$result_converted{'plaintext'}->{'section_in_nested_block_commands'} = '*item*
     table line

          in quotation

1 a section
===========

';


$result_converted{'xml'}->{'section_in_nested_block_commands'} = '<table commandarg="strong" spaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="strong">item</itemformat></item>
</tableterm><tableitem><para>table line
</para>
<quotation>

<para>in quotation
</para>
</quotation>
</tableitem></tableentry></table>
<section spaces=" "><sectiontitle>a section</sectiontitle>
</section>
';

1;
