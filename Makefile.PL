
use strict;
use warnings;

 BEGIN { require 5.008; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::Bugtracker',
                       'DISTNAME' => 'Dist-Zilla-Plugin-Bugtracker',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'automatically sets the bugtracker URL',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100700',
                       'PREREQ_PM' => {
                                        'Test::More' => '0',
                                        'English' => '0',
                                        'Dist::Zilla::Role::MetaProvider' => '0',
                                        'File::Find' => '0',
                                        'File::Temp' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



