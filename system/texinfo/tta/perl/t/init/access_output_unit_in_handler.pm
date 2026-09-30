use strict;

sub _texi2any_tests_access_output_unit_in_handler
{
  my ($self, $document, $stage) = @_;

  # this triggers building the tree to Perl through a call to
  # document_labels_information
  my $top_element = $self->label_command('Top');
  if ($top_element and $top_element->{'associated_unit'}) {
    my $output_unit = $top_element->{'associated_unit'};
    return 0;
  }

  return -1;
}

texinfo_register_handler('structure',
                    \&_texi2any_tests_access_output_unit_in_handler);

1;
