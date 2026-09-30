use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraphindent'} = '*document_root C1
 *before_node_section C19
  *paragraph C1
   {First\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:           }
  *paragraph C1
   {aaa b default\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {asis}
  {empty_line:\\n}
  {spaces_before_paragraph:           }
  *paragraph C1
   {aaa b asis\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0}
  {empty_line:\\n}
  {spaces_before_paragraph:           }
  *paragraph C1
   {aaa b 0\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{7}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {7}
  {empty_line:\\n}
  {spaces_before_paragraph:           }
  *paragraph C1
   {aaa b 7\\n}
';


$result_texis{'paragraphindent'} = 'First

           aaa b default

@paragraphindent asis

           aaa b asis

@paragraphindent 0

           aaa b 0

@paragraphindent 7

           aaa b 7
';


$result_texts{'paragraphindent'} = 'First

aaa b default


aaa b asis


aaa b 0


aaa b 7
';

$result_errors{'paragraphindent'} = '';

$result_nodes_list{'paragraphindent'} = '';

$result_sections_list{'paragraphindent'} = '';

$result_sectioning_root{'paragraphindent'} = '';

$result_headings_list{'paragraphindent'} = '';


$result_converted{'plaintext'}->{'paragraphindent'} = 'First

   aaa b default

           aaa b asis

aaa b 0

       aaa b 7
';

1;
