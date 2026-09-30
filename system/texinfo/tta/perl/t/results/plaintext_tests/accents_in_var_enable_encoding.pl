use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accents_in_var_enable_encoding'} = '*document_root C1
 *before_node_section C3
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {utf-8}
  {empty_line:\\n}
  *paragraph C2
   *@var C1 l3
    *brace_container C6
     {AA}
     *@, C1 l3
      *following_arg C1
       {c}
     { }
     *@u C1 l3
      *brace_container C1
       {r}
     { }
     *@` C1 l3
      *following_arg C1
       {e}
   {.\\n}
';


$result_texis{'accents_in_var_enable_encoding'} = '@documentencoding utf-8

@var{AA@,c @u{r} @`e}.
';


$result_texts{'accents_in_var_enable_encoding'} = '
AAc, r( e`.
';

$result_errors{'accents_in_var_enable_encoding'} = '';

$result_nodes_list{'accents_in_var_enable_encoding'} = '';

$result_sections_list{'accents_in_var_enable_encoding'} = '';

$result_sectioning_root{'accents_in_var_enable_encoding'} = '';

$result_headings_list{'accents_in_var_enable_encoding'} = '';


$result_converted{'plaintext'}->{'accents_in_var_enable_encoding'} = 'AAÇ R̆ È.
';

1;
