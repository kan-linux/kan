/* Automatically generated from regenerate_C_options_info.pl */

#include "options_data.h"
#include "converter_types.h"
#include "get_perl_info.h"

void
html_fill_sv_options (OPTIONS *options, const CONVERTER *converter)
{
  if (options->LINKS_DIRECTIONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->LINKS_DIRECTIONS.o.buttons);

  if (options->TOP_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->TOP_BUTTONS.o.buttons);

  if (options->TOP_FOOTER_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->TOP_FOOTER_BUTTONS.o.buttons);

  if (options->SECTION_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->SECTION_BUTTONS.o.buttons);

  if (options->CHAPTER_FOOTER_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->CHAPTER_FOOTER_BUTTONS.o.buttons);

  if (options->SECTION_FOOTER_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->SECTION_FOOTER_BUTTONS.o.buttons);

  if (options->NODE_FOOTER_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->NODE_FOOTER_BUTTONS.o.buttons);

  if (options->MISC_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->MISC_BUTTONS.o.buttons);

  if (options->CHAPTER_BUTTONS.o.buttons)
    html_fill_button_sv_specification_list (converter, options->CHAPTER_BUTTONS.o.buttons);

}

