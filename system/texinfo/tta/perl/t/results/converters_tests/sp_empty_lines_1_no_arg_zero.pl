use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sp_empty_lines_1_no_arg_zero'} = '*document_root C1
 *before_node_section C39
  *paragraph C1
   {A\\n}
  {empty_line:\\n}
  *paragraph C1
   {A010\\n}
  *@sp C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  *paragraph C1
   {A110\\n}
  {empty_line:\\n}
  *@sp C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  *paragraph C1
   {A011\\n}
  {empty_line:\\n}
  *@sp C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  *paragraph C1
   {A111\\n}
  {empty_line:\\n}
  *@sp C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  {empty_line:\\n}
  *paragraph C1
   {A000\\n}
  *@sp C1 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0}
  *paragraph C1
   {A100\\n}
  {empty_line:\\n}
  *@sp C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0}
  *paragraph C1
   {A001\\n}
  {empty_line:\\n}
  *@sp C1 l22
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0}
  *paragraph C1
   {A101\\n}
  {empty_line:\\n}
  *@sp C1 l25
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0}
  {empty_line:\\n}
  *paragraph C1
   {A0 0\\n}
  *@sp C1 l28
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *paragraph C1
   {A1 0\\n}
  {empty_line:\\n}
  *@sp C1 l31
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
  *paragraph C1
   {A0 1\\n}
  {empty_line:\\n}
  *@sp C1 l34
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *paragraph C1
   {A1 1\\n}
  {empty_line:\\n}
  *@sp C1 l37
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
  {empty_line:\\n}
  *paragraph C1
   {B}
';


$result_texis{'sp_empty_lines_1_no_arg_zero'} = 'A

A010
@sp 1
A110

@sp 1
A011

@sp 1
A111

@sp 1

A000
@sp 0
A100

@sp 0
A001

@sp 0
A101

@sp 0

A0 0
@sp
A1 0

@sp 
A0 1

@sp
A1 1

@sp 

B';


$result_texts{'sp_empty_lines_1_no_arg_zero'} = 'A

A010

A110


A011


A111



A000
A100

A001

A101


A0 0
A1 0

A0 1

A1 1


B';

$result_errors{'sp_empty_lines_1_no_arg_zero'} = '* E l28|@sp missing argument
 @sp missing argument

* E l31|@sp missing argument
 @sp missing argument

* E l34|@sp missing argument
 @sp missing argument

* E l37|@sp missing argument
 @sp missing argument

';

$result_nodes_list{'sp_empty_lines_1_no_arg_zero'} = '';

$result_sections_list{'sp_empty_lines_1_no_arg_zero'} = '';

$result_sectioning_root{'sp_empty_lines_1_no_arg_zero'} = '';

$result_headings_list{'sp_empty_lines_1_no_arg_zero'} = '';


$result_converted{'plaintext'}->{'sp_empty_lines_1_no_arg_zero'} = 'A

   A010

   A110


   A011


   A111


   A000
   A100

   A001

   A101

   A0 0

   A1 0


   A0 1


   A1 1


   B
';


$result_converted{'html_text'}->{'sp_empty_lines_1_no_arg_zero'} = '<p>A
</p>
<p>A010
</p><br>
<p>A110
</p>
<br>
<p>A011
</p>
<br>
<p>A111
</p>
<br>

<p>A000
</p><p>A100
</p>
<p>A001
</p>
<p>A101
</p>

<p>A0 0
</p><br>
<p>A1 0
</p>
<br>
<p>A0 1
</p>
<br>
<p>A1 1
</p>
<br>

<p>B</p>';


$result_converted{'xml'}->{'sp_empty_lines_1_no_arg_zero'} = '<para>A
</para>
<para>A010
</para><sp spaces=" " value="1" line="1"></sp>
<para>A110
</para>
<sp spaces=" " value="1" line="1"></sp>
<para>A011
</para>
<sp spaces=" " value="1" line="1"></sp>
<para>A111
</para>
<sp spaces=" " value="1" line="1"></sp>

<para>A000
</para><sp spaces=" " value="0" line="0"></sp>
<para>A100
</para>
<sp spaces=" " value="0" line="0"></sp>
<para>A001
</para>
<sp spaces=" " value="0" line="0"></sp>
<para>A101
</para>
<sp spaces=" " value="0" line="0"></sp>

<para>A0 0
</para><sp></sp>
<para>A1 0
</para>
<sp line=" "></sp>
<para>A0 1
</para>
<sp></sp>
<para>A1 1
</para>
<sp line=" "></sp>

<para>B</para>';


$result_converted{'docbook'}->{'sp_empty_lines_1_no_arg_zero'} = '<para>A
</para>
<para>A010
</para><para>A110
</para>
<para>A011
</para>
<para>A111
</para>

<para>A000
</para><para>A100
</para>
<para>A001
</para>
<para>A101
</para>

<para>A0 0
</para><para>A1 0
</para>
<para>A0 1
</para>
<para>A1 1
</para>

<para>B</para>';


$result_converted{'latex_text'}->{'sp_empty_lines_1_no_arg_zero'} = 'A

A010
\\vskip 1\\baselineskip %
A110

\\vskip 1\\baselineskip %
A011

\\vskip 1\\baselineskip %
A111

\\vskip 1\\baselineskip %

A000
\\vskip 0\\baselineskip %
A100

\\vskip 0\\baselineskip %
A001

\\vskip 0\\baselineskip %
A101

\\vskip 0\\baselineskip %

A0 0
\\vskip \\baselineskip %
A1 0

\\vskip \\baselineskip %
A0 1

\\vskip \\baselineskip %
A1 1

\\vskip \\baselineskip %

B';

1;
