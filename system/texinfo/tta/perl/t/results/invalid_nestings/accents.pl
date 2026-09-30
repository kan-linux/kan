use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accents'} = '*document_root C1
 *before_node_section C3
  *paragraph C5
   {Valid\\n}
   *@~ C1 l2
    *brace_container C1
     *@TeX C1 l2
      *brace_container
   {. }
   *@~ C1 l2
    *brace_container C1
     *@@
   {.\\n}
  {empty_line:\\n}
  *paragraph C5
   {Invalid\\n}
   *@~ C1 l5
    *brace_container C1
     *@code C1 l5
      *brace_container C1
       {a}
   {.  }
   *@^ C1 l5
    *brace_container C1
     *@anchor C1 l5
     |EXTRA
     |is_target:{1}
     |normalized:{truc}
      *brace_arg C1
       {truc}
   {.\\n}
';


$result_texis{'accents'} = 'Valid
@~{@TeX{}}. @~{@@}.

Invalid
@~{@code{a}}.  @^{@anchor{truc}}.
';


$result_texts{'accents'} = 'Valid
TeX~. @~.

Invalid
a~.  ^.
';

$result_errors{'accents'} = '* W l5|@code should not appear in @~
 warning: @code should not appear in @~

* W l5|@anchor should not appear in @^
 warning: @anchor should not appear in @^

';

$result_nodes_list{'accents'} = '';

$result_sections_list{'accents'} = '';

$result_sectioning_root{'accents'} = '';

$result_headings_list{'accents'} = '';

1;
