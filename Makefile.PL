use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'WWW::Yahoo::Horoskop',
    'VERSION_FROM'	=> 'Horoskop.pm', # finds $VERSION
    'PREREQ_PM'		=> {LWP::Simple => 1.00,LWP::UserAgent => 1.00},
    ($] >= 5.005 ? (
      ABSTRACT_FROM => 'Horoskop.pm', 
      AUTHOR     => '-',
    ) : ()),
);
