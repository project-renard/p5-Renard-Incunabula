use Modern::Perl;
package Renard::Incunabula::Common::Error;
# ABSTRACT: Exceptions

use custom::failures qw/
	Programmer::Logic
	IO::FileNotFound
	/;

1;
