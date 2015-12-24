use strict;
use warnings;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";

my $total = 0;
while(my $row = <$fh>) {		
	my @lwh;	
	while($row =~ /([0-9]+)/gs) {
		push @lwh, $1;
	}

	my $smallest = -1;	
	foreach my $i (0..2) {
		my $surface = $lwh[$i] * $lwh[($i + 1) % 3];
		$total += 2 * $surface;		
		$smallest = $surface if($smallest == -1 || $smallest > $surface);		
	}	
	$total += $smallest;	
}
print $total."\n";