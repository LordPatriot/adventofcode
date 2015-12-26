
use strict;
use warnings;
use Data::Dumper;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";
my $lights = [];

for my $i (0..999) {
	$lights->[$i] = [];
	for my $j (0..999) {
		$lights->[$i][$j] = 0;
	}
}

while(my $row = <$fh>) {	
	$row =~ m/(turn on|turn off|toggle) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)/;
	action($lights, [$2, $3, $4, $5], $1);
}

my $counter = 0;

for my $i (0..999) {
	for my $j (0..999) {
		$counter++ if $lights->[$i][$j] == 1;
	}
}

print $counter;

sub action {
	my $lights = shift;
	my $params = shift;
	my $command = shift;

	for my $i ($params->[0]..$params->[2]) {
		for my $j ($params->[1]..$params->[3]) {
			$lights->[$i][$j] = $command eq "turn on" ? 1 : $command eq "turn off" ? 0 : $lights->[$i][$j] == 1 ? 0 : 1;
		}
	}
}