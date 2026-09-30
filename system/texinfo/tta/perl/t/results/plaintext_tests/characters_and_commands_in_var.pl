use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'characters_and_commands_in_var'} = '*document_root C1
 *before_node_section C7
  *paragraph C8
   *@var C1 l1
    *brace_container C1
     {aaa}
   {. }
   *@var C1 l1
    *brace_container C1
     {dlksfjf ) }
   {. }
   *@var C1 l1
    *brace_container C1
     {(fdfdsfsd}
   {. }
   *@var C1 l1
    *brace_container C1
     {sqdq,qdsdsq}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@var C1 l3
    *brace_container C3
     {somethingf  }
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:]}
     {vvar}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@var C1 l6
    *brace_container C8
     {AA}
     *@, C1 l6
      *following_arg C1
       {c}
     { }
     *@u C1 l6
      *brace_container C1
       {r}
     { }
     *@` C1 l6
      *following_arg C1
       {e}
     { }
     *@aa C1 l6
      *brace_container
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {AAA}
   *@footnote C1 l8
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C6
      {jdhfmqsdf\\n}
      {dsf\\n}
      {ds }
      *@var C1 l10
       *brace_container C1
        {rrrr , azeeaz}
      {\\n}
      {end footnote}
   {\\n}
';


$result_texis{'characters_and_commands_in_var'} = '@var{aaa}. @var{dlksfjf ) }. @var{(fdfdsfsd}. @var{sqdq,qdsdsq}.

@var{somethingf  @c ]
vvar}.

@var{AA@,c @u{r} @`e @aa{}}.

AAA@footnote{jdhfmqsdf
dsf
ds @var{rrrr , azeeaz}
end footnote}
';


$result_texts{'characters_and_commands_in_var'} = 'aaa. dlksfjf ) . (fdfdsfsd. sqdq,qdsdsq.

somethingf  vvar.

AAc, r( e` aa.

AAA
';

$result_errors{'characters_and_commands_in_var'} = '';

$result_nodes_list{'characters_and_commands_in_var'} = '';

$result_sections_list{'characters_and_commands_in_var'} = '';

$result_sectioning_root{'characters_and_commands_in_var'} = '';

$result_headings_list{'characters_and_commands_in_var'} = '';


$result_converted{'plaintext'}->{'characters_and_commands_in_var'} = 'AAA.  DLKSFJF ) .  (FDFDSFSD.  SQDQ,QDSDSQ.

   SOMETHINGF VVAR.

   AAÇ R̆ È Å.

   AAA(1)

   ---------- Footnotes ----------

   (1) jdhfmqsdf dsf ds RRRR , AZEEAZ end footnote

';

1;
