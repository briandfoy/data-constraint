# $Id$

use Test::More tests => 2;

use Data::Constraint;

my %names = map { $_, 1 } Data::Constraint->get_all_names;

foreach my $name ( qw(defined ordinal) )
	{
	ok( exists $names{$name}, "Found constraint named [$name]" );
	}