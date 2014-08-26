use strict;

use Test::More tests => 6;
use UNIVERSAL qw(isa);

use Data::Constraint;

my $class = 'Data::Constraint';

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{

my $constraint = $class->get_by_name( 'fake' ); # no such thing

ok( ! defined $constraint, 'Non-existent constraint returns undef' );
ok( ! isa( $constraint, $class ), 
	'Non-existent constraint is not an object' );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# once we are sure that it doesn't exist, make it exist
{
my $constraint = $class->add_constraint(
	'fake',
	run         => sub { $_[1] =~ m/a/i },
	description => "Match things with an 'a'",
	);
	
isa_ok( $constraint, $class );
can_ok( $constraint, qw(check) );

is( $constraint->check( 'Foo' ), 0, 'Foo does not have an "a"' );
is( $constraint->check( 'Bar' ), 1, 'Bar does have an "a"' );
}
