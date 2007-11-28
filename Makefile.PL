# $Id$
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'          => 'Data::Constraint',
	'ABSTRACT'      => 'prototypical value checking',
	'VERSION_FROM'  => 'lib/Constraint.pm',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',

	
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
	
	clean => { FILES => 'Data-* *.bak *.old' },
	);
        
1;
