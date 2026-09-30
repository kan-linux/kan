use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_documentlanguage'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *paragraph C2
   {documentlanguage }
   *@documentlanguage C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {en}
  {empty_line:\\n}
  *@documentlanguage C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |global_command_number:{2}
  |text_arg:{en }
   *line_arg C2
    {en }
    *@documentlanguage C1 l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument:  }
    |EXTRA
    |global_command_number:{3}
    |text_arg:{en}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:  \\n}
      {en}
  {empty_line:\\n}
  *@documentlanguage C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument:  }
  |EXTRA
  |global_command_number:{4}
  |text_arg:{en  after documentlanguage}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {en  after documentlanguage}
';


$result_texis{'bad_documentlanguage'} = '
documentlanguage @documentlanguage  en 

@documentlanguage  en @documentlanguage  en  

@documentlanguage  en  after documentlanguage
';


$result_texts{'bad_documentlanguage'} = '
documentlanguage 

';

$result_errors{'bad_documentlanguage'} = '* W l2|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* W l4|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* W l4|@documentlanguage should not appear in @documentlanguage
 warning: @documentlanguage should not appear in @documentlanguage

* E l4|bad argument to @documentlanguage: en @documentlanguage  en
 bad argument to @documentlanguage: en @documentlanguage  en

* W l6|en  after documentlanguage is not a valid language code
 warning: en  after documentlanguage is not a valid language code

';

$result_nodes_list{'bad_documentlanguage'} = '';

$result_sections_list{'bad_documentlanguage'} = '';

$result_sectioning_root{'bad_documentlanguage'} = '';

$result_headings_list{'bad_documentlanguage'} = '';

1;
