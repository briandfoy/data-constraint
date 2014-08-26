use Test::More tests => 1;

my $module = "Data::Constraint";

print "bail out! Script file is missing!" unless use_ok( $module );
