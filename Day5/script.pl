
use strict;
use warnings;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";
my $nice_counter = 0;
while(my $row = <$fh>) {	
	$nice_counter++ if $row !~ m/(ab|cd|pq|xy)/ 
					&& $row =~ m/(\w)\1/ # back reference 
					&& $row =~ m/([aeiou](\w)*){3}/;
}

print $nice_counter;