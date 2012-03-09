#! /usr/bin/perl

use strict;
use warnings;

# Create our initial data structure as a reference...
my $aa_2d_array_ref = [
 	["24", "48", "56", "12"],
 	["25", "48", "55", "12"],
 	["23", "49", "54", "11"],
 	["24", "48", "55", "12"]
];

# And to access the data within...
print "Patient1, var2: " . $aa_2d_array_ref->[0]->[1] . "\n"; # '48'
print "Patient4, var3: " . $aa_2d_array_ref->[3]->[2] . "\n"; # '55'

# Or... (note the double '$$' to de-reference our data)
print "Patient1, var2: " . $$aa_2d_array_ref[0][1] . "\n"; # '48'
print "Patient4, var3: " . $$aa_2d_array_ref[3][2] . "\n"; # '55'

# Or access the whole structure...
foreach my $a_patient_ref (@{$aa_2d_array_ref}) {
 	foreach my $measurement (@{$a_patient_ref}) {
 		print $measurement . ' ';
 	}
 	print "\n";
}
