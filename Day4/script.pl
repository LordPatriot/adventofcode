
use strict;
use warnings;
use Digest::MD5 qw/md5_hex/;

my $input = 'bgvyzdsv';
my $min = 0;
my $check;
my $zeros = 6;

do {
	$min++;
	my $output = md5_hex($input.$min);
	$check = $output =~ m/^[0]{$zeros}/;
} while(not $check);

print $min."\n";