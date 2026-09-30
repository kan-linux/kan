use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_ref_arg'} = '*document_root C2
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
  *paragraph C8
   *@ref C2 l3
    *brace_arg C1
    |EXTRA
    |node_content:{first}
    |normalized:{first}
     {first}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@ 
   {\\n}
   *@ref C3 l4
    *brace_arg C1
    |EXTRA
    |node_content:{first}
    |normalized:{first}
     {first}
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@ 
   {\\n}
   *@ref C3 l5
    *brace_arg C1
    |EXTRA
    |node_content:{first}
    |normalized:{first}
     {first}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@ 
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@:
   {\\n}
   *@ref C3 l6
    *brace_arg C1
    |EXTRA
    |node_content:{first}
    |normalized:{first}
     {first}
    *brace_arg C5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:aaa}
     { }
     *@ 
     {\\n}
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:ggg}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:fff}
     *@c C1
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:}
   {\\n}
';


$result_texis{'empty_ref_arg'} = '@node first

@ref{first, @ }
@ref{first, , @ }
@ref{first, @ , @:}
@ref{first, @c aaa
 @ 
@c ggg
, @c fff
@c
}
';


$result_texts{'empty_ref_arg'} = '
first
first
first
first
';

$result_errors{'empty_ref_arg'} = '* W l3|in @ref empty cross reference name after expansion `@ \'
 warning: in @ref empty cross reference name after expansion `@ \'

* W l4|in @ref empty cross reference title after expansion `@ \'
 warning: in @ref empty cross reference title after expansion `@ \'

* W l5|in @ref empty cross reference name after expansion `@ \'
 warning: in @ref empty cross reference name after expansion `@ \'

* W l5|in @ref empty cross reference title after expansion `@:\'
 warning: in @ref empty cross reference title after expansion `@:\'

* W l11|in @ref empty cross reference name after expansion `@c aaa
 @ 
@c ggg
\'
 warning: in @ref empty cross reference name after expansion `@c aaa
 @ 
@c ggg
\'

* W l11|in @ref empty cross reference title after expansion `@c fff
@c
\'
 warning: in @ref empty cross reference title after expansion `@c fff
@c
\'

';

$result_nodes_list{'empty_ref_arg'} = '1|first
';

$result_sections_list{'empty_ref_arg'} = '';

$result_sectioning_root{'empty_ref_arg'} = '';

$result_headings_list{'empty_ref_arg'} = '';


$result_converted{'xml'}->{'empty_ref_arg'} = '<node identifier="first" spaces=" "><nodename>first</nodename></node>

<para><ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname spaces=" "><spacecmd type="spc"/></xrefinfoname></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname spaces=" "></xrefinfoname><xrefprinteddesc spaces=" "><spacecmd type="spc"/></xrefprinteddesc></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname spaces=" "><spacecmd type="spc"/></xrefinfoname><xrefprinteddesc spaces=" ">&noeos;</xrefprinteddesc></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname spaces=" "><!-- c aaa -->
 <spacecmd type="spc"/>
<!-- c ggg -->
</xrefinfoname><xrefprinteddesc spaces=" "><!-- c fff -->
<!-- c -->
</xrefprinteddesc></ref>
</para>';

1;
