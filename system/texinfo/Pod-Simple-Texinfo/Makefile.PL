use 5.000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

# FIXME no idea how to change @INC for make test

my $t2a_srcdir = '../tta';
# "-I$t2a_srcdir -I$t2a_srcdir/maintain/lib/Unicode-EastAsianWidth/lib/ -I$t2a_srcdir/maintain/lib/libintl-perl/lib  -I$t2a_srcdir/maintain/lib/Text-Unidecode/lib/"

WriteMakefile(
    NAME              => 'Pod::Simple::Texinfo',
    VERSION_FROM      => 'lib/Pod/Simple/Texinfo.pm', # finds $VERSION
    EXE_FILES         => [ 'pod2texi' ],
    PREREQ_PM         => { "Pod::Simple::PullParser" => 0,
                           "Pod::Simple::XHTML" => 0,
                           "Texinfo::Parser" => 0,
                           "Getopt::Long" => 0,
                           "File::Spec" => 0,
                           "File::Basename" => 0, }, # e.g., Module::Name => 1.1
#    FULLPERLRUN       => '$(FULLPERL) '."-I$t2a_srcdir -I$t2a_srcdir/maintain/lib/Unicode-EastAsianWidth/lib/ -I$t2a_srcdir/maintain/lib/libintl-perl/lib  -I$t2a_srcdir/maintain/lib/Text-Unidecode/lib/",
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Pod/Simple/Texinfo.pm', # retrieve abstract from module
       AUTHOR         => 'Patrice Dumas <bug-texinfo@gnu.org>') : ()),
);
