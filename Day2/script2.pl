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

	@lwh = sort {$a <=> $b} @lwh; 

	$total += 2 * ($lwh[0] + $lwh[1]) + $lwh[0] * $lwh[1] * $lwh[2];	
}
print $total."\n";