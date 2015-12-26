
use strict;
use warnings;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";
my $nice_counter = 0;
while(my $row = <$fh>) {	
	$nice_counter++ if $row =~ m/(\w\w)(\w)*\g1(\w)*/
					&& $row =~ m/(\w)*(\w)\w\g2(\w)*/;					
}

print $nice_counter;