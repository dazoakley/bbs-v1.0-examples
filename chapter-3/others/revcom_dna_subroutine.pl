#! /usr/bin/perl

use strict;
use warnings;

my $dna = 'ACTGAAA';
print "My DNA string is " . $dna . "\n";

# Call on our subroutine...
my $revcom_dna = revcom($dna);
print "The reverse compliment is " . $revcom_dna . "\n";

# A subroutine to reverse compliment DNA
sub revcom {
 	# Get the DNA to be worked on...
 	my ($dna) = @_;
 	
 	# First we reverse the DNA
 	$dna = reverse $dna;
 	
 	# Now translate the DNA bases
 	$dna =~ tr/ACGTacgt/TGCAtgca/;
 	
 	# Return the output
 	return $dna;
}
