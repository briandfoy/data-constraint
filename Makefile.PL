require 5.008;
use strict;
use warnings;

my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/Data/Constraint.pm';

my %WriteMakefile = (
	'MIN_PERL_VERSION' => 5.008,

	'NAME'          => 'Data::Constraint',
	'ABSTRACT_FROM' => $main_file,
	'VERSION_FROM'  => $main_file,
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
 	
	'PREREQ_PM' => {
		'Test::More'        => '0.95',
		'Class::Prototyped' => '0',
		},

	META_MERGE => {
			resources => {
				bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-Constraint',
		  		repository => 'git://github.com/briandfoy/data-constraint.git',
				},
			keywords => [ 'module', 'distribution', 'test' ],
	  		},
	
	clean => { FILES => 'Data-* *.bak *.old' },
	);
        
1;

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version" || die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
