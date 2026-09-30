use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'center'} = '*document_root C1
 *before_node_section C41
  *@center C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C6
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@indent l1
    {ignorable_spaces_after_command: }
    *@titlefont C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {in titlefont}
    { }
    *@anchor C1 l1
    |EXTRA
    |is_target:{1}
    |normalized:{in-anchor}
     *brace_arg C1
      {in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {footnote}
  {empty_line:\\n}
  *@center C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    {center }
    *index_entry_command@cindex C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {cindex}
  {empty_line:\\n}
  *@center C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
    *@quotation C1 l5
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
  *paragraph C1
   {in quotation\\n}
  {empty_line:\\n}
  *@center C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    {center }
    *@center C1 l9
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {second center}
  {empty_line:\\n}
  *@center C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
    *@code C1 l11
     *brace_container C1
      {in code in center\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *@center C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    *@code C1 l15
     *brace_container C1
      {in code in center }
    *@center C1 l15
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {center in code in center}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   *@code C1 l19
    *brace_container
  *@center C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {in center in code}
  {empty_line:\\n}
  *@table C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l21
   *before_item C1
    *@center C1 l22
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C3
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {centered line with item }
      {ignorable_spaces_after_command: }
      {first item on center line}
   *@end C1 l23
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
  *@table C3 l25
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l25
   *table_entry C2
    *table_term C1
     *@item C1 l26
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
    *table_definition C1
     *@center C1 l27
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C3
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {centered line with item }
       {ignorable_spaces_after_command: }
       {second item on center line}
   *@end C1 l28
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
  *paragraph C1
   {Empty double center:\\n}
  *@center C1 l31
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
    *@center C1 l31
     *line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l33
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    *@samp C1 l33
     *brace_container C1
      {something }
    *@center C1 l33
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {end of samp}
  {empty_line:\\n}
  *@center C1 l35
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C3
    {after first center }
    *@samp C1 l35
     *brace_container
    *@center C1 l35
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {after second center}
  {empty_line:\\n}
  *paragraph C1
   {End of samp\\n}
  {empty_line:\\n}
  *@multitable C3 l39
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l39
      {AAA}
     {  }
     *bracketed_arg C1 l39
      {BBB}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l40
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {truc }
     *@tab C4 l40
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {bidule\\n}
      *@center C1 l41
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C4
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {ignorable_spaces_after_command: }
        {ctruc }
        {ignorable_spaces_after_command: }
        {cbidule}
      *@center C1 l42
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C2
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {ignorable_spaces_after_command: }
        {cstruc}
   *@end C1 l43
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
  *@center C1 l45
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    {before the table }
    *@table C1 l45
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *arguments_line C1
      *block_line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@asis l45
  {ignorable_spaces_after_command: }
  *paragraph C2
   {item in center\\n}
   {Line in center\\n}
  {ignorable_spaces_after_command: }
  *paragraph C1
   {second item\\n}
  {empty_line:\\n}
';


$result_texis{'center'} = '@center @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote}

@center center @cindex cindex

@center @quotation
in quotation

@center center @center second center

@center @code{in code in center
}


@center @code{in code in center }@center center in code in center



@code{}@center in center in code

@table @asis
@center centered line with item  first item on center line
@end table

@table @emph
@item item
@center centered line with item  second item on center line
@end table

Empty double center:
@center @center

@center @samp{something }@center end of samp

@center after first center @samp{}@center after second center

End of samp

@multitable {AAA}  {BBB}
@item truc @tab bidule
@center  ctruc  cbidule
@center  cstruc
@end multitable

@center before the table @table @asis
 item in center
Line in center
 second item

';


$result_texts{'center'} = 'in titlefont 

center 


in quotation

center second center

in code in center



in code in center center in code in center



in center in code

centered line with item first item on center line

item
centered line with item second item on center line

Empty double center:


something end of samp

after first center after second center

End of samp

truc bidule
ctruc cbidule
cstruc

before the table 
item in center
Line in center
second item

';

$result_errors{'center'} = '* W l1|@indent should not appear in @center
 warning: @indent should not appear in @center

* W l3|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l3|@cindex should not appear in @center
 warning: @cindex should not appear in @center

* W l3|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l5|@quotation should only appear at the beginning of a line
 warning: @quotation should only appear at the beginning of a line

* W l5|@quotation should not appear in @center
 warning: @quotation should not appear in @center

* E l5|no matching `@end quotation\'
 no matching `@end quotation\'

* E l7|unmatched `@end quotation\'
 unmatched `@end quotation\'

* W l9|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l9|@center should not appear in @center
 warning: @center should not appear in @center

* E l11|@code missing closing brace
 @code missing closing brace

* E l13|misplaced }
 misplaced }

* W l15|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l15|@code missing closing brace
 @code missing closing brace

* W l15|@center should not appear in @center
 warning: @center should not appear in @center

* E l17|misplaced }
 misplaced }

* W l19|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l19|@code missing closing brace
 @code missing closing brace

* E l19|misplaced }
 misplaced }

* W l22|@item should not appear in @center
 warning: @item should not appear in @center

* E l22|@item outside of table or list
 @item outside of table or list

* W l21|@table has text but no @item
 warning: @table has text but no @item

* W l27|@item should not appear in @center
 warning: @item should not appear in @center

* E l27|@item outside of table or list
 @item outside of table or list

* W l31|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l31|@center should not appear in @center
 warning: @center should not appear in @center

* W l31|@center missing argument
 warning: @center missing argument

* W l33|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l33|@samp missing closing brace
 @samp missing closing brace

* W l33|@center should not appear in @center
 warning: @center should not appear in @center

* E l33|misplaced }
 misplaced }

* W l35|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l35|@samp missing closing brace
 @samp missing closing brace

* W l35|@center should not appear in @center
 warning: @center should not appear in @center

* E l37|misplaced }
 misplaced }

* W l41|@item should not appear in @center
 warning: @item should not appear in @center

* E l41|@item outside of table or list
 @item outside of table or list

* W l41|@tab should not appear in @center
 warning: @tab should not appear in @center

* E l41|ignoring @tab outside of multitable
 ignoring @tab outside of multitable

* W l42|@item should not appear in @center
 warning: @item should not appear in @center

* E l42|@item outside of table or list
 @item outside of table or list

* W l45|@table should only appear at the beginning of a line
 warning: @table should only appear at the beginning of a line

* W l45|@table should not appear in @center
 warning: @table should not appear in @center

* E l45|no matching `@end table\'
 no matching `@end table\'

* E l46|@item outside of table or list
 @item outside of table or list

* E l48|@item outside of table or list
 @item outside of table or list

* E l49|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'center'} = '';

$result_sections_list{'center'} = '';

$result_sectioning_root{'center'} = '';

$result_headings_list{'center'} = '';

$result_indices_sort_strings{'center'} = 'cp:
 cindex
';

1;
