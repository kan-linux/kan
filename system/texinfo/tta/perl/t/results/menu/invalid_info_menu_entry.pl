use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_info_menu_entry'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *@menu C7 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{@asis{a:}}
    |normalized:{a_003a}
     {(}
     {f}
     {)}
     *@asis C1 l4
      *brace_container C1
       {a:}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *@asis C1 l5
      *brace_container C1
       {name:}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{node}
    |normalized:{node}
     {(}
     {f}
     {)}
     {node}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {name}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{@asis{node. }}
    |normalized:{node_002e-}
     {(}
     {f}
     {)}
     *@asis C1 l6
      *brace_container C1
       {node. }
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {d\\n}
   *menu_entry C6 l7
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {name}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{@asis{node,n}}
    |normalized:{node_002cn}
     {(}
     {f}
     {)}
     *@asis C1 l7
      *brace_container C1
       {node,n}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {d2\\n}
   *menu_entry C6 l8
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {name}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{@asis{node\\tn}}
    |normalized:{node-n}
     {(}
     {f}
     {)}
     *@asis C1 l8
      *brace_container C1
       {node\\tn}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {d3\\n}
   *@end C1 l9
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
';


$result_texis{'invalid_info_menu_entry'} = '@node first

@menu
* (f)@asis{a:}::
* @asis{name:}: (f)node.
* name: (f)@asis{node. }. d
* name: (f)@asis{node,n}. d2
* name: (f)@asis{node	n}. d3
@end menu
';


$result_texts{'invalid_info_menu_entry'} = '
* (f)a:::
* name:: (f)node.
* name: (f)node. . d
* name: (f)node,n. d2
* name: (f)node	n. d3
';

$result_errors{'invalid_info_menu_entry'} = '';

$result_nodes_list{'invalid_info_menu_entry'} = '1|first
 menus:
  (f)@asis{a:}
  (f)node
  (f)@asis{node. }
  (f)@asis{node,n}
  (f)@asis{node	n}
';

$result_sections_list{'invalid_info_menu_entry'} = '';

$result_sectioning_root{'invalid_info_menu_entry'} = '';

$result_headings_list{'invalid_info_menu_entry'} = '';


$result_converted{'plaintext'}->{'invalid_info_menu_entry'} = '* Menu:

* (f)a:::
* name:: (f)node.
* name: (f)node. . d
* name: (f)node,n. d2
* name: (f)node	n. d3
';

$result_converted_errors{'plaintext'}->{'invalid_info_menu_entry'} = '* W l4|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l5|menu entry name should not contain `:\'
 warning: menu entry name should not contain `:\'

* W l6|menu entry node name should not contain `. \'
 warning: menu entry node name should not contain `. \'

* W l7|menu entry node name should not contain `,\'
 warning: menu entry node name should not contain `,\'

* W l8|menu entry node name should not contain `	\'
 warning: menu entry node name should not contain `	\'

';


$result_converted{'html'}->{'invalid_info_menu_entry'} = '<!DOCTYPE html>
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

<link href="#first" rel="start" title="first">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<h4 class="node" id="first"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a_003a" accesskey="1">(f)a:</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#node" accesskey="2">name:</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#node_002e-" accesskey="3">name</a>:</td><td class="menu-entry-description">d
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#node_002cn" accesskey="4">name</a>:</td><td class="menu-entry-description">d2
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#node-n" accesskey="5">name</a>:</td><td class="menu-entry-description">d3
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'invalid_info_menu_entry'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'invalid_info_menu_entry'} = '<node identifier="first" spaces=" "><nodename>first</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)<asis>a:</asis></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle><asis>name:</asis></menutitle><menuseparator>: </menuseparator><menunode>(f)node</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name</menutitle><menuseparator>: </menuseparator><menunode>(f)<asis>node. </asis></menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">d
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name</menutitle><menuseparator>: </menuseparator><menunode>(f)<asis>node,n</asis></menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">d2
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name</menutitle><menuseparator>: </menuseparator><menunode>(f)<asis>node	n</asis></menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">d3
</pre></menudescription></menuentry></menu>
';

1;
