
#/usr/bin/perl

use strict;
use warnings;
use Switch;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";

while(my $row = <$fh>) {
	chomp($row);
	my ($x, $y) = (0, 0);
	my %hash;
	$hash{"0 0"} = 1;
	while($row =~ /(.)/gs) {
		switch($1) {
			case "<" { $y -= 1; }
			case ">" { $y += 1; }
			case "^" { $x += 1; }
			case "v" { $x -= 1; }			
		}
		$hash{$x." ".$y} = 1;
	}

	print scalar keys %hash;
}