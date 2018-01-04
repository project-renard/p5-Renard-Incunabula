use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Devel::TestHelper;
# ABSTRACT: A test helper with functions useful for various Renard distributions

use Renard::Incunabula::Common::Types qw(Dir);

=func test_data_directory

  Renard::Incunabula::Devel::TestHelper->test_data_directory

Returns a L<Path::Class> object that points to the path defined by
the environment variable C<RENARD_TEST_DATA_PATH>.

If the environment variable is not defined, throws an error.

=cut
classmethod test_data_directory() :ReturnType(Dir) {
	require Path::Tiny;
	Path::Tiny->import();

	if( not defined $ENV{RENARD_TEST_DATA_PATH} ) {
		die "Must set environment variable RENARD_TEST_DATA_PATH to the path for the test-data repository";
	}
	return path( $ENV{RENARD_TEST_DATA_PATH} );
}

1;
