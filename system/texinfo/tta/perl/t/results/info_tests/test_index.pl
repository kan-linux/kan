use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_index'} = '*document_root C13
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C12 l2 {Element top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Element top}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l4
    *brace_arg C1
    |EXTRA
    |node_content:{a counting anchor}
    |normalized:{a-counting-anchor}
     {a counting anchor}
   {.\\n}
  {empty_line:\\n}
  *paragraph C5
   {before menu.\\n}
   *index_entry_command@cindex C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in Top}
   *index_entry_command@cindex C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,2}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@@
   *index_entry_command@cindex C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,3}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@exclamdown C1 l9
      *brace_container
   *index_entry_command@cindex C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,4}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {"}
  {empty_line:\\n}
  *@deffn C4 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l12
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |*@var C1
       |*brace_container C1
        |{i}
   |element_node:{Top}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l12
        *brace_container C1
         {i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {g}
   *@deffnx C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{machin}
   |element_node:{Top}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {chose}
   *def_item C1
    {empty_line:\\n}
   *@end C1 l15
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
  *@ftable C4 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l17
   *table_entry C2
    *table_term C1
     *@item C1 l18
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {a fun}
    *table_definition C2
     *paragraph C1
      {Var text\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C2
     *@item C1 l21
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,4}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {second fun}
     *@itemx C1 l22
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,5}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {itemx fun}
    *table_definition C1
     {empty_line:\\n}
   *@end C1 l24
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ftable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ftable}
  {empty_line:\\n}
  *@menu C4 l26
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{name}
    |normalized:{name}
     {name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
    |normalized:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
     {name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l29
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l31 {name}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{name}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {name}
 *@chapter C171 l32 {A chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A chapter}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l34
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name}
  |index_entry:I{cp,5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  *index_entry_command@findex C1 l35
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,6}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {function index entry}
  {empty_line:\\n}
  *paragraph C3
   {A paragraph \\n}
   *index_entry_command@findex C1 l38
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{name}
   |index_entry:I{fn,7}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {other function}
   {end paragraph\\n}
  {empty_line:\\n}
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *paragraph C1
   {a\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l51
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {after lines.}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *paragraph C1
   {b\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l203
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,9}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {after more than 100 lines}
  {empty_line:\\n}
 *@node C1 l205 {name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
 *@appendix C13 l206 {Index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Index}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l208
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{cp,6}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index entry in appendix before para}
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {Concept index\\n}
  *@printindex C1 l212
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *index_entry_command@findex C1 l214
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{fn,10}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index entry between indices}
  {empty_line:\\n}
  *paragraph C1
   {Functions index\\n}
  *@printindex C1 l217
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
  {empty_line:\\n}
 *@appendixsec C2 l219 {appendixsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendixsec}
  {empty_line:\\n}
 *@appendixsubsec C2 l221 {appendixsubsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A.1.1}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendixsubsec}
  {empty_line:\\n}
 *@appendixsubsubsec C4 l223 {appendixsubsubsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A.1.1.1}
 |section_level:{4}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendixsubsubsec}
  {empty_line:\\n}
  *@chapheading C1 l225
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapheading}
  {empty_line:\\n}
 *@centerchap C2 l227 {centerchap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {centerchap}
  {empty_line:\\n}
 *@chapter C7 l229 {chapter end}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{B}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter end}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l231
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{cp,7}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index in chapter end}
  {empty_line:\\n}
  *@anchor C1 l233
  |EXTRA
  |is_target:{1}
  |normalized:{a-counting-anchor}
   *brace_arg C1
    {a counting anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'test_index'} = '@node Top
@top Element top

@xref{a counting anchor}.

before menu.
@cindex in Top
@cindex @@
@cindex @exclamdown{}
@cindex "

@deffn fset @var{i} a g
@deffnx truc machin bidule chose

@end deffn

@ftable @emph
@item a fun
Var text

@item second fun
@itemx itemx fun

@end ftable

@menu
* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::
@end menu

@node name
@chapter A chapter

@cindex index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
@findex function index entry

A paragraph 
@findex other function
end paragraph

a

a

a

a

a

@findex after lines.

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

@findex after more than 100 lines

@node name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
@appendix Index

@cindex index entry in appendix before para
Para.

Concept index
@printindex cp

@findex index entry between indices

Functions index
@printindex fn

@appendixsec appendixsec

@appendixsubsec appendixsubsec

@appendixsubsubsec appendixsubsubsec

@chapheading chapheading

@centerchap centerchap

@chapter chapter end

@cindex index in chapter end

