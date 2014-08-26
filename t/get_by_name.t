use strict;

use Test::More tests => 6;
use UNIVERSAL qw(isa);

use Data::Constraint;

my $class = 'Data::Constraint';

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
my $constraint = $class->get_by_name( 'defined' );

isa_ok( $constraint, 'Data::Constraint' );
can_ok( $constraint, qw(check description run) );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
my $constraint = $class->get_by_name( 'ordinal' );

isa_ok( $constraint, 'Data::Constraint' );
can_ok( $constraint, qw(run description check) );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{

my $constraint = $class->get_by_name( 'fake' ); # no such thing

ok( ! defined $constraint, 'Non-existent constraint returns undef' );
ok( ! isa( $constraint, 'Data::Constraint' ) );
}
