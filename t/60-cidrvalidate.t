#!/usr/bin/env perl

use strict;
use warnings;

use Test2::Bundle::Extended;
use Test2::Tools::Explain;
use Test2::Plugin::NoWarnings;

use Net::CIDR;
use Net::Whois::IANA;

my $iana = Net::Whois::IANA->new;
$iana->whois_query(-ip => '191.96.58.222', -debug => 0);

note explain $iana->cidr;
is $iana->cidr->[0], '191.96.58/24', 'cidr';
is $iana->inetnum, '191.96.58-191.96.58', 'range';
ok Net::CIDR::cidrvalidate( $iana->cidr->[0] );


done_testing;