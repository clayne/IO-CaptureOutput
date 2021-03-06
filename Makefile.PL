use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "(DEPRECATED) capture STDOUT and STDERR from Perl code, subprocesses or XS",
  "AUTHOR" => "Simon Flack <simonflk\@cpan.org>, David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "IO-CaptureOutput",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "IO::CaptureOutput",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "File::Basename" => 0,
    "File::Temp" => "0.16",
    "Symbol" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => "3.27",
    "IO::File" => 0,
    "Test::More" => "0.62"
  },
  "VERSION" => "1.1106",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Exporter" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Basename" => 0,
  "File::Spec" => "3.27",
  "File::Temp" => "0.16",
  "IO::File" => 0,
  "Symbol" => 0,
  "Test::More" => "0.62",
  "strict" => 0,
  "vars" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

if ( $^O eq 'MSWin32' ) {
	$WriteMakefileArgs{PREREQ_PM}{'File::Spec'} = $FallbackPrereqs{'File::Spec'} = '3.27';
}

WriteMakefile(%WriteMakefileArgs);
