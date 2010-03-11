use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Bugtracker;
our $VERSION = '1.100701';

# ABSTRACT: automatically sets the bugtracker URL
use Moose;
with 'Dist::Zilla::Role::MetaProvider';

sub metadata {
    my ($self, $arg) = @_;
    return {
        resources => {
            bugtracker =>
              sprintf('http://rt.cpan.org/Public/Dist/Display.html?Name=%s',
                $self->zilla->name)
        }
    };
}
__PACKAGE__->meta->make_immutable;
no Moose;
1;


__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::Bugtracker - automatically sets the bugtracker URL

=head1 VERSION

version 1.100701

=head1 SYNOPSIS

In C<dist.ini>:

    [Bugtracker]

=head1 DESCRIPTION

This plugin sets the distribution's bugtracker URL as metadata.

=head1 FUNCTIONS

=head2 metadata

Sets the bugtracker URL in the distribution's metadata.

=for test_synopsis 1;
__END__

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

