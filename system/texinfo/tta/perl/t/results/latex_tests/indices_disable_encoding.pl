use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'indices_disable_encoding'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@set C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{txiindexbackslashignore|}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:txiindexbackslashignore}
   {empty_line:\\n}
 *@node C1 l4 {Top}
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
 *@top C2 l5 {top section}
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
    {top section}
  {empty_line:\\n}
 *@node C1 l7 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C22 l8 {Index}
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
    {Index}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,1}
  |index_ignore_chars:{\\}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@" C1 l10
     *following_arg C1
      {a}
    { }
    *@" C1 l10
     *brace_container C1
      {o}
  *index_entry_command@cindex C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,2}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {AA}
  *index_entry_command@cindex C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,3}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {aa}
  *index_entry_command@cindex C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,4}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {i}
  *index_entry_command@cindex C1 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,5}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Z}
  *index_entry_command@cindex C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,6}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@^ C1 l15
     *following_arg C1
      {i}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,7}
  |index_ignore_chars:{\\}
   *line_arg C9
    *@math C1 l17
     *brace_command_context C3
      {a!"}
      *@@
      {b}
    { "!}
    *@@
    { }
    *@" C1 l17
     *following_arg C1
      {a}
    { }
    *@" C1 l17
     *brace_container C1
      {o}
    {ignorable_spaces_before_command: }
    *@subentry C1 l17
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |sortas:{a!"@b}
     *line_arg C12
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *@sortas C1 l17
       *brace_arg C3
        {a!"}
        *@@
        {b}
      {spaces_after_close_brace: }
      {sub}
      *@math C1 l17
       *brace_command_context C3
        {a!"}
        *@@
        {b}
      { sub "!}
      *@@
      { }
      *@" C1 l17
       *following_arg C1
        {a}
      { }
      *@" C1 l17
       *brace_container C1
        {o}
      {spaces_at_end: }
      *@seealso C1 l17
       *brace_arg C7
        *@math C1 l17
         *brace_command_context C3
          {a!"}
          *@@
          {b}
        { "!}
        *@@
        { }
        *@" C1 l17
         *following_arg C1
          {a}
        { }
        *@" C1 l17
         *brace_container C1
          {o}
  *index_entry_command@cindex C1 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,8}
  |index_ignore_chars:{\\}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {\\cmd}
  *index_entry_command@cindex C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,9}
  |index_ignore_chars:{\\}
  |sortas:{\\cmd}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {totocmd}
    {spaces_at_end: }
    *@sortas C1 l19
     *brace_arg C1
      {\\cmd}
  {empty_line:\\n}
  *@clear C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{txiindexbackslashignore}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txiindexbackslashignore}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,10}
   *line_arg C2
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
      |{rawline_text:comment}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {\\some\\command for }
    *@file C1 l23
     *brace_container C1
      {file}
  {empty_line:\\n}
  *index_entry_command@findex C1 l25
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{fn,1}
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {the }
    *@r C1 l25
     *brace_container C1
      {person}
    { index }
    *@file C1 l25
     *brace_container C1
      {aa}
  {empty_line:\\n}
  *@printindex C1 l27
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
  *@printindex C1 l29
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
';


$result_texis{'indices_disable_encoding'} = '
@set txiindexbackslashignore

@node Top
@top top section

@node chapter
@chapter Index

@cindex @"a @"{o}
@cindex AA
@cindex aa
@cindex i
@cindex Z
@cindex @^i

@cindex @math{a!"@@b} "!@@ @"a @"{o} @subentry @sortas{a!"@@b} sub@math{a!"@@b} sub "!@@ @"a @"{o} @seealso{@math{a!"@@b} "!@@ @"a @"{o}}
@cindex \\cmd
@cindex totocmd @sortas{\\cmd}

@clear txiindexbackslashignore

@cindex \\some\\command for @file{file} @c comment

@findex the @r{person} index @file{aa}

@printindex cp

@printindex fn
';


$result_texts{'indices_disable_encoding'} = '
top section
***********

1 Index
*******







';

$result_errors{'indices_disable_encoding'} = '* E l23|misplaced {
 misplaced {

* E l23|misplaced }
 misplaced }

';

$result_nodes_list{'indices_disable_encoding'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Index
 associated_title_command: 1 Index
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'indices_disable_encoding'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Index
 section_children:
  1|Index
2|Index
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'indices_disable_encoding'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'indices_disable_encoding'} = '';

$result_indices_sort_strings{'indices_disable_encoding'} = 'cp:
 \\cmd
 \\some\\command for file
 ä ö
 a!"@b "!@ ä ö, a!"@b
 AA
 aa
 cmd
 i
 î
 Z
fn:
 the person index aa
';


$result_converted{'latex_text'}->{'indices_disable_encoding'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Index}}
\\label{anchor:chapter}%

\\index[cp]{a"" o""@"\\""{a} "\\""{o}}%
\\index[cp]{AA@AA}%
\\index[cp]{aa@aa}%
\\index[cp]{i@i}%
\\index[cp]{Z@Z}%
\\index[cp]{i\\^{}@\\^{i}}%

\\index[cp]{a"!"""@b """!"@ a"" o""@$a"!"""@b$ """!"@ "\\""{a} "\\""{o}!a"!"""@b@sub$a"!"""@b$ sub """!"@ "\\""{a} "\\""{o}|seealso{$a!"@b$ "!@ \\"{a} \\"{o}}}%
\\index[cp]{cmd@\\textbackslash{}cmd}%
\\index[cp]{\\textbackslash{}cmd@totocmd}%


\\index[cp]{\\textbackslash{}some\\textbackslash{}command for file@\\textbackslash{}some\\textbackslash{}command for \\texttt{file}}%

\\index[fn]{the person index aa@\\texttt{the \\textnormal{person}\\ index \\texttt{aa}}}%

\\printindex[cp]

\\printindex[fn]
';

1;
