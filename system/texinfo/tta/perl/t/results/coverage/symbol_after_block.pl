use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'symbol_after_block'} = '*document_root C1
 *before_node_section C39
  *@html C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {In html\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html. On the line.}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html. On the line.}
  {empty_line:\\n}
  *@html C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {In html\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html@ On the line.}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html}
     *@@
     { On the line.}
  {empty_line:\\n}
  *paragraph C1
   {Verbatim:\\n}
  {empty_line:\\n}
  *@verbatim C3 l11
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:In verbatim\\n}
   *@end C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim;}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {verbatim;}
  {empty_line:\\n}
  *@verbatim C3 l15
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:In verbatim\\n}
   *@end C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim@}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {verbatim}
     *@@
  {empty_line:\\n}
  *paragraph C1
   {Table:\\n}
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
     *@emph l21
   *table_entry C2
    *table_term C1
     *@item C1 l22
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {a}
    *table_definition C1
     *paragraph C1
      {l--ine\\n}
   *@end C1 l24
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table+}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table+}
  {empty_line:\\n}
  *@table C3 l26
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l26
   *table_entry C2
    *table_term C1
     *@item C1 l27
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {a}
    *table_definition C1
     *paragraph C1
      {l--ine\\n}
   *@end C1 l29
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table@}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
     *@@
  {empty_line:\\n}
  *paragraph C1
   {Itemize:\\n}
  {empty_line:\\n}
  *@itemize C3 l33
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@bullet l33
   *@item C2 l34
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {e--mph item\\n}
   *@end C1 l35
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize\'\'}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize\'\'}
  {empty_line:\\n}
  *@itemize C3 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@bullet l37
   *@item C2 l38
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {e--mph item\\n}
   *@end C1 l39
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize@}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
     *@@
  {empty_line:\\n}
  *paragraph C1
   {Multitable:\\n}
  {empty_line:\\n}
  *@multitable C4 l43
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l43
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{6|7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {6 7}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@headitem C2 l44
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable headitem }
     *@tab C2 l44
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {another tab\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l45
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable item }
     *@tab C2 l45
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {multitable tab\\n}
   *@end C1 l46
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable^}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable^}
  {empty_line:\\n}
  *@multitable C4 l48
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l48
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{6|7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {6 7}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@headitem C2 l49
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable headitem }
     *@tab C2 l49
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {another tab\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l50
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {mu--ltitable item }
     *@tab C2 l50
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {multitable tab\\n}
   *@end C1 l51
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable{}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
     *@{
  {empty_line:\\n}
  *paragraph C1
   {Flushleft:\\n}
  {empty_line:\\n}
  *@flushleft C3 l55
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {flushleft\\n}
   *@end C1 l57
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushleft!}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushleft!}
  {empty_line:\\n}
  *@flushleft C3 l59
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {flushleft\\n}
   *@end C1 l61
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{flushleft@}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {flushleft}
     *@@
  {empty_line:\\n}
  *paragraph C1
   {Copying:\\n}
  {empty_line:\\n}
  *@copying C3 l65
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {Copying\\n}
   *@end C1 l67
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{copying*}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {copying*}
  {empty_line:\\n}
  *@copying C3 l69
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {Copying\\n}
   *@end C1 l71
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{copying@}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {copying}
     *@@
';


$result_texis{'symbol_after_block'} = '@html
In html
@end html. On the line.

@html
In html
@end html@@ On the line.

Verbatim:

@verbatim
In verbatim
@end verbatim;

@verbatim
In verbatim
@end verbatim@@

Table:

@table @emph
@item a
l--ine
@end table+

@table @emph
@item a
l--ine
@end table@@

Itemize:

@itemize @bullet
@item e--mph item
@end itemize\'\'

@itemize @bullet
@item e--mph item
@end itemize@@

Multitable:

@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@end multitable^

@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@end multitable@{

Flushleft:

@flushleft
flushleft
@end flushleft!

@flushleft
flushleft
@end flushleft@@

Copying:

@copying
Copying
@end copying*

@copying
Copying
@end copying@@
';


$result_texts{'symbol_after_block'} = 'In html

In html

Verbatim:

In verbatim

In verbatim

Table:

a
l-ine

a
l-ine

Itemize:

e-mph item

e-mph item

Multitable:

mu-ltitable headitem another tab
mu-ltitable item multitable tab

mu-ltitable headitem another tab
mu-ltitable item multitable tab

Flushleft:

flushleft

flushleft

Copying:


';

$result_errors{'symbol_after_block'} = '* E l3|bad argument to @end: html. On the line.
 bad argument to @end: html. On the line.

* E l7|bad argument to @end: html@@ On the line.
 bad argument to @end: html@@ On the line.

* E l13|bad argument to @end: verbatim;
 bad argument to @end: verbatim;

* E l17|bad argument to @end: verbatim@@
 bad argument to @end: verbatim@@

* E l24|bad argument to @end: table+
 bad argument to @end: table+

* E l29|bad argument to @end: table@@
 bad argument to @end: table@@

* E l35|bad argument to @end: itemize\'\'
 bad argument to @end: itemize\'\'

* E l39|bad argument to @end: itemize@@
 bad argument to @end: itemize@@

* E l46|bad argument to @end: multitable^
 bad argument to @end: multitable^

* E l51|bad argument to @end: multitable@{
 bad argument to @end: multitable@{

* E l57|bad argument to @end: flushleft!
 bad argument to @end: flushleft!

* E l61|bad argument to @end: flushleft@@
 bad argument to @end: flushleft@@

* E l67|bad argument to @end: copying*
 bad argument to @end: copying*

* W l69|multiple @copying
 warning: multiple @copying

* E l71|bad argument to @end: copying@@
 bad argument to @end: copying@@

';

$result_nodes_list{'symbol_after_block'} = '';

$result_sections_list{'symbol_after_block'} = '';

$result_sectioning_root{'symbol_after_block'} = '';

$result_headings_list{'symbol_after_block'} = '';

1;
