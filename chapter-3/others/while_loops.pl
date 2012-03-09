#! /usr/bin/perl

$test_var = 12;

while ($test_var < 45) {
 	print "Variable is $test_var \n";
 	$test_var = $test_var + 10;
}

# This will produce the following output:
# 
# Variable is 12
# Variable is 22
# Variable is 32
# Variable is 42
