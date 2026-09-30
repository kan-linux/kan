use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comments_on_block_command_lines'} = '*document_root C1
 *before_node_section C40
  *@itemize C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {itemize it\\n}
   *@end C1 l3
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
  {empty_line:\\n}
  *@itemize C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {x}
   *@item C2 l6
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {itemize xit\\n}
   *@end C1 l7
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
  {empty_line:\\n}
  *@itemize C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@bullet l9
   *@item C2 l10
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {itemize bulletit\\n}
   *@end C1 l11
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
  {empty_line:\\n}
  *@itemize C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@bullet C1 l13
      *brace_container
   *@item C2 l14
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {itemize bullet with braces\\n}
   *@end C1 l15
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
  {empty_line:\\n}
  *@enumerate C3 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *@item C2 l18
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {en\\n}
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {enumerate}
  {empty_line:\\n}
  *@enumerate C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {a}
   *@item C2 l22
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {aen\\n}
   *@end C1 l23
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {enumerate}
  {empty_line:\\n}
  *@table C3 l25
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:table}
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@asis l25
   *table_entry C1
    *table_term C1
     *@item C1 l26
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {it}
   *@end C1 l27
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
  {empty_line:\\n}
  *@quotation C3 l29
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:quot no arg}
   *paragraph C1
    {Quot no arg\\n}
   *@end C1 l31
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
  {empty_line:\\n}
  *@quotation C3 l33
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:quot arg}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {quotarg}
   *paragraph C1
    {Quot arg\\n}
   *@end C1 l35
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
  {empty_line:\\n}
  *@group C3 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *paragraph C1
    {in gr\\n}
   *@end C1 l39
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{group}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {group}
  {empty_line:\\n}
  *@example C3 l41
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *preformatted C1
    {in ex\\n}
   *@end C1 l43
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@example C3 l45
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C2
    *block_line_arg C3
     {in }
     *@code C1 l45
      *brace_container C1
       {first}
     { arg}
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {second arg}
   *preformatted C1
    {in ex with arg\\n}
   *@end C1 l47
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@example C3 l49
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C3
    *block_line_arg C1
     {first}
    *block_line_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {second}
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {third}
   *preformatted C1
    {in ex 3 args\\n}
   *@end C1 l51
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@example C3 l53
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C4
    *block_line_arg C1
     {first}
    *block_line_arg C1
     {second}
    *block_line_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {third}
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {fourth}
   *preformatted C1
    {in ex 4 args\\n}
   *@end C1 l55
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@display C3 l57
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *preformatted C1
    {in display\\n}
   *@end C1 l59
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{display}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {display}
  {empty_line:\\n}
  *@multitable C3 l61
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l61
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C1
      |INFO
      |comment_at_end:
       |*@c C1
       ||INFO
       ||spaces_before_argument:
        ||{spaces_before_argument: }
        |*line_arg C1
        ||INFO
        ||spaces_after_argument:
         ||{spaces_after_argument:\\n}
         |{rawline_text:comm}
      |spaces_after_argument:
       |{spaces_after_argument: }
       {0.4 0.6}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l62
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {a }
     *@tab C2 l62
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {b\\n}
   *@end C1 l63
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
  {empty_line:\\n}
  *@multitable C3 l65
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:c}
    |spaces_after_argument:
     |{spaces_after_argument: }
     *bracketed_arg C1 l65
      {aaa}
     { }
     *bracketed_arg C1 l65
      {bbb}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l66
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {aaa }
     *@tab C2 l66
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {bbb\\n}
   *@end C1 l67
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
  {empty_line:\\n}
  *@float C3 l69
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{f}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{g}
   *arguments_line C2
    *block_line_arg C1
     {f}
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {g}
   *paragraph C1
    {In f\\n}
   *@end C1 l71
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@flushright C3 l73
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *paragraph C1
    {flushright\\n}
   *@end C1 l75
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushright}
  {empty_line:\\n}
  *@raggedright C3 l77
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comm}
   *paragraph C1
    {raggedright\\n}
   *@end C1 l79
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{raggedright}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {raggedright}
  {empty_line:\\n}
';


$result_texis{'comments_on_block_command_lines'} = '@itemize @c comm
@item itemize it
@end itemize

@itemize x @c comm
@item itemize xit
@end itemize

@itemize @bullet @c comm
@item itemize bulletit
@end itemize

@itemize @bullet{} @c comm
@item itemize bullet with braces
@end itemize

@enumerate @c comm
@item en
@end enumerate

@enumerate a @c comm
@item aen
@end enumerate

@table @asis @c table
@item it
@end table

@quotation @c quot no arg
Quot no arg
@end quotation

