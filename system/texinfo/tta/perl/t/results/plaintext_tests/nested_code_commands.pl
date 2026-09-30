use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested_code_commands'} = '*document_root C1
 *before_node_section C5
  *paragraph C16
   *@code C1 l1
    *brace_container C2
     {aA }
     *@kbd C1 l1
      *brace_container C1
       {fg}
   {.\\n}
   *@code C1 l2
    *brace_container C2
     {cc }
     *@code C1 l2
      *brace_container C1
       {gg}
   {.\\n}
   *@command C1 l3
    *brace_container C2
     {in command }
     *@kbd C1 l3
      *brace_container C1
       {fg}
   {\\n}
   *@code C1 l4
    *brace_container C2
     {in code }
     *@command C1 l4
      *brace_container C1
       {in command}
   {\\n}
   *@samp C1 l5
    *brace_container C2
     {in samp }
     *@code C1 l5
      *brace_container C1
       {in code}
   {\\n}
   *@code C1 l6
    *brace_container C2
     {in code }
     *@samp C1 l6
      *brace_container C1
       {in samp}
   {\\n}
   *@var C1 l7
    *brace_container C2
     {in var }
     *@code C1 l7
      *brace_container C1
       {in code}
   {\\n}
   *@code C1 l8
    *brace_container C2
     {in code }
     *@var C1 l8
      *brace_container C1
       {in var}
   {\\n}
  {empty_line:\\n}
  *@example C3 l10
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C18
    *@code C1 l11
     *brace_container C1
      {in code}
    {\\n}
    *@code C1 l12
     *brace_container C2
      {aA }
      *@kbd C1 l12
       *brace_container C1
        {fg}
    {\\n}
    *@kbd C1 l13
     *brace_container C1
      {hh}
    {\\n}
    *@command C1 l14
     *brace_container C2
      {in command }
      *@kbd C1 l14
       *brace_container C1
        {fg}
    {\\n}
    *@code C1 l15
     *brace_container C2
      {in code }
      *@command C1 l15
       *brace_container C1
        {in command}
    {\\n}
    *@samp C1 l16
     *brace_container C2
      {in samp }
      *@code C1 l16
       *brace_container C1
        {in code}
    {\\n}
    *@code C1 l17
     *brace_container C2
      {in code }
      *@samp C1 l17
       *brace_container C1
        {in samp}
    {\\n}
    *@var C1 l18
     *brace_container C2
      {in var }
      *@code C1 l18
       *brace_container C1
        {in code}
    {\\n}
    *@code C1 l19
     *brace_container C2
      {in code }
      *@var C1 l19
       *brace_container C1
        {in var}
    {\\n}
   *@end C1 l20
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
  *@display C3 l22
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C16
    *@kbd C1 l23
     *brace_container C1
      {in disp}
    {\\n}
    *@code C1 l24
     *brace_container C2
      {aA }
      *@kbd C1 l24
       *brace_container C1
        {fg}
    {\\n}
    *@command C1 l25
     *brace_container C2
      {in command }
      *@kbd C1 l25
       *brace_container C1
        {fg}
    {\\n}
    *@code C1 l26
     *brace_container C2
      {in code }
      *@command C1 l26
       *brace_container C1
        {in command}
    {\\n}
    *@samp C1 l27
     *brace_container C2
      {in samp }
      *@code C1 l27
       *brace_container C1
        {in code}
    {\\n}
    *@code C1 l28
     *brace_container C2
      {in code }
      *@samp C1 l28
       *brace_container C1
        {in samp}
    {\\n}
    *@var C1 l29
     *brace_container C2
      {in var }
      *@code C1 l29
       *brace_container C1
        {in code}
    {\\n}
    *@code C1 l30
     *brace_container C2
      {in code }
      *@var C1 l30
       *brace_container C1
        {in var}
    {\\n}
   *@end C1 l31
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
';


$result_texis{'nested_code_commands'} = '@code{aA @kbd{fg}}.
@code{cc @code{gg}}.
@command{in command @kbd{fg}}
@code{in code @command{in command}}
@samp{in samp @code{in code}}
@code{in code @samp{in samp}}
@var{in var @code{in code}}
@code{in code @var{in var}}

@example
@code{in code}
@code{aA @kbd{fg}}
@kbd{hh}
@command{in command @kbd{fg}}
@code{in code @command{in command}}
@samp{in samp @code{in code}}
@code{in code @samp{in samp}}
@var{in var @code{in code}}
@code{in code @var{in var}}
@end example

@display
@kbd{in disp}
@code{aA @kbd{fg}}
@command{in command @kbd{fg}}
@code{in code @command{in command}}
@samp{in samp @code{in code}}
@code{in code @samp{in samp}}
@var{in var @code{in code}}
@code{in code @var{in var}}
@end display
';


$result_texts{'nested_code_commands'} = 'aA fg.
cc gg.
in command fg
in code in command
in samp in code
in code in samp
in var in code
in code in var

in code
aA fg
hh
in command fg
in code in command
in samp in code
in code in samp
in var in code
in code in var

in disp
aA fg
in command fg
in code in command
in samp in code
in code in samp
in var in code
in code in var
';

$result_errors{'nested_code_commands'} = '';

$result_nodes_list{'nested_code_commands'} = '';

$result_sections_list{'nested_code_commands'} = '';

$result_sectioning_root{'nested_code_commands'} = '';

$result_headings_list{'nested_code_commands'} = '';


$result_converted{'plaintext'}->{'nested_code_commands'} = '‘aA fg’.  ‘cc gg’.  ‘in command fg’ ‘in code in command’ ‘in samp ‘in
code’’ ‘in code ‘in samp’’ IN VAR ‘IN CODE’ ‘in code IN VAR’

     in code
     aA fg
     hh
     in command fg
     in code in command
     ‘in samp in code’
     in code ‘in samp’
     IN VAR IN CODE
     in code IN VAR

     ‘in disp’
     ‘aA fg’
     ‘in command fg’
     ‘in code in command’
     ‘in samp ‘in code’’
     ‘in code ‘in samp’’
     IN VAR ‘IN CODE’
     ‘in code IN VAR’
';

1;
