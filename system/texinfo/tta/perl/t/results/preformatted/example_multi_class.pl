use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'example_multi_class'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C4
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {C++}
    *block_line_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {gothic}
    *block_line_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {purple}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {embed}
   *preformatted C29
    {void StateManager::deallocate() }
    *@{
    {\\n}
    {    if(buffer) }
    *@{
    {\\n}
    {        delete [] buffer;\\n}
    {        buffer = NULL;\\n}
    {    }
    *@}
    {\\n}
    {    if(tmp_state) }
    *@{
    {\\n}
    {        delete [] tmp_state;\\n}
    {        tmp_state = NULL;\\n}
    {    }
    *@}
    {\\n}
    {    if(in_state) }
    *@{
    {\\n}
    {        delete [] in_state;\\n}
    {        in_state = NULL;\\n}
    {    }
    *@}
    {\\n}
    *@}
    {\\n}
   *@end C1 l16
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


$result_texis{'example_multi_class'} = '@example C++ , gothic, purple, embed
void StateManager::deallocate() @{
    if(buffer) @{
        delete [] buffer;
        buffer = NULL;
    @}
    if(tmp_state) @{
        delete [] tmp_state;
        tmp_state = NULL;
    @}
    if(in_state) @{
        delete [] in_state;
        in_state = NULL;
    @}
@}
@end example
';


$result_texts{'example_multi_class'} = 'void StateManager::deallocate() {
    if(buffer) {
        delete [] buffer;
        buffer = NULL;
    }
    if(tmp_state) {
        delete [] tmp_state;
        tmp_state = NULL;
    }
    if(in_state) {
        delete [] in_state;
        in_state = NULL;
    }
}
';

$result_errors{'example_multi_class'} = '';

$result_nodes_list{'example_multi_class'} = '';

$result_sections_list{'example_multi_class'} = '';

$result_sectioning_root{'example_multi_class'} = '';

$result_headings_list{'example_multi_class'} = '';


$result_converted{'plaintext'}->{'example_multi_class'} = '     void StateManager::deallocate() {
         if(buffer) {
             delete [] buffer;
             buffer = NULL;
         }
         if(tmp_state) {
             delete [] tmp_state;
             tmp_state = NULL;
         }
         if(in_state) {
             delete [] in_state;
             in_state = NULL;
         }
     }
';


$result_converted{'html'}->{'example_multi_class'} = '<!DOCTYPE html>
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
<div class="example user-C++ user-gothic user-purple user-embed">
<pre class="example-preformatted">void StateManager::deallocate() {
    if(buffer) {
        delete [] buffer;
        buffer = NULL;
    }
    if(tmp_state) {
        delete [] tmp_state;
        tmp_state = NULL;
    }
    if(in_state) {
        delete [] in_state;
        in_state = NULL;
    }
}
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_multi_class'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'example_multi_class'} = '<screen>void StateManager::deallocate() {
    if(buffer) {
        delete [] buffer;
        buffer = NULL;
    }
    if(tmp_state) {
        delete [] tmp_state;
        tmp_state = NULL;
    }
    if(in_state) {
        delete [] in_state;
        in_state = NULL;
    }
}
</screen>';


$result_converted{'xml'}->{'example_multi_class'} = '<example spaces=" " endspaces=" "><examplelanguage trailingspaces=" ">C++</examplelanguage><examplearg spaces=" ">gothic</examplearg><examplearg spaces=" ">purple</examplearg><examplearg spaces=" ">embed</examplearg>
<pre xml:space="preserve">void StateManager::deallocate() &lbrace;
    if(buffer) &lbrace;
        delete [] buffer;
        buffer = NULL;
    &rbrace;
    if(tmp_state) &lbrace;
        delete [] tmp_state;
        tmp_state = NULL;
    &rbrace;
    if(in_state) &lbrace;
        delete [] in_state;
        in_state = NULL;
    &rbrace;
&rbrace;
</pre></example>
';


$result_converted{'latex_text'}->{'example_multi_class'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily void StateManager::deallocate() \\{
\\    if(buffer) \\{
\\        delete [] buffer;
\\        buffer = NULL;
\\    \\}
\\    if(tmp\\_state) \\{
\\        delete [] tmp\\_state;
\\        tmp\\_state = NULL;
\\    \\}
\\    if(in\\_state) \\{
\\        delete [] in\\_state;
\\        in\\_state = NULL;
\\    \\}
\\}
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
