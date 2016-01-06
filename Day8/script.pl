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
	$extra_characters += 2;
	my @double_escape = $row =~ m/[\\]{2}/g;
	my @escape = $row =~ m/[\\]/g;
	my @hex = $row =~ m/\\x[0-9A-Fa-f]{2}/g;
	$extra_characters += 2 * (scalar @hex) + scalar(@escape) - scalar(@double_escape);
}
print $extra_characters;