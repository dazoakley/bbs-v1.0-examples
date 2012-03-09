#! /usr/bin/perl

@columns = qw(A B C D E F G);
@rows = qw(1 2 3 4 5);

foreach $row (@rows) {
 	foreach $column (@columns) {
 		print $column . $row . ' ';
 	}
 	print "\n";
}

# This produces the following output:
#
# A1 B1 C1 D1 E1 F1 G1
# A2 B2 C2 D2 E2 F2 G2
# A3 B3 C3 D3 E3 F3 G3 etc...

print "\n\n";

@columns = qw(A B C D E F G);
@rows = qw(1 2 3 4 5);

foreach (@rows) {
 	foreach (@columns) {
 		print $_ . $_ . ' ';
 	}
 	print "\n";
}

# This produces the following output:
#
# AA BB CC DD EE FF GG
# AA BB CC DD EE FF GG
# AA BB CC DD EE FF GG etc...
