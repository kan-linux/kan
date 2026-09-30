use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'example_class'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {perl}
   *preformatted C21
    {foreach my $unclosed_file (keys(%unclosed_files)) }
    *@{
    {\\n}
    {  if (!close($unclosed_files}
    *@{
    {$unclosed_file}
    *@}
    {)) }
    *@{
    {\\n}
    {    warn(sprintf("%s: error on closing %s: %s\\n",\\n}
    {                     $real_command_name, $unclosed_file, $!));\\n}
    {    $error_count++;\\n}
    {    _exit($error_count, \\}
    *@@
    {opened_files);\\n}
    {  }
    *@}
    {\\n}
    *@}
    {\\n}
   *@end C1 l10
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
';


$result_texis{'example_class'} = '@example perl
foreach my $unclosed_file (keys(%unclosed_files)) @{
  if (!close($unclosed_files@{$unclosed_file@})) @{
    warn(sprintf("%s: error on closing %s: %s\\n",
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@@opened_files);
  @}
@}
@end example
';


$result_texts{'example_class'} = 'foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf("%s: error on closing %s: %s\\n",
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
';

$result_errors{'example_class'} = '';

$result_nodes_list{'example_class'} = '';

$result_sections_list{'example_class'} = '';

$result_sectioning_root{'example_class'} = '';

$result_headings_list{'example_class'} = '';


$result_converted{'plaintext'}->{'example_class'} = '     foreach my $unclosed_file (keys(%unclosed_files)) {
       if (!close($unclosed_files{$unclosed_file})) {
         warn(sprintf("%s: error on closing %s: %s\\n",
                          $real_command_name, $unclosed_file, $!));
         $error_count++;
         _exit($error_count, \\@opened_files);
       }
     }
';


$result_converted{'html'}->{'example_class'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
div.example {margin-left: 3.2em}
</style>


</head>

<body>
<div class="example user-perl">
<pre class="example-preformatted">foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_class'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'example_class'} = '<screen>foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
</screen>';


$result_converted{'xml'}->{'example_class'} = '<example spaces=" " endspaces=" "><examplelanguage>perl</examplelanguage>
<pre xml:space="preserve">foreach my $unclosed_file (keys(%unclosed_files)) &lbrace;
  if (!close($unclosed_files&lbrace;$unclosed_file&rbrace;)) &lbrace;
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\&arobase;opened_files);
  &rbrace;
&rbrace;
</pre></example>
';


$result_converted{'latex_text'}->{'example_class'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily foreach my \\$unclosed\\_file (keys(\\%unclosed\\_files)) \\{
\\  if (!close(\\$unclosed\\_files\\{\\$unclosed\\_file\\})) \\{
\\    warn(sprintf("\\%s:\\ error on closing \\%s:\\ \\%s\\textbackslash{}n",
\\                     \\$real\\_command\\_name,\\ \\$unclosed\\_file,\\ \\$!));
\\    \\$error\\_count++;
\\    \\_exit(\\$error\\_count,\\ \\textbackslash{}@opened\\_files);
\\  \\}
\\}
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