@anchor{a counting anchor}

@bye
';


$result_texts{'test_index'} = 'Element top
***********

a counting anchor.

before menu.

fset: i a g
truc: machin bidule chose


a fun
Var text

second fun
itemx fun


* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::

1 A chapter
***********


A paragraph 
end paragraph

a

a

a

a

a


b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b


Appendix A Index
****************

Para.

Concept index


Functions index

A.1 appendixsec
===============

A.1.1 appendixsubsec
--------------------

A.1.1.1 appendixsubsubsec
.........................

chapheading
***********

centerchap
**********

B chapter end
*************



';

$result_errors{'test_index'} = '* W l227|@centerchap is obsolete
 warning: @centerchap is obsolete

';

$result_nodes_list{'test_index'} = '1|Top
 associated_section: Element top
 associated_title_command: Element top
 menus:
  name
  name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 node_directions:
  next->name
2|name
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 node_directions:
  next->name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
  prev->Top
  up->Top
3|name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 associated_section: A Index
 associated_title_command: A Index
 node_directions:
  prev->name
  up->Top
';

$result_sections_list{'test_index'} = '1|Element top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
  2|Index
  3|centerchap
  4|chapter end
2|A chapter
 associated_anchor_command: name
 associated_node: name
 section_directions:
  next->Index
  up->Element top
 toplevel_directions:
  next->Index
  prev->Element top
  up->Element top
3|Index
 associated_anchor_command: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 associated_node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 section_directions:
  next->centerchap
  prev->A chapter
  up->Element top
 toplevel_directions:
  next->centerchap
  prev->A chapter
  up->Element top
 section_children:
  1|appendixsec
4|appendixsec
 section_directions:
  up->Index
 section_children:
  1|appendixsubsec
5|appendixsubsec
 section_directions:
  up->appendixsec
 section_children:
  1|appendixsubsubsec
6|appendixsubsubsec
 section_directions:
  up->appendixsubsec
7|centerchap
 section_directions:
  next->chapter end
  prev->Index
  up->Element top
 toplevel_directions:
  next->chapter end
  prev->Index
  up->Element top
8|chapter end
 section_directions:
  prev->centerchap
  up->Element top
 toplevel_directions:
  prev->centerchap
  up->Element top
';

$result_sectioning_root{'test_index'} = 'level: -1
list:
 1|Element top
';

$result_headings_list{'test_index'} = '1|chapheading
';

$result_indices_sort_strings{'test_index'} = 'cp:
 ¡
 "
 @
 in Top
 index entry in appendix before para
 index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 index in chapter end
fn:
 a fun
 after lines.
 after more than 100 lines
 function index entry
 i
 index entry between indices
 itemx fun
 machin
 other function
 second fun
';


$result_converted{'info'}->{'test_index'} = 'This is , produced from .


File: ,  Node: Top,  Next: name,  Up: (dir)

Element top
***********

*Note a counting anchor::.

   before menu.

 -- fset: I a g
 -- truc: machin bidule chose

_a fun_
     Var text

_second fun_
_itemx fun_

* Menu:

* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::


File: ,  Node: name,  Next: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong,  Prev: Top,  Up: Top

1 A chapter
***********

A paragraph end paragraph

   a

   a

   a

   a

   a

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b


File: ,  Node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong,  Prev: name,  Up: Top

Appendix A Index
****************

Para.

   Concept index

 [index ]
* Menu:

* ¡:                                     Top.                   (line 8)
* ":                                     Top.                   (line 8)
* @:                                     Top.                   (line 8)
* in Top:                                Top.                   (line 8)
* index entry in appendix before para:   name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                                (line 6)
* index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong: name.
                                                                (line 6)
* index in chapter end:                  name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                                (line 4)

   Functions index

 [index ]
* Menu:

* a fun:                                 Top.                 (line  13)
* after lines.:                          name.                (line  18)
* after more than 100 lines:             name.                (line 167)
* function index entry:                  name.                (line   6)
* I:                                     Top.                 (line  10)
* index entry between indices:           name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                              (line  24)
* itemx fun:                             Top.                 (line  17)
* machin:                                Top.                 (line  11)
* other function:                        name.                (line   6)
* second fun:                            Top.                 (line  16)

A.1 appendixsec
===============

A.1.1 appendixsubsec
--------------------

A.1.1.1 appendixsubsubsec
.........................

chapheading
***********

centerchap
**********

B chapter end
*************


Tag Table:
Node: Top27
Node: name330
Node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong982
Ref: a counting anchor3070

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
