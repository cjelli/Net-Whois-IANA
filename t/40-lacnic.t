use strict;
use warnings;

use Test2::Bundle::Extended;
use Test2::Tools::Explain;
use Test2::Plugin::NoWarnings;

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
$iana->whois_query(-ip=>$ip,-whois=>'lacnic' );
ok(defined $iana);
todo 'whois.registro.br do not always provide the country' => sub {
	ok $iana->country(), 'BR';
};

done_testing;

