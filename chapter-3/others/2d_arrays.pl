#! /usr/bin/perl

use strict;
use warnings;

my @twodarray = (
 	["24", "48", "56", "12"],
 	["25", "48", "55", "12"],
 	["23", "49", "54", "11"],
 	["24", "48", "55", "12"]
);

# Here we extract some single values

print "Patient1, var2: " . $twodarray [0]->[1]; # This will print '48'
print "\n";
print "Patient4, var3: " . $twodarray [3]->[2]; # This will print '55'
print "\n";

# Or we could just extract and dereference a whole array...

foreach (@twodarray) {
 	# This is how we de-reference a whole array
 	my @patient_data = @{$_};
 	
 	foreach my $var (@patient_data) {
 		print $var . ' ';
 	}
 	
 	print "\n";
}
