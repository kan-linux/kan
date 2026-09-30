use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_between_text'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {text\\n}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:comment}
   {end para}
';


$result_texis{'comment_between_text'} = 'text
@c comment
end para';


$result_texts{'comment_between_text'} = 'text
end para';

$result_errors{'comment_between_text'} = '';

$result_nodes_list{'comment_between_text'} = '';

$result_sections_list{'comment_between_text'} = '';

$result_sectioning_root{'comment_between_text'} = '';

$result_headings_list{'comment_between_text'} = '';


$result_converted{'plaintext'}->{'comment_between_text'} = 'text end para
';


$result_converted{'html_text'}->{'comment_between_text'} = '<p>text
end para</p>';

1;
