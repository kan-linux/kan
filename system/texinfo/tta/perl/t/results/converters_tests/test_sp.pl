use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_sp'} = '*document_root C1
 *before_node_section C15
  *paragraph C1
   {Para\\n}
  *@sp C1 l2
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
  *paragraph C4
   {other para\\n}
   {Now lone }
   *@@
   {sp:\\n}
  {empty_line:\\n}
  *@sp C1 l6
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
  *@sp C1 l8
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  *paragraph C1
   {Para after sp\\n}
  {empty_line:\\n}
  *paragraph C1
   {A\\n}
  *@sp C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  *paragraph C1
   {B\\n}
  {empty_line:\\n}
  *paragraph C1
   {sp after para\\n}
  *@sp C1 l16
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
';


$result_texis{'test_sp'} = 'Para
@sp 1
other para
Now lone @@sp:

@sp 1

@sp 2
Para after sp

A
@sp 2
B

sp after para
@sp 1
';


$result_texts{'test_sp'} = 'Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

';

$result_errors{'test_sp'} = '';

$result_nodes_list{'test_sp'} = '';

$result_sections_list{'test_sp'} = '';

$result_sectioning_root{'test_sp'} = '';

$result_headings_list{'test_sp'} = '';


$result_converted{'plaintext'}->{'test_sp'} = 'Para

   other para Now lone @sp:




   Para after sp

   A


   B

   sp after para

';


$result_converted{'html_text'}->{'test_sp'} = '<p>Para
</p><br>
<p>other para
Now lone @sp:
</p>
<br>

<br>
<br>
<p>Para after sp
</p>
<p>A
</p><br>
<br>
<p>B
</p>
<p>sp after para
</p><br>
';


$result_converted{'xml'}->{'test_sp'} = '<para>Para
</para><sp spaces=" " value="1" line="1"></sp>
<para>other para
Now lone &arobase;sp:
</para>
<sp spaces=" " value="1" line="1"></sp>

<sp spaces=" " value="2" line="2"></sp>
<para>Para after sp
</para>
<para>A
</para><sp spaces=" " value="2" line="2"></sp>
<para>B
</para>
<para>sp after para
</para><sp spaces=" " value="1" line="1"></sp>
';


$result_converted{'docbook'}->{'test_sp'} = '<para>Para
</para><para>other para
Now lone @sp:
</para>

<para>Para after sp
</para>
<para>A
</para><para>B
</para>
<para>sp after para
</para>';


$result_converted{'latex_text'}->{'test_sp'} = 'Para
\\vskip 1\\baselineskip %
other para
Now lone @sp:

\\vskip 1\\baselineskip %

\\vskip 2\\baselineskip %
Para after sp

A
\\vskip 2\\baselineskip %
B

sp after para
\\vskip 1\\baselineskip %
';

1;
