use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'commands_and_spaces'} = '*document_root C2
 *before_node_section C8
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |misc_args:A{foo|some @value}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:foo   some @value}
  {empty_line:\\n}
  *@setfilename C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |text_arg:{commands_and_spaces.info}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:  \\n}
    {commands_and_spaces.info}
  {empty_line:\\n}
  *@unmacro C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |misc_args:A{ggg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:ggg}
  {empty_line:\\n}
  *@clickstyle C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{@arrow}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@arrow}
  {empty_line:\\n}
 *@node C46 l9 {a}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a}
  *arguments_line C4
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {a}
   *line_arg C3
   |EXTRA
   |manual_content:{b}
    {(}
    {b}
    {)}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
   |EXTRA
   |manual_content:{c}
    {(}
    {c}
    {)}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:   \\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{d}
    {(}
    {d}
    {)}
  {empty_line:\\n}
  *@center C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:  \\n}
    {centered}
  {empty_line:\\n}
  *@indent l13
  {ignorable_spaces_after_command:  }
  *paragraph C1
  |EXTRA
  |indent:{1}
   {after indent.\\n}
  {empty_line:\\n}
  *@indent l15
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {line after indent\\n}
  {empty_line:\\n}
  *@indent l18
  {ignorable_spaces_after_command:  \\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {endof line with spaces line after indent\\n}
  {empty_line:\\n}
  *@image C5 l21
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
   |spaces_before_argument:
    |{spaces_before_argument: }
    {a}
   *brace_arg C1
    {b}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {c}
   *brace_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    {d}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {e}
  {\\n}
  {empty_line:\\n}
  *@image C5 l23
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
   |spaces_before_argument:
    |{spaces_before_argument: }
    {a}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {b}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {c}
   *brace_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    {d}
   *brace_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: }
    {e}
  {\\n}
  {empty_line:\\n}
  *@quotation C3 l26
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     {Note}
   *paragraph C1
    {Q\\n}
   *@end C1 l28
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
  *@float C8 l30
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |float_number:{1}
  |float_type:{ff}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{b}
   *arguments_line C2
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {ff}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:   \\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {b}
   *paragraph C1
    {f\\n}
   *@caption C1 l32
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C1
     *paragraph C1
      {In caption }
   *paragraph C1
    {j.\\n}
   *@shortcaption C1 l33
    *brace_command_context C1
     *paragraph C1
      {Short}
   {spaces_after_close_brace:  }
   *paragraph C1
    {g.\\n}
   *@end C1 l34
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
  *@multitable C2 l36
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l36
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument:  }
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:  \\n}
       {0.4  0.6}
   *@end C1 l37
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
  *@multitable C2 l39
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C6
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     *bracketed_arg C1 l39
      {aa b}
     {  }
     *bracketed_arg C1 l39
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {r }
     {  }
     *@var C1 l39
      *brace_container C1
       {cmd}
     {gg hh j}
   *@end C1 l40
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
  *@verbatim C3 l42
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
   {raw:in verbatim @g \\n}
   *@end C1 l44
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {verbatim}
  {empty_line:\\n}
  *@tex C3 l46
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
   *rawpreformatted C1
    {in tex\\n}
   *@end C1 l48
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     {tex}
  {empty_line:\\n}
  *@example C3 l50
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
   *preformatted C1
    {in example\\n}
   *@end C1 l52
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     {example}
  {empty_line:\\n}
  *@table C3 l54
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:  \\n}
     *@strong l54
   *table_entry C1
    *table_term C1
     *@item C1 l55
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument:  }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: \\n}
       {in item}
   *@end C1 l56
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:   }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:   \\n}
     {table}
  {empty_line:\\n}
  *paragraph C3
   {T}
   *@footnote C1 l58
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {a}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {Math }
   *@math C1 l60
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *brace_command_context C3
     {\\underline}
     *balanced_braces C1 l60
      {{ a, b}}
     { }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@indicateurl C1 l62
    *brace_container C1
     { http://ggg }
   {\\n}
  {empty_line:\\n}
  *@deffn C3 l64
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l64
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*brace_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument: }
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |{machin}
   |element_node:{a}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l64
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
      |spaces_before_argument:
       |{spaces_before_argument: }
       {truc}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l64
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
      |spaces_before_argument:
       |{spaces_before_argument: }
       {machin}
     {spaces:  }
     *def_arg C1
      *bracketed_arg C1 l64
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
      |spaces_before_argument:
       |{spaces_before_argument: }
       {bidule}
     {spaces:  }
     *def_arg C1
      *bracketed_arg C1 l64
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
      |spaces_before_argument:
       |{spaces_before_argument:  }
       {chose}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l64
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
      |spaces_before_argument:
       |{spaces_before_argument:  }
       {arg}
   *def_item C1
    *paragraph C1
     {T\\n}
   *@end C1 l66
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
';


$result_texis{'commands_and_spaces'} = '@set  foo   some @value

@setfilename  commands_and_spaces.info  

@unmacro  ggg

@clickstyle  @arrow

@node a ,(b),(c) , (d)   

@center  centered  

@indent  after indent.

@indent
line after indent

@indent  
endof line with spaces line after indent

@image{ a ,b,c , d,e }

@image{ a ,b 
,c , d,e }

