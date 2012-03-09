#! /usr/bin/perl

@dna = qw(ACTG GGCG AAAA TTTG);

print "Here's a single element:\n";
print $dna[2] . "\n\n";
print "Here's the whole array:\n";
print @dna . "\n\n";
print "Here's the whole array again:\n";
print "@dna\n";
