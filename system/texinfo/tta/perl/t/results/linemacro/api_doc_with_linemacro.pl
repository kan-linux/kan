use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'api_doc_with_linemacro'} = '*document_root C1
 *before_node_section C8
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{param}
  |misc_args:A{param|type}
   *arguments_line C1
    {macro_line: param {param, type}\\n}
   {raw:@defline Parameter @var{\\param\\} @code{ : \\type\\}\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  *@linemacro C3 l4
  |EXTRA
  |macro_name:{returns}
  |misc_args:A{param|type}
   *arguments_line C1
    {macro_line: returns {param, type}\\n}
   {raw:@defline {Return Value} @var{\\param\\} @code{ : \\type\\}\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  *@linemacro C3 l7
  |EXTRA
  |macro_name:{raises}
  |misc_args:A{exception}
   *arguments_line C1
    {macro_line: raises {exception}\\n}
   {raw:@defline {Exception} \\exception\\\\n}
   *@end C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{txidefnamenospace|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txidefnamenospace}
  *@clear C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{txicodevaristt}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txicodevaristt}
  {empty_line:\\n}
  *@defblock C4 l14
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@defline C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{fft.fft}
   |omit_def_name_space:{1}
   |original_def_cmdname:{defline}
    *line_arg C19
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {fft.fft}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {a}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {n=}
     *def_arg C1
      *def_line_arg C1
       *@code C1 l15
        *brace_container C1
         {None}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {axis=}
     *def_arg C1
      *def_line_arg C1
       *@code C1 l15
        *brace_container C1
         {-1}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {norm=}
     *def_arg C1
      *def_line_arg C1
       *@code C1 l15
        *brace_container C1
         {None}
     {delimiter:)}
   *def_item C4
    *paragraph C1
     {Compute the one-dimensional discrete Fourier Transform.\\n}
    {empty_line:\\n}
    *@defblock C12 l18
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;1>
       >*linemacro_call@param C2
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >*linemacro_arg C1
         >{macro_call_arg_text:a}
        >*linemacro_arg C1
        >|INFO
        >|spaces_before_argument:
         >|{spaces_before_argument: }
         >{macro_call_arg_text:array_like}
     *@defline C1 l19:@param
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |def_command:{defline}
     |def_index_element:
      |* C1
       |*def_line_arg C1
        |*@var C1
         |*brace_container C1
          |{a}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C5
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
        *def_line_arg C1
         {Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *@var C1 l19:@param
          *brace_container C1
           {a}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *@code C1 l19:@param
         >SOURCEMARKS
         >linemacro_expansion<end;1>
          *brace_container C1
           { : array_like}
     *def_item C2
      *paragraph C1
       {Input array, can be complex.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;2><p:1>
       >*linemacro_call@param C2
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >*linemacro_arg C1
         >{macro_call_arg_text:n}
        >*linemacro_arg C1
        >|INFO
        >|spaces_before_argument:
         >|{spaces_before_argument: }
         >{macro_call_arg_text:int, optional}
     *@defline C1 l22:@param
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |def_command:{defline}
     |def_index_element:
      |* C1
       |*def_line_arg C1
        |*@var C1
         |*brace_container C1
          |{n}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C5
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
        *def_line_arg C1
         {Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *@var C1 l22:@param
          *brace_container C1
           {n}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *@code C1 l22:@param
         >SOURCEMARKS
         >linemacro_expansion<end;2>
          *brace_container C1
           { : int, optional}
     *def_item C2
      *paragraph C4
       {Length of the transformed axis of the output.\\n}
       {If }
       *@var C1 l24
        *brace_container C1
         {n}
       { is smaller than the length of the input, the input is cropped.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;3><p:1>
       >*linemacro_call@param C2
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >*linemacro_arg C1
         >{macro_call_arg_text:axis}
        >*linemacro_arg C1
        >|INFO
        >|spaces_before_argument:
         >|{spaces_before_argument: }
         >{macro_call_arg_text:int, optional}
     *@defline C1 l26:@param
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |def_command:{defline}
     |def_index_element:
      |* C1
       |*def_line_arg C1
        |*@var C1
         |*brace_container C1
          |{axis}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C5
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
        *def_line_arg C1
         {Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *@var C1 l26:@param
          *brace_container C1
           {axis}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *@code C1 l26:@param
         >SOURCEMARKS
         >linemacro_expansion<end;3>
          *brace_container C1
           { : int, optional}
     *def_item C2
      *paragraph C1
       {Axis over which to compute the FFT.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;4><p:1>
       >*linemacro_call@returns C2
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >*linemacro_arg C1
         >{macro_call_arg_text:out}
        >*linemacro_arg C1
        >|INFO
        >|spaces_before_argument:
         >|{spaces_before_argument: }
         >{macro_call_arg_text:complex ndarray}
     *@defline C1 l29:@returns
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |def_command:{defline}
     |def_index_element:
      |* C1
       |*def_line_arg C1
        |*@var C1
         |*brace_container C1
          |{out}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C5
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
        *bracketed_arg C1 l29:@returns
         {Return Value}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *@var C1 l29:@returns
          *brace_container C1
           {out}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *@code C1 l29:@returns
         >SOURCEMARKS
         >linemacro_expansion<end;4>
          *brace_container C1
           { : complex ndarray}
     *def_item C2
      *paragraph C1
       {The truncated or zero-padded input.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;5><p:1>
       >*linemacro_call@raises C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >*linemacro_arg C1
         >{macro_call_arg_text:IndexError}
     *@defline C1 l32:@raises
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |def_command:{defline}
     |def_index_element:
      |* C1
       |*def_line_arg C1
        |{IndexError}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C3
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *def_category C1
        *bracketed_arg C1 l32:@raises
         {Exception}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {IndexError}
         >SOURCEMARKS
         >linemacro_expansion<end;5><p:10>
     *def_item C2
      *paragraph C5
       {If }
       *@var C1 l33
        *brace_container C1
         {axis}
       { is not a valid axis of }
       *@var C1 l33
        *brace_container C1
         {a}
       {.\\n}
      {empty_line:\\n}
     *@end C1 l35
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{defblock}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {defblock}
    {empty_line:\\n}
   *@end C1 l37
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defblock}
';


$result_texis{'api_doc_with_linemacro'} = '@linemacro param {param, type}
@defline Parameter @var{\\param\\} @code{ : \\type\\}
@end linemacro
@linemacro returns {param, type}
@defline {Return Value} @var{\\param\\} @code{ : \\type\\}
@end linemacro
@linemacro raises {exception}
@defline {Exception} \\exception\\
@end linemacro

@set txidefnamenospace
@clear txicodevaristt

@defblock
@defline Function fft.fft (a, n=@code{None}, axis=@code{-1}, norm=@code{None})
Compute the one-dimensional discrete Fourier Transform.

@defblock
@defline Parameter @var{a} @code{ : array_like}
Input array, can be complex.

@defline Parameter @var{n} @code{ : int, optional}
Length of the transformed axis of the output.
If @var{n} is smaller than the length of the input, the input is cropped.

@defline Parameter @var{axis} @code{ : int, optional}
Axis over which to compute the FFT.

@defline {Return Value} @var{out} @code{ : complex ndarray}
The truncated or zero-padded input.

@defline {Exception} IndexError
If @var{axis} is not a valid axis of @var{a}.

@end defblock

@end defblock
';


$result_texts{'api_doc_with_linemacro'} = '

Function: fft.fft (a, n=None, axis=-1, norm=None)
Compute the one-dimensional discrete Fourier Transform.

Parameter: a  : array_like
Input array, can be complex.

Parameter: n  : int, optional
Length of the transformed axis of the output.
If n is smaller than the length of the input, the input is cropped.

Parameter: axis  : int, optional
Axis over which to compute the FFT.

Return Value: out  : complex ndarray
The truncated or zero-padded input.

Exception: IndexError
If axis is not a valid axis of a.


';

$result_errors{'api_doc_with_linemacro'} = '';

$result_nodes_list{'api_doc_with_linemacro'} = '';

$result_sections_list{'api_doc_with_linemacro'} = '';

$result_sectioning_root{'api_doc_with_linemacro'} = '';

$result_headings_list{'api_doc_with_linemacro'} = '';

1;
