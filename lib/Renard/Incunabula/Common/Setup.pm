use Modern::Perl;
package Renard::Incunabula::Common::Setup;
# ABSTRACT: Packages that can be imported into every module

use autodie;

use Import::Into;

use Function::Parameters ();
use Return::Type ();
use MooX::TypeTiny ();

use Try::Tiny ();
use Renard::Incunabula::Common::Error ();

use Path::Tiny ();


sub import {
	my ($class) = @_;

	my $target = caller;

	Modern::Perl->import::into( $target );
	autodie->import::into( $target );

	my %type_tiny_fp_check = ( reify_type => sub { Type::Utils::dwim_type($_[0]) }, );
	Function::Parameters->import::into( $target,
		{
			fun         => { defaults => 'function_lax'   , %type_tiny_fp_check },
			classmethod => { defaults => 'classmethod_lax', %type_tiny_fp_check },
			method      => { defaults => 'method_lax'     , %type_tiny_fp_check },
			callback    => { defaults => 'function_lax'   , %type_tiny_fp_check, check_argument_count => 0 },
		}
	);
	Return::Type->import::into( $target );

	Try::Tiny->import::into( $target );
	Renard::Incunabula::Common::Error->import::into( $target );

	Path::Tiny->import::into( $target );

	return;
}

1;
