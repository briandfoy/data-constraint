# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	no warnings;

	*ExtUtils::MM_Any::test_via_harness = sub
		{
		my($self, $perl, $tests) = @_;
	
		return qq|	$perl "-MTest::Manifest" | .
			qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			qq|'\$(INST_ARCHLIB)')"\n|;
		};
	}

WriteMakefile
		(
		'NAME'          => 'Data::Constraint',
		'VERSION_FROM'  => 'lib/Constraint.pm',

		'PREREQ_PM' => {
			'Test::More'        => '0',
			'Class::Prototyped' => '0',
			},
			
		'PM'       => {
			'lib/Constraint.pm'  => '$(INST_LIBDIR)/Constraint.pm',
			},

		'MAN3PODS' => {
			'lib/Constraint.pm' => '$(INST_MAN3DIR)/Data::Constraint.3',
			},

		clean => { FILES => 'Data-*' },
		);
        
1;
