use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_alias'} = '*document_root C1
 *before_node_section C9
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{new|strong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new = strong}
  {empty_line:\\n}
  *@alias C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{other|new}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {other = new}
  {empty_line:\\n}
  *@alias C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{strong|other}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {strong = other}
  {empty_line:\\n}
  *paragraph C2
   *@strong C1 l7
   |INFO
   |alias_of:{other}
    *brace_container C1
     {aa}
   {.\\n}
  {empty_line:\\n}
  *paragraph C1
   {bb.\\n}
';


$result_texis{'recursive_alias'} = '@alias new = strong

@alias other = new

@alias strong = other

@strong{aa}.

bb.
';


$result_texts{'recursive_alias'} = '


aa.

bb.
';

$result_errors{'recursive_alias'} = '* W l5|recursive alias definition of strong through other ignored
 warning: recursive alias definition of strong through other ignored

* E l9|unknown command `other\'
 unknown command `other\'

* E l9|misplaced {
 misplaced {

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'recursive_alias'} = '';

$result_sections_list{'recursive_alias'} = '';

$result_sectioning_root{'recursive_alias'} = '';

$result_headings_list{'recursive_alias'} = '';


$result_converted{'plaintext'}->{'recursive_alias'} = '*aa*.

   bb.
';

1;
