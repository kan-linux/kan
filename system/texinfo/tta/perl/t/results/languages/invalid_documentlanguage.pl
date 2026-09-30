use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_documentlanguage'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C19
   *@documentlanguage C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |text_arg:{%bm_AA}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {%bm_AA}
   *@documentlanguage C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{2}
   |text_arg:{cu*_FR}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cu*_FR}
   *@documentlanguage C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{3}
   |text_arg:{_JP}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {_JP}
   *@documentlanguage C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{4}
   |text_arg:{*_ZM}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {*_ZM}
   *@documentlanguage C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{5}
   |text_arg:{tia_JJ}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tia_JJ}
   *@documentlanguage C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{6}
   |text_arg:{fr_}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {fr_}
   *@documentlanguage C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{7}
   |text_arg:{be_}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {be_}
   *@documentlanguage C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{8}
   |text_arg:{de_*}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {de_*}
   *@documentlanguage C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{9}
   |text_arg:{it_G%}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {it_G%}
   *@documentlanguage C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{10}
   |text_arg:{it_FR^}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {it_FR^}
   *@documentlanguage C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{11}
   |text_arg:{en_US !}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {en_US !}
   *@documentlanguage C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{12}
   |text_arg:{ab gh}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ab gh}
   *@documentlanguage C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |global_command_number:{13}
   |text_arg:{es}
    *line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:in comment}
     {es}
   *@documentlanguage C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{14}
   |text_arg:{az}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {az}
   *@documentlanguage C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{15}
   |text_arg:{bhÃ©}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {bhÃ©}
   *@documentlanguage C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{16}
   |text_arg:{AB_FR}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {AB_FR}
   *@documentlanguage C1 l18
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{17}
   |text_arg:{ab_us}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ab_us}
   *@documentlanguage C1 l19
   |EXTRA
   |global_command_number:{18}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l21 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C4 l22 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@defivar C2 l24
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l24
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{Language}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{Which}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{Language}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{Which}
   |documentlanguage:{ab_us}
   |element_node:{Top}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{ab_us}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {Which}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {Language}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {Selected?}
   *@end C1 l25
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
  {empty_line:\\n}
';


$result_texis{'invalid_documentlanguage'} = '
@documentlanguage %bm_AA
@documentlanguage cu*_FR
@documentlanguage _JP
@documentlanguage *_ZM
@documentlanguage tia_JJ
@documentlanguage fr_
@documentlanguage be_
@documentlanguage de_*
@documentlanguage it_G%
@documentlanguage it_FR^
@documentlanguage en_US !
@documentlanguage ab gh
@documentlanguage  es@c in comment
@documentlanguage az
@documentlanguage bhÃ©
@documentlanguage AB_FR
@documentlanguage ab_us
@documentlanguage

@node Top
@top top

@defivar Which Language Selected?
@end defivar

';


$result_texts{'invalid_documentlanguage'} = '
top
***

Instance Variable of Which: Language Selected?

';

$result_errors{'invalid_documentlanguage'} = '* W l2|%bm_AA is not a valid language code
 warning: %bm_AA is not a valid language code

* W l3|cu*_FR is not a valid language code
 warning: cu*_FR is not a valid language code

* W l4|_JP is not a valid language code
 warning: _JP is not a valid language code

* W l5|*_ZM is not a valid language code
 warning: *_ZM is not a valid language code

* W l6|tia is not a valid language code
 warning: tia is not a valid language code

* W l6|JJ is not a valid region code
 warning: JJ is not a valid region code

* W l7|fr_ is not a valid language code
 warning: fr_ is not a valid language code

* W l8|be_ is not a valid language code
 warning: be_ is not a valid language code

* W l9|de_* is not a valid language code
 warning: de_* is not a valid language code

* W l10|it_G% is not a valid language code
 warning: it_G% is not a valid language code

* W l11|it_FR^ is not a valid language code
 warning: it_FR^ is not a valid language code

* W l12|en_US ! is not a valid language code
 warning: en_US ! is not a valid language code

* W l13|ab gh is not a valid language code
 warning: ab gh is not a valid language code

* W l16|bhÃ© is not a valid language code
 warning: bhÃ© is not a valid language code

* W l17|AB_FR is not a valid language code
 warning: AB_FR is not a valid language code

* W l18|ab_us is not a valid language code
 warning: ab_us is not a valid language code

* W l19|@documentlanguage missing argument
 warning: @documentlanguage missing argument

';

$result_nodes_list{'invalid_documentlanguage'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'invalid_documentlanguage'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'invalid_documentlanguage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'invalid_documentlanguage'} = '';

$result_indices_sort_strings{'invalid_documentlanguage'} = 'vr:
 Language of Which
';


$result_converted{'plaintext'}->{'invalid_documentlanguage'} = 'top
***

 -- Instance Variable of Which: Language Selected?

';

1;
