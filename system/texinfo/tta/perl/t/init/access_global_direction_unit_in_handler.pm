
use strict;

my $document_name;

sub _button_show_global_direction($)
{
  my $self = shift;

  my $text = 'NO_ELEMENT';
  my $output_unit = $self->global_direction_unit('Top');
  if ($output_unit->{'unit_command'}) {
    # arguments_line type element
    my $arguments_line = $output_unit->{'unit_command'}->{'contents'}->[0];
    my $line_arg = $arguments_line->{'contents'}->[0];
    $text = $self->convert_tree($line_arg);
  }
  return $text, 1;
}

# avoid doing twice if there are more than one manual processed
my $button_added;
sub _texi2any_tests_access_global_direction_in_handler
{
  my ($self, $document, $stage) = @_;

  if (!$button_added) {
    my @section_buttons = @{$self->get_conf('SECTION_BUTTONS')};
    push @section_buttons, ('Space', \&_button_show_global_direction);
    $self->set_conf('SECTION_BUTTONS', \@section_buttons);
    $button_added = 1;
  }

  $self->set_global_direction('Top', 'chap');
  return 0;
}

texinfo_register_handler('setup',
                    \&_texi2any_tests_access_global_direction_in_handler);

1;
