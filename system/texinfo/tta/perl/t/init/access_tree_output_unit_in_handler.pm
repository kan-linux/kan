use strict;

use Texinfo::Convert::Texinfo;

sub _texi2any_tests_access_output_unit_in_handler
{
  my ($self, $document, $stage) = @_;

  my $root = $document->tree();
  foreach my $element (@{$root->{'contents'}}) {
    if (defined($element->{'cmdname'}) and $element->{'associated_unit'}) {
      my $arguments_line = $element->{'contents'}->[0];
      my $line_arg = $arguments_line->{'contents'}->[0];
      # Could check that
      # Texinfo::Convert::Texinfo::convert_to_texinfo($line_arg) eq 'Top'
      #print STDERR "E: "
      # .Texinfo::Convert::Texinfo::convert_to_texinfo($line_arg)."\n";
      return 0;
    }
  }

  return -1;
}

texinfo_register_handler('structure',
                    \&_texi2any_tests_access_output_unit_in_handler);

1;
