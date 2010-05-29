use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Bugtracker;
BEGIN {
  $Dist::Zilla::Plugin::Bugtracker::VERSION = '1.101490';
}

# ABSTRACT: Automatically sets the bugtracker URL
use Moose;
with 'Dist::Zilla::Role::MetaProvider';

sub metadata {
    my $self = shift;

    my $web = sprintf('http://rt.cpan.org/Public/Dist/Display.html?Name=%s',
      $self->zilla->name);
    my $mailto = sprintf('bug-%s at rt.cpan.org', lc( $self->zilla->name ) );

    return {
        resources => {
            bugtracker => {
                web => $web,
                mailto => $mailto,
            }
        }
    };
}
__PACKAGE__->meta->make_immutable;
no Moose;
1;


__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Bugtracker - Automatically sets the bugtracker URL

=head1 VERSION

version 1.101490

=head1 SYNOPSIS

In C<dist.ini>:

    [Bugtracker]

=head1 DESCRIPTION

This plugin sets the distribution's bugtracker URL as metadata. This plugin
assumes you are using the CPAN RT bugtracker and sets those 2 fields:

  web = http://rt.cpan.org/Public/Dist/Display.html?Name=$dist
  mailto = bug-$dist at rt.cpan.org

Please see L<CPAN::Meta::Spec|http://search.cpan.org/dist/CPAN-Meta/lib/CPAN/Meta/Spec.pm#resources>
for more information.

=head1 FUNCTIONS

=head2 metadata

Sets the bugtracker URL in the distribution's metadata.

=for test_synopsis 1;
__END__

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/Dist-Zilla-Plugin-Bugtracker/>.

The development version lives at
L<http://github.com/hanekomu/Dist-Zilla-Plugin-Bugtracker/>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

