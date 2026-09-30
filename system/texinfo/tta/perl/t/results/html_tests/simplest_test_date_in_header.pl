use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'simplest_test_date_in_header'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C4 simplest.texi:l3 {Top}
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
  {empty_line:\\n}
  *paragraph C3
   {This is a very simple texi manual }
   *@ 
   { <>.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'simplest_test_date_in_header'} = '\\input texinfo @c -*-texinfo-*-

@node Top

This is a very simple texi manual @  <>.

@bye
';


$result_texts{'simplest_test_date_in_header'} = '
This is a very simple texi manual   <>.

';

$result_errors{'simplest_test_date_in_header'} = '';

$result_nodes_list{'simplest_test_date_in_header'} = '1|Top
';

$result_sections_list{'simplest_test_date_in_header'} = '';

$result_sectioning_root{'simplest_test_date_in_header'} = '';

$result_headings_list{'simplest_test_date_in_header'} = '';

$result_converted_errors{'file_html'}->{'simplest_test_date_in_header'} = '* W simplest.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
