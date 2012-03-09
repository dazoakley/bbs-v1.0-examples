#! /usr/bin/perl

%genetic_code = (
 	'GCU' => 'Ala',
 	'AAA' => 'Lys',
 	'GCA' => 'Ala'
);

print 'AAA: ' . $genetic_code{'AAA'} . "\n";  # This prints the value 'Lys'

$alanine = $genetic_code{'GCU'};  # Makes $new_scalar equal 'Ala'

print 'GCU: ' . $genetic_code{'GCU'} . "\n";
