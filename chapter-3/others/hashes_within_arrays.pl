#! /usr/bin/perl

use strict;
use warnings;

my $ah_exp_results_ref = [
    {
        'patient1' => ["24", "48", "56", "12"],
        'patient2' => ["25", "48", "55", "12"],
        'patient3' => ["23", "49", "54", "11"],
        'patient4' => ["24", "48", "55", "12"]
    },
    {
        'patient1' => ["22", "46", "54", "10"],
        'patient2' => ["24", "47", "54", "11"],
        'patient3' => ["25", "51", "56", "13"],
        'patient4' => ["24", "48", "55", "12"]
    }
];

use Data::Dumper;
print Dumper($ah_exp_results_ref);