use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlineifsetifclearspaces'} = '*document_root C1
 *before_node_section C9
  *paragraph C2
   *@inlineifclear C2 l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {aaa}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {iclear first }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C2 l4
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
   |EXTRA
   |format:{aaa}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {aaa}
    *elided_brace_command_arg C1
     {raw: ifset first }
   {.\\n}
  {empty_line:\\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{aaa|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:aaa}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifclear C2 l9
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   |EXTRA
   |format:{aaa}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {aaa}
    *elided_brace_command_arg C1
     {raw: ifclear second }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C2 l11
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {aaa}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {ifset second }
   {.\\n}
';


$result_texis{'inlineifsetifclearspaces'} = '@inlineifclear
{ aaa , iclear first }.

@inlineifset
{ aaa , ifset first }.

@set aaa

@inlineifclear { aaa , ifclear second }.

@inlineifset { aaa , ifset second }.
';


$result_texts{'inlineifsetifclearspaces'} = 'iclear first .

.


.

ifset second .
';

$result_errors{'inlineifsetifclearspaces'} = '* W l1|command `@inlineifclear\' must not be followed by new line
 warning: command `@inlineifclear\' must not be followed by new line

* W l4|command `@inlineifset\' must not be followed by new line
 warning: command `@inlineifset\' must not be followed by new line

';

$result_nodes_list{'inlineifsetifclearspaces'} = '';

$result_sections_list{'inlineifsetifclearspaces'} = '';

$result_sectioning_root{'inlineifsetifclearspaces'} = '';

$result_headings_list{'inlineifsetifclearspaces'} = '';


$result_converted{'plaintext'}->{'inlineifsetifclearspaces'} = 'iclear first .

   .

   .

   ifset second .
';


$result_converted{'html_text'}->{'inlineifsetifclearspaces'} = '<p>iclear first .
</p>
<p>.
</p>

<p>.
</p>
<p>ifset second .
</p>';


$result_converted{'xml'}->{'inlineifsetifclearspaces'} = '<para><inlineifclear spacesaftercmd="\\n"><inlineifclearformat spaces=" ">aaa </inlineifclearformat><inlineifclearcontent spaces=" ">iclear first </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset spacesaftercmd="\\n"><inlineifsetformat spaces=" ">aaa </inlineifsetformat><inlineifsetcontent> ifset first </inlineifsetcontent></inlineifset>.
</para>
<set name="aaa" spaces=" ">aaa</set>

<para><inlineifclear spacesaftercmd=" "><inlineifclearformat spaces=" ">aaa </inlineifclearformat><inlineifclearcontent> ifclear second </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset spacesaftercmd=" "><inlineifsetformat spaces=" ">aaa </inlineifsetformat><inlineifsetcontent spaces=" ">ifset second </inlineifsetcontent></inlineifset>.
</para>';


$result_converted{'docbook'}->{'inlineifsetifclearspaces'} = '<para>iclear first .
</para>
<para>.
</para>

<para>.
</para>
<para>ifset second .
</para>';


$result_converted{'latex_text'}->{'inlineifsetifclearspaces'} = 'iclear first .

.


.

ifset second .
';

1;
