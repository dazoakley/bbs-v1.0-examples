#! /usr/bin/perl

$string = 'I like Perl';    # create a new string
print "Before: $string\n";
$string =~ s/like/love/;    # substitute the word 'like' for 'love'
print "After: $string\n";   # would give: I love Perl

