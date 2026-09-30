use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'quotation_author'} = '*document_root C1
 *before_node_section C1
  *@quotation C6 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *@author C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {First Author}
   *paragraph C3
    {quotation\\n}
    *@author C1 l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
     *line_arg C3
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {S}
      *@~ C1 l5
       *following_arg C1
        {e}
      {cond author}
    {quotation continues.\\n}
   {empty_line:\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'quotation_author'} = '@quotation

@author First Author
quotation
@author S@~econd author
quotation continues.

@end quotation
';


$result_texts{'quotation_author'} = '
First Author
quotation
Se~cond author
quotation continues.

';

$result_errors{'quotation_author'} = '';

$result_nodes_list{'quotation_author'} = '';

$result_sections_list{'quotation_author'} = '';

$result_sectioning_root{'quotation_author'} = '';

$result_headings_list{'quotation_author'} = '';


$result_converted{'plaintext'}->{'quotation_author'} = '     quotation quotation continues.

                           -- _First Author_
                          -- _Sẽcond author_
';


$result_converted{'html_text'}->{'quotation_author'} = '<blockquote class="quotation">

<p>quotation
quotation continues.
</p>
</blockquote>
<div class="center">&mdash; <em class="emph">First Author</em>
</div><div class="center">&mdash; <em class="emph">S&#7869;cond author</em>
</div>';


$result_converted{'xml'}->{'quotation_author'} = '<quotation endspaces=" ">

<author spaces=" ">First Author</author>
<para>quotation
<author spaces=" ">S<accent type="tilde" bracketed="off">e</accent>cond author</author>
quotation continues.
</para>
</quotation>
';


$result_converted{'latex_text'}->{'quotation_author'} = '\\begin{quote}

quotation
quotation continues.

\\end{quote}
\\begin{center}
--- \\emph{First Author}
\\end{center}
\\begin{center}
--- \\emph{S\\~{e}cond author}
\\end{center}
';


$result_converted{'docbook'}->{'quotation_author'} = '<blockquote><attribution>First Author</attribution>
<attribution>S&#7869;cond author</attribution>

<para>quotation
quotation continues.
</para>
</blockquote>';

1;
