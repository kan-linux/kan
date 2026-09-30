use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_acronym'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@acronym C2 l1
    *brace_arg C1
     {GNU}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@acronym C1 l1
      *brace_arg C1
       {GNU}
     {\'s Not Unix}
   {\\n}
';


$result_texis{'recursive_acronym'} = '@acronym{GNU, @acronym{GNU}\'s Not Unix}
';


$result_texts{'recursive_acronym'} = 'GNU (GNU\'s Not Unix)
';

$result_errors{'recursive_acronym'} = '';

$result_nodes_list{'recursive_acronym'} = '';

$result_sections_list{'recursive_acronym'} = '';

$result_sectioning_root{'recursive_acronym'} = '';

$result_headings_list{'recursive_acronym'} = '';


$result_converted{'plaintext'}->{'recursive_acronym'} = 'GNU (GNU\'s Not Unix)
';


$result_converted{'html_text'}->{'recursive_acronym'} = '<p><abbr class="acronym" title="GNU&rsquo;s Not Unix">GNU</abbr> (<abbr class="acronym">GNU</abbr>&rsquo;s Not Unix)
</p>';


$result_converted{'latex_text'}->{'recursive_acronym'} = 'GNU (GNU\'s Not Unix)
';


$result_converted{'docbook'}->{'recursive_acronym'} = '<para><acronym>GNU</acronym> (<acronym>GNU</acronym>&#8217;s Not Unix)
</para>';

1;
