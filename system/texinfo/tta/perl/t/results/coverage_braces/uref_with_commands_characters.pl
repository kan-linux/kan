use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'uref_with_commands_characters'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@uref C2 l1
    *brace_arg C9
     {http://my-host.com/~}
     *@strong C1 l1
      *brace_container C1
       {toto}
     {%5Cs\'q"a&e?b}
     *@}
     {b}
     *@{
     {ba}
     *@@
     {s\\s p+h#aaa}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {see that }
     *@strong C1 l1
      *brace_container C1
       *@LaTeX C1 l1
        *brace_container
   {\\n}
';


$result_texis{'uref_with_commands_characters'} = '@uref{http://my-host.com/~@strong{toto}%5Cs\'q"a&e?b@}b@{ba@@s\\s p+h#aaa, see that @strong{@LaTeX{}}}
';


$result_texts{'uref_with_commands_characters'} = 'http://my-host.com/~toto%5Cs\'q"a&e?b}b{ba@s\\s p+h#aaa (see that LaTeX)
';

$result_errors{'uref_with_commands_characters'} = '';

$result_nodes_list{'uref_with_commands_characters'} = '';

$result_sections_list{'uref_with_commands_characters'} = '';

$result_sectioning_root{'uref_with_commands_characters'} = '';

$result_headings_list{'uref_with_commands_characters'} = '';


$result_converted{'plaintext'}->{'uref_with_commands_characters'} = 'see that *LaTeX* (http://my-host.com/~*toto*%5Cs\'q"a&e?b}b{ba@s\\s
p+h#aaa)
';


$result_converted{'html_text'}->{'uref_with_commands_characters'} = '<p><a class="uref" href="http://my-host.com/~toto%5Cs\'q%22a&amp;e?b%7db%7bba@s%5cs%20p+h#aaa">see that <strong class="strong">LaTeX</strong></a>
</p>';


$result_converted{'latex_text'}->{'uref_with_commands_characters'} = '\\href{http://my-host.com/~toto\\%5Cs\'q"a&e?b\\}b\\{ba@s\\\\s p+h\\#aaa}{see that \\textbf{\\LaTeX{}} (\\nolinkurl{http://my-host.com/~toto\\%5Cs\'q"a&e?b\\}b\\{ba@s\\\\s p+h\\#aaa})}
';


$result_converted{'docbook'}->{'uref_with_commands_characters'} = '<para><ulink url="http://my-host.com/~toto%5Cs\'q&quot;a&amp;e?b}b{ba@s\\s p+h#aaa">see that <emphasis role="bold">&latex;</emphasis></ulink>
</para>';

1;
