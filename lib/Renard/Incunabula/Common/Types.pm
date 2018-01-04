use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Common::Types;
# ABSTRACT: Type library

use Type::Library 0.008 -base,
	-declare => [qw(
	)];
use Type::Utils -all;

# Listed here so that scan-perl-deps can find them
use Types::Path::Tiny      ();
use Types::URI             ();
use Types::Standard        ();
use Types::Common::Numeric ();

use Type::Libraries;
Type::Libraries->setup_class(
	__PACKAGE__,
	qw(
		Types::Standard
		Types::Path::Tiny
		Types::URI
		Types::Common::Numeric
	)
);

=head1 TYPE LIBRARIES

=for :list
* L<Types::Standard>
* L<Types::Path::Tiny>
* L<Types::URI>
* L<Types::Common::Numeric>

=cut

1;
