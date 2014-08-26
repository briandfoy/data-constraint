use strict;

use UNIVERSAL qw(isa);

use Data::Constraint;
use Test::More 0.95;

my $class = 'Data::Constraint';

my $predefined_constraints = 3;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
my @names = $class->get_all_names;

is( scalar @names, $predefined_constraints, 
	"There are three predefined constraints" );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
my $constraint = $class->get_by_name( 'defined' );

isa_ok( $constraint, 'Data::Constraint' );
can_ok( $constraint, qw(check description run) );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
$class->delete_by_name( 'defined' );

my $constraint = $class->delete_by_name( 'defined' );

ok( ! defined $constraint, "Constraint disappears after delete" );

my @names = $class->get_all_names;

is( scalar @names, $predefined_constraints - 1, 
	"There are three predefined tests" );
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
{
$class->delete_all;

my @names = $class->get_all_names;

is( scalar @names, 0, "There are no more predefined constraints" );
}
