use Test::More 0.95;

my $module = "Data::Constraint";

print "bail out! Script file is missing!" unless use_ok( $module );
