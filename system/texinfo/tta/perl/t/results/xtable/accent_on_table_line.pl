use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accent_on_table_line'} = '*document_root C1
 *before_node_section C13
  *@table C4 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@~ l1
   *table_entry C1
    *table_term C1
     *@item C1 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {first item}
   *table_entry C1
    *table_term C1
     *@item C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {no at-command }
       *@code C1 l3
        *brace_container C1
         {code}
   *@end C1 l4
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
  *@table C4 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@~ C1 l6
      *brace_container
   *table_entry C1
    *table_term C1
     *@item C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {acc brace first item}
   *table_entry C1
    *table_term C1
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {no at-command }
       *@code C1 l8
        *brace_container C1
         {code acc brace}
   *@end C1 l9
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
  *@table C3 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |comment_at_end:
     |*@comment C1
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:}
     *@~ l11
   *table_entry C1
    *table_term C1
     *@item C1 l12
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {acc comment first item}
   *@end C1 l13
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
  *@table C3 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     *@~ l15
   *table_entry C1
    *table_term C1
     *@item C1 l16
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {acc space first item}
   *@end C1 l17
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
  *@table C3 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@ringaccent l19
   *table_entry C1
    *table_term C1
     *@item C1 l20
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {cmdacc first item}
   *@end C1 l21
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
  *@table C3 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@ringaccent C1 l23
      *brace_container
   *table_entry C1
    *table_term C1
     *@item C1 l24
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {cmdacc braces first item}
   *@end C1 l25
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
  *@table C3 l27
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@ringaccent C1 l27
      *brace_container C1
       {a}
   *table_entry C1
    *table_term C1
     *@item C1 l28
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {cmdacc braces arg first item}
   *@end C1 l29
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
';


$result_texis{'accent_on_table_line'} = '@table @~
@item first item
@item no at-command @code{code}
@end table

@table @~{}
@item acc brace first item
@item no at-command @code{code acc brace}
@end table

@table @~@comment
@item acc comment first item
@end table

@table @~ 
@item acc space first item
@end table

@table @ringaccent
@item cmdacc first item
@end table

@table @ringaccent{}
@item cmdacc braces first item
@end table

@table @ringaccent{a}
@item cmdacc braces arg first item
@end table
';


$result_texts{'accent_on_table_line'} = 'first item
no at-command code

acc brace first item
no at-command code acc brace

acc comment first item

acc space first item

cmdacc first item

cmdacc braces first item

cmdacc braces arg first item
';

$result_errors{'accent_on_table_line'} = '* W l1|command `@~\' must not be followed by new line
 warning: command `@~\' must not be followed by new line

* E l1|bad argument to @table: @~
 bad argument to @table: @~

* E l6|bad argument to @table: @~{}
 bad argument to @table: @~{}

* E l11|@~ expected braces
 @~ expected braces

* E l11|bad argument to @table: @~
 bad argument to @table: @~

* W l15|command `@~\' must not be followed by new line
 warning: command `@~\' must not be followed by new line

* E l15|bad argument to @table: @~
 bad argument to @table: @~

* W l19|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* E l19|bad argument to @table: @ringaccent
 bad argument to @table: @ringaccent

* E l23|bad argument to @table: @ringaccent{}
 bad argument to @table: @ringaccent{}

* E l27|bad argument to @table: @ringaccent{a}
 bad argument to @table: @ringaccent{a}

';

$result_nodes_list{'accent_on_table_line'} = '';

$result_sections_list{'accent_on_table_line'} = '';

$result_sectioning_root{'accent_on_table_line'} = '';

$result_headings_list{'accent_on_table_line'} = '';


$result_converted{'plaintext'}->{'accent_on_table_line'} = 'first item
no at-command ‘code’

acc brace first item
no at-command ‘code acc brace’

acc comment first item

acc space first item

cmdacc first item

cmdacc braces first item

cmdacc braces arg first item
';


$result_converted{'html_text'}->{'accent_on_table_line'} = '<dl class="table">
<dt>first item</dt>
<dt>no at-command <code class="code">code</code></dt>
</dl>

<dl class="table">
<dt>acc brace first item</dt>
<dt>no at-command <code class="code">code acc brace</code></dt>
</dl>

<dl class="table">
<dt>acc comment first item</dt>
</dl>

<dl class="table">
<dt>acc space first item</dt>
</dl>

<dl class="table">
<dt>cmdacc first item</dt>
</dl>

<dl class="table">
<dt>cmdacc braces first item</dt>
</dl>

<dl class="table">
<dt>cmdacc braces arg first item</dt>
</dl>
';


$result_converted{'xml'}->{'accent_on_table_line'} = '<table spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">first item</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">no at-command <code>code</code></itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">acc brace first item</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">no at-command <code>code acc brace</code></itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" "><!-- comment -->
<tableentry><tableterm><item spaces=" "><itemformat command="asis">acc comment first item</itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" "> 
<tableentry><tableterm><item spaces=" "><itemformat command="asis">acc space first item</itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">cmdacc first item</itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">cmdacc braces first item</itemformat></item>
</tableterm></tableentry></table>

<table spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">cmdacc braces arg first item</itemformat></item>
</tableterm></tableentry></table>
';


$result_converted{'docbook'}->{'accent_on_table_line'} = '<variablelist><varlistentry><term>first item
</term></varlistentry><varlistentry><term>no at-command <literal>code</literal>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>acc brace first item
</term></varlistentry><varlistentry><term>no at-command <literal>code acc brace</literal>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>acc comment first item
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>acc space first item
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>cmdacc first item
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>cmdacc braces first item
</term></varlistentry></variablelist>
<variablelist><varlistentry><term>cmdacc braces arg first item
</term></varlistentry></variablelist>';

1;
