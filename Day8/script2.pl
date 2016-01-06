use strict;
use warnings;
use Data::Dumper;

my $filename = 'input.txt';

open(my $fh, '<', $filename) 
	or die "Could not open file '$filename' $!";
my $extra_characters = 0;
my $total_characters = 0;
while(my $row = <$fh>) {
	chomp($row);
	$total_characters += length $row;		
	my @escape_needed = $row =~ m/[\\|\"]/g;	
	$extra_characters += scalar @escape_needed + 2;
}
print $extra_characters;