#!/usr/bin/perl

use strict;
use warnings;
use Test::MockTime qw(set_absolute_time);
use Test::More;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Test::Dategrep;
use POSIX qw(tzset);

$ENV{TZ} = 'GMT';
tzset;

set_absolute_time(1395584508);

$ENV{DATEGREP_DEFAULT_FORMAT} = '%Y-%m-%d %H:%M';


test_dategrep [
    '--last-minutes=5',"$Bin/files/test01.log"
  ],
  <<'EOF', 'test --last-minutes 5';
2014-03-23 14:16 line 1
2014-03-23 14:17 line 1
EOF

done_testing();
