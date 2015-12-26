use strict;
use warnings;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";

while(my $row = <$fh>) {
	chomp($row);
	my $floor = 0;
	my $counter = 0;
	while($row =~ /(.)/gs) {
		$floor += $1 eq '(' ? 1 : -1;
		$counter++;
		if( $floor == -1) {
			print $counter;
			last;
		}
	}
}