@quotation quotarg @c quot arg
Quot arg
@end quotation

@group @c comm
in gr
@end group

@example @c comm
in ex
@end example

@example in @code{first} arg, second arg @c comm
in ex with arg
@end example

@example first, second, third @c comm
in ex 3 args
@end example

@example first,second, third, fourth @c comm
in ex 4 args
@end example

@display @c comm
in display
@end display

@multitable @columnfractions 0.4 0.6 @c comm
@item a @tab b
@end multitable

@multitable {aaa} {bbb} @c c
@item aaa @tab bbb
@end multitable

@float f,g @c comm
In f
@end float

@flushright @c comm
flushright
@end flushright

@raggedright @c comm
raggedright
@end raggedright

';


$result_texts{'comments_on_block_command_lines'} = 'itemize it

itemize xit

itemize bulletit

itemize bullet with braces

1. en

a. aen

it

Quot no arg

quotarg
Quot arg

in gr

in ex

in ex with arg

in ex 3 args

in ex 4 args

in display

a b

aaa bbb

f, g
In f

flushright

raggedright

';

$result_errors{'comments_on_block_command_lines'} = '';

$result_floats{'comments_on_block_command_lines'} = 'f: 1
 F1: {g}
';

$result_nodes_list{'comments_on_block_command_lines'} = '';

$result_sections_list{'comments_on_block_command_lines'} = '';

$result_sectioning_root{'comments_on_block_command_lines'} = '';

$result_headings_list{'comments_on_block_command_lines'} = '';


$result_converted{'xml'}->{'comments_on_block_command_lines'} = '<itemize spaces=" " endspaces=" "><!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize it
</para></listitem></itemize>

<itemize spaces=" " endspaces=" "><itemprepend>x </itemprepend><!-- c comm -->
<listitem><prepend>x</prepend> <para>itemize xit
</para></listitem></itemize>

<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend><formattingcommand command="bullet"/> </itemprepend><!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize bulletit
</para></listitem></itemize>

<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend>&bullet; </itemprepend><!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize bullet with braces
</para></listitem></itemize>

<enumerate first="1" spaces=" " endspaces=" "><!-- c comm -->
<listitem> <para>en
</para></listitem></enumerate>

<enumerate first="a" spaces=" " endspaces=" "><enumeratefirst>a </enumeratefirst><!-- c comm -->
<listitem> <para>aen
</para></listitem></enumerate>

<table commandarg="asis" spaces=" " endspaces=" "> <!-- c table -->
<tableentry><tableterm><item spaces=" "><itemformat command="asis">it</itemformat></item>
</tableterm></tableentry></table>

<quotation spaces=" " endspaces=" "><!-- c quot no arg -->
<para>Quot no arg
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>quotarg </quotationtype><!-- c quot arg -->
<para>Quot arg
</para></quotation>

<group spaces=" " endspaces=" "><!-- c comm -->
<para>in gr
</para></group>

<example spaces=" " endspaces=" "><!-- c comm -->
<pre xml:space="preserve">in ex
</pre></example>

<example spaces=" " endspaces=" "><examplelanguage>in <code>first</code> arg</examplelanguage><examplearg spaces=" ">second arg </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex with arg
</pre></example>

<example spaces=" " endspaces=" "><examplelanguage>first</examplelanguage><examplearg spaces=" ">second</examplearg><examplearg spaces=" ">third </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex 3 args
</pre></example>

<example spaces=" " endspaces=" "><examplelanguage>first</examplelanguage><examplearg>second</examplearg><examplearg spaces=" ">third</examplearg><examplearg spaces=" ">fourth </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex 4 args
</pre></example>

<display spaces=" " endspaces=" "><!-- c comm -->
<pre xml:space="preserve">in display
</pre></display>

<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0.4 0.6 @c comm"><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions><!-- c comm -->
<tbody><row><entry command="item"> <para>a </para></entry><entry command="tab"> <para>b
</para></entry></row></tbody></multitable>

<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">aaa</columnprototype> <columnprototype bracketed="on">bbb</columnprototype></columnprototypes> <!-- c c -->
<tbody><row><entry command="item"> <para>aaa </para></entry><entry command="tab"> <para>bbb
</para></entry></row></tbody></multitable>

<float identifier="g" type="f" number="1" spaces=" " endspaces=" "><floattype>f</floattype><floatname>g </floatname><!-- c comm -->
<para>In f
</para></float>

<flushright spaces=" " endspaces=" "><!-- c comm -->
<para>flushright
</para></flushright>

<raggedright spaces=" " endspaces=" "><!-- c comm -->
<para>raggedright
</para></raggedright>

';

1;
