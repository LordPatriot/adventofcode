#/usr/bin/perl

use strict;
use warnings;
use Switch;

sub deliver {
	my ($hash, $move, $pos) = @_;
	switch($move) {
		case "<" { $pos->{y} -= 1; }
		case ">" { $pos->{y} += 1; }
		case "^" { $pos->{x} += 1; }
		case "v" { $pos->{x} -= 1; }			
	}
	$hash->{$pos->{x}." ".$pos->{y}} = 1;
}

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";

while(my $row = <$fh>) {
	chomp($row);
	my $coord = {santa => {x => 0, y => 0}, robosanta => {x => 0, y => 0}};
	my %visited;
	$visited{"0 0"} = 1;
	my $santa = 0;
	while($row =~ /(.)/gs) {
		if($santa) {
			deliver(\%visited, $1, $coord->{santa});
		}
		else {
			deliver(\%visited, $1, $coord->{robosanta});	
		}
		$santa = $santa? 0 : 1;
	}

	print scalar keys %visited;
}