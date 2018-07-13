use strict;
use warnings;

use Test::More tests => 6;
use Net::Whois::IANA;

my $iana = Net::Whois::IANA->new;

my $ip = '200.16.98.2';
$iana->whois_query(-ip=>$ip,-whois=>'lacnic');
ok(defined $iana);
is($iana->country(), 'AR');

$ip = '200.77.236.16';
$iana->whois_query(-ip=>$ip,-whois=>'lacnic');
ok(defined $iana);
is($iana->country(), 'MX');

# whois.registro.br do not provide anymore the country information for brazilian websites
$ip = '200.189.169.141';
$iana->whois_query(-ip=>$ip,-whois=>'lacnic', -debug => 0);
ok(defined $iana);
is($iana->country(), undef, "whois.registro.br do not provide anymore the country information for brazilian websites");