@quotation  Note  
Q
@end quotation

@float  ff , b   
f
@caption{ In caption }j.
@shortcaption{Short}  g.
@end float

@multitable  @columnfractions  0.4  0.6  
@end multitable

@multitable  {aa b}  { r }  @var{cmd}gg hh j 
@end multitable

@verbatim  
in verbatim @g 
@end verbatim 

@tex  
in tex
@end  tex  

@example  
in example
@end  example  

@table  @strong  
@item  in item 
@end   table   

T@footnote{  a}.

Math @math{ \\underline{ a, b} }.

@indicateurl{ http://ggg }

@deffn { truc } { machin }  { bidule }  {  chose } {  arg }
T
@end deffn

';


$result_texts{'commands_and_spaces'} = '




centered

after indent.

line after indent

endof line with spaces line after indent

a

a

Note
Q

ff, b
f
j.
g.



in verbatim @g 

in tex

in example

in item

T.

Math \\underline{ a, b} .

 http://ggg 

truc: machin bidule  chose arg
T

';

$result_errors{'commands_and_spaces'} = '* W l7|@clickstyle is obsolete
 warning: @clickstyle is obsolete

* W l39|unexpected argument on @multitable line: @var{cmd}
 warning: unexpected argument on @multitable line: @var{cmd}

';

$result_floats{'commands_and_spaces'} = 'ff: 1
 F1: {b}
  S: Short
  C: In caption 
';

$result_nodes_list{'commands_and_spaces'} = '1|a
 node_directions:
  next->(b)
  prev->(c) 
  up-> (d)   

';

$result_sections_list{'commands_and_spaces'} = '';

$result_sectioning_root{'commands_and_spaces'} = '';

$result_headings_list{'commands_and_spaces'} = '';

$result_indices_sort_strings{'commands_and_spaces'} = 'fn:
 machin
';


$result_converted{'xml'}->{'commands_and_spaces'} = '<set name="foo" spaces="  ">foo   some @value</set>

<setfilename file="commands_and_spaces.info" spaces="  ">commands_and_spaces.info  </setfilename>

<unmacro name="ggg" spaces="  ">ggg</unmacro>

<clickstyle command="arrow" spaces="  ">@arrow</clickstyle>

<node identifier="a" spaces=" "><nodename trailingspaces=" ">a</nodename><nodenext>(b)</nodenext><nodeprev trailingspaces=" ">(c)</nodeprev><nodeup spaces=" " trailingspaces="   ">(d)</nodeup></node>

<center spaces="  ">centered  </center>

<indent></indent>  <para>after indent.
</para>
<indent></indent>
<para>line after indent
</para>
<indent></indent>  
<para>endof line with spaces line after indent
</para>
<image><imagefile spaces=" ">a </imagefile><imagewidth>b</imagewidth><imageheight>c </imageheight><alttext spaces=" ">d</alttext><imageextension>e </imageextension></image>

<image><imagefile spaces=" ">a </imagefile><imagewidth>b 
</imagewidth><imageheight>c </imageheight><alttext spaces=" ">d</alttext><imageextension>e </imageextension></image>

<quotation spaces="  " endspaces=" "><quotationtype>Note  </quotationtype>
<para>Q
</para></quotation>

<float identifier="b" type="ff" number="1" spaces="  " endspaces=" "><floattype trailingspaces=" ">ff</floattype><floatname spaces=" ">b   </floatname>
<para>f
</para><caption spaces=" "><para>In caption </para></caption><para>j.
</para><shortcaption><para>Short</para></shortcaption>  <para>g.
</para></float>

<multitable spaces="  " endspaces=" "><columnfractions spaces="  " line="0.4  0.6  "><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions>
</multitable>

<multitable spaces="  " endspaces=" "><columnprototypes><columnprototype bracketed="on">aa b</columnprototype>  <columnprototype bracketed="on" spaces=" ">r </columnprototype>  <var>cmd</var>gg hh j</columnprototypes> 
</multitable>

<verbatim xml:space="preserve" endspaces=" ">  
in verbatim @g 
</verbatim> 

<tex endspaces="  ">  
in tex
</tex>  

<example endspaces="  ">  
<pre xml:space="preserve">in example
</pre></example>  

<table commandarg="strong" spaces="  " endspaces="   ">  
<tableentry><tableterm><item spaces="  "><itemformat command="strong">in item </itemformat></item>
</tableterm></tableentry></table>   

<para>T<footnote spaces="  "><para>a</para></footnote>.
</para>
<para>Math <math spaces=" ">\\underline{ a, b} </math>.
</para>
<para><indicateurl> http://ggg </indicateurl>
</para>
<deffn spaces=" " endspaces=" "><definitionterm><indexterm index="fn" number="1">machin</indexterm><defcategory bracketed="on" spaces=" " trailingspaces=" ">truc</defcategory> <deffunction bracketed="on" spaces=" " trailingspaces=" ">machin</deffunction>  <defparam bracketed="on" spaces=" " trailingspaces=" ">bidule</defparam>  <defparam bracketed="on" spaces="  " trailingspaces=" ">chose</defparam> <defparam bracketed="on" spaces="  " trailingspaces=" ">arg</defparam></definitionterm>
<definitionitem><para>T
</para></definitionitem></deffn>

';

1;
