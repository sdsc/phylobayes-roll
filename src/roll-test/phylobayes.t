#!/usr/bin/perl -w
# phylobayes roll installation test.  Usage:
# phylobayes.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/phylobayes';
my $output;

my $TESTFILE = 'tmpphylobayes';

# phylobayes-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'phylobayes installed');
} else {
  ok(! $isInstalled, 'phylobayes not installed');
}
SKIP: {

  skip 'phylobayes not installed', 4 if ! $isInstalled;
  SKIP: {
    skip 'need phylobayes run test', 1;
  }

  `/bin/ls /opt/modulefiles/applications/phylobayes/[0-9]* 2>&1`;
  ok($? == 0, 'phylobayes module installed');
  `/bin/ls /opt/modulefiles/applications/phylobayes/.version.[0-9]* 2>&1`;
  ok($? == 0, 'phylobayes version module installed');
  ok(-l '/opt/modulefiles/applications/phylobayes/.version',
     'phylobayes version module link created');

}

`rm -f $TESTFILE*`;
