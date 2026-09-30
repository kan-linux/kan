use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'lettered_accent_and_spaces'} = '*document_root C1
 *before_node_section C16
  *paragraph C2
   *@ringaccent C1 l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:    }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C1 l3
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
    *brace_container C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C1 l6
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C1 l9
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n  }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C1 l12
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C1 l14
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C1 l17
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C1 l20
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *brace_container C1
     {a\\n}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'lettered_accent_and_spaces'} = '@ringaccent    a

@ringaccent
{a}

@ringaccent
a

@ringaccent
  a

@^ a

@^
a

@^
 a

@^ {a
}

';


$result_texts{'lettered_accent_and_spaces'} = 'a*

a*

a*

a*

a^

a^

a^

a
^

';

$result_errors{'lettered_accent_and_spaces'} = '* W l3|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l6|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l9|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l14|command `@^\' must not be followed by new line
 warning: command `@^\' must not be followed by new line

* W l17|command `@^\' must not be followed by new line
 warning: command `@^\' must not be followed by new line

';

$result_nodes_list{'lettered_accent_and_spaces'} = '';

$result_sections_list{'lettered_accent_and_spaces'} = '';

$result_sectioning_root{'lettered_accent_and_spaces'} = '';

$result_headings_list{'lettered_accent_and_spaces'} = '';


$result_converted{'plaintext'}->{'lettered_accent_and_spaces'} = 'å

   å

   å

   å

   â

   â

   â

   a ̂

';


$result_converted{'html_text'}->{'lettered_accent_and_spaces'} = '<p>&aring;
</p>
<p>&aring;
</p>
<p>&aring;
</p>
<p>&aring;
</p>
<p>&acirc;
</p>
<p>&acirc;
</p>
<p>&acirc;
</p>
<p>a
&#770;
</p>
';


$result_converted{'xml'}->{'lettered_accent_and_spaces'} = '<para><accent type="ring" spacesaftercmd="    " bracketed="off">a</accent>
</para>
<para><accent type="ring" spacesaftercmd="\\n">a</accent>
</para>
<para><accent type="ring" spacesaftercmd="\\n" bracketed="off">a</accent>
</para>
<para><accent type="ring" spacesaftercmd="\\n  " bracketed="off">a</accent>
</para>
<para><accent type="circ" spacesaftercmd=" " bracketed="off">a</accent>
</para>
<para><accent type="circ" spacesaftercmd="\\n" bracketed="off">a</accent>
</para>
<para><accent type="circ" spacesaftercmd="\\n " bracketed="off">a</accent>
</para>
<para><accent type="circ" spacesaftercmd=" ">a
</accent>
</para>
';


$result_converted{'latex_text'}->{'lettered_accent_and_spaces'} = '\\r{a}

\\r{a}

\\r{a}

\\r{a}

\\^{a}

\\^{a}

\\^{a}

\\^{a
}

';


$result_converted{'docbook'}->{'lettered_accent_and_spaces'} = '<para>&#229;
</para>
<para>&#229;
</para>
<para>&#229;
</para>
<para>&#229;
</para>
<para>&#226;
</para>
<para>&#226;
</para>
<para>&#226;
</para>
<para>a
&#770;
</para>
';

1;
