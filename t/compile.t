# $Id$

use Test::More tests => 1;

my $module = "Local::NPR::LastWeek";

print "bail out! Script file is missing!" unless use_ok( $module );
