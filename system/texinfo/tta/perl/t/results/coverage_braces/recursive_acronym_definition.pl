use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_acronym_definition'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@acronym C2 l1
    *brace_arg C1
     {GNU}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@acronym C2 l1
      *brace_arg C1
       {GNU}
      *brace_arg C2
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *@acronym C2 l1
        *brace_arg C1
         {GNU}
        *brace_arg C1
        |INFO
        |spaces_before_argument:
         |{spaces_before_argument: }
         {is something}
       {\'s Not Unix}
     {\'s Not Unix}
   {\\n}
';


$result_texis{'recursive_acronym_definition'} = '@acronym{GNU, @acronym{GNU, @acronym{GNU, is something}\'s Not Unix}\'s Not Unix}
';


$result_texts{'recursive_acronym_definition'} = 'GNU (GNU (GNU (is something)\'s Not Unix)\'s Not Unix)
';

$result_errors{'recursive_acronym_definition'} = '';

$result_nodes_list{'recursive_acronym_definition'} = '';

$result_sections_list{'recursive_acronym_definition'} = '';

$result_sectioning_root{'recursive_acronym_definition'} = '';

$result_headings_list{'recursive_acronym_definition'} = '';


$result_converted{'plaintext'}->{'recursive_acronym_definition'} = 'GNU (GNU (GNU (is something)\'s Not Unix)\'s Not Unix)
';


$result_converted{'html_text'}->{'recursive_acronym_definition'} = '<p><abbr class="acronym" title="GNU (GNU (is something)&rsquo;s Not Unix)&rsquo;s Not Unix">GNU</abbr> (<abbr class="acronym" title="GNU (is something)&rsquo;s Not Unix">GNU</abbr> (<abbr class="acronym" title="is something">GNU</abbr> (is something)&rsquo;s Not Unix)&rsquo;s Not Unix)
</p>';


$result_converted{'latex_text'}->{'recursive_acronym_definition'} = 'GNU (GNU (GNU (is something)\'s Not Unix)\'s Not Unix)
';


$result_converted{'docbook'}->{'recursive_acronym_definition'} = '<para><acronym>GNU</acronym> (<acronym>GNU</acronym> (<acronym>GNU</acronym> (is something)&#8217;s Not Unix)&#8217;s Not Unix)
</para>';

1;
