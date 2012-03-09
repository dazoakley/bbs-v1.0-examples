#! /usr/bin/perl

$dna = 'ACTGACC';               # create our DNA string
print "Before: $dna\n";

$dna =~ tr/ACTGactg/TGACtgac/;  # change all the bases at once
$dna = reverse($dna);           # reverse the sequence

print "After: $dna\n";          # output result
