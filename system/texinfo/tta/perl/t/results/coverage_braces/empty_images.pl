use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_images'} = '*document_root C1
 *before_node_section C10
  *@image C1 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
  {\\n}
  {empty_line:\\n}
  *@image C5 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *brace_arg C1
    {aa}
   *brace_arg C1
    {bb}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {cc}
   *brace_arg C1
    {dd}
  {\\n}
  {empty_line:\\n}
  *@image C4 l5
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    *@ 
  {\\n}
  *@image C4 l6
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    *@:
  {\\n}
';


$result_texis{'empty_images'} = '@image{}

@image{ ,aa,bb,cc ,dd}

@image{,,,@ }
@image{,,,@:}
';


$result_texts{'empty_images'} = '





';

$result_errors{'empty_images'} = '* E l1|@image missing filename argument
 @image missing filename argument

* E l3|@image missing filename argument
 @image missing filename argument

* E l5|@image missing filename argument
 @image missing filename argument

* E l6|@image missing filename argument
 @image missing filename argument

';

$result_nodes_list{'empty_images'} = '';

$result_sections_list{'empty_images'} = '';

$result_sectioning_root{'empty_images'} = '';

$result_headings_list{'empty_images'} = '';

1;
