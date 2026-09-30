use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'w_argument'} = '*document_root C1
 *before_node_section C1
  *@itemize C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@w C1 l1
      *brace_container
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     *@option C1 l2
      *brace_container C1
       {--build=}
     { platform on which the program is compiled,\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C2
     *@option C1 l3
      *brace_container C1
       {--target=}
     { target platform on which the program is processed.\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
';


$result_texis{'w_argument'} = '@itemize @w{}
@item @option{--build=} platform on which the program is compiled,
@item @option{--target=} target platform on which the program is processed.
@end itemize
';


$result_texts{'w_argument'} = '--build= platform on which the program is compiled,
--target= target platform on which the program is processed.
';

$result_errors{'w_argument'} = '';

$result_nodes_list{'w_argument'} = '';

$result_sections_list{'w_argument'} = '';

$result_sectioning_root{'w_argument'} = '';

$result_headings_list{'w_argument'} = '';


$result_converted{'plaintext'}->{'w_argument'} = '     ‘--build=’ platform on which the program is compiled,
     ‘--target=’ target platform on which the program is processed.
';


$result_converted{'html_text'}->{'w_argument'} = '<ul class="itemize mark-none">
<li><samp class="option">--build=</samp> platform on which the program is compiled,
</li><li><samp class="option">--target=</samp> target platform on which the program is processed.
</li></ul>
';


$result_converted{'xml'}->{'w_argument'} = '<itemize commandarg="w" spaces=" " endspaces=" "><itemprepend><w></w></itemprepend>
<listitem><prepend><w></w></prepend> <para><option>--build=</option> platform on which the program is compiled,
</para></listitem><listitem><prepend><w></w></prepend> <para><option>--target=</option> target platform on which the program is processed.
</para></listitem></itemize>
';


$result_converted{'latex_text'}->{'w_argument'} = '\\begin{itemize}[label={}]
\\item \\texttt{{-}{-}build=} platform on which the program is compiled,
\\item \\texttt{{-}{-}target=} target platform on which the program is processed.
\\end{itemize}
';

1;
