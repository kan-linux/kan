
use strict;

use Texinfo::Convert::HTML;

my $converter_defaults = Texinfo::Convert::HTML->converter_defaults();

my @buttons_specs = ('SECTION_BUTTONS', 'CHAPTER_BUTTONS',
                             'TOP_BUTTONS',
                       'CHAPTER_FOOTER_BUTTONS', 'SECTION_FOOTER_BUTTONS',
                       'NODE_FOOTER_BUTTONS', 'MISC_BUTTONS',
                       'TOP_FOOTER_BUTTONS', 'LINKS_DIRECTIONS');

foreach my $button_spec (@buttons_specs) {
  my $buttons = $converter_defaults->{$button_spec};
  my @buttons = @{$buttons};
  push @buttons, ('Toto', 'NewB', 'Titi');
  texinfo_set_from_init_file($button_spec, \@buttons);
}

1;
