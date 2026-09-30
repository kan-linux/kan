use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_frenchspacing'} = '*document_root C1
 *before_node_section C13
  *@frenchspacing C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  {empty_line:\\n}
  *paragraph C1
   {Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.\\n}
  {empty_line:\\n}
  *paragraph C4
   {End of lines Dot.\\n}
   {Exclam!\\n}
   {Question?\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C5
   {End of lines and spaces\\n}
   {Dot.\\n}
   {Exclam!\\n}
   {Question?\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C1
   {With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.\\n}
  {empty_line:\\n}
  *paragraph C3
   {End of lines paren.)\\n}
   {Symb.)"\']\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C3
   {End of lines and spaces paren.)\\n}
   {Symb.)"\']\\n}
   {End.\\n}
';


$result_texis{'punctuation_frenchspacing'} = '@frenchspacing on

Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

End of lines Dot.
Exclam!
Question?
End.

End of lines and spaces
Dot.
Exclam!
Question?
End.

With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.

End of lines paren.)
Symb.)"\']
End.

End of lines and spaces paren.)
Symb.)"\']
End.
';


$result_texts{'punctuation_frenchspacing'} = '
Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

End of lines Dot.
Exclam!
Question?
End.

End of lines and spaces
Dot.
Exclam!
Question?
End.

With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.

End of lines paren.)
Symb.)"\']
End.

End of lines and spaces paren.)
Symb.)"\']
End.
';

$result_errors{'punctuation_frenchspacing'} = '';

$result_nodes_list{'punctuation_frenchspacing'} = '';

$result_sections_list{'punctuation_frenchspacing'} = '';

$result_sectioning_root{'punctuation_frenchspacing'} = '';

$result_headings_list{'punctuation_frenchspacing'} = '';


$result_converted{'plaintext'}->{'punctuation_frenchspacing'} = 'Dot. Exclam! Question? Dot. Exclam! Question? GAAA.

   End of lines Dot. Exclam! Question? End.

   End of lines and spaces Dot. Exclam! Question? End.

   With paren.) paren.) Symb.)"\'] Symb.)"\'] End.

   End of lines paren.) Symb.)"\'] End.

   End of lines and spaces paren.) Symb.)"\'] End.
';

1;
