#! /usr/bin/perl
# Program to convert a DNA string to its reverse compliment

# Get the input string
unless (@ARGV) {
 	die "You need to pass me your DNA sequence!";
}

# Our DNA string
my $dna = $ARGV[0];

# First we reverse the DNA
my $revcom = reverse $dna;

# Now translate the DNA bases
$revcom =~ tr/ACGTacgt/TGCAtgca/;

# Then print out the results
print "Original DNA string: " . $dna . "\n";
print "Reverse compliment:  " . $revcom . "\n";
