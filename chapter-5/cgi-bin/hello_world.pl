#! /usr/bin/perl

use strict;
use warnings;

use CGI qw(:standard);

my $cgi = new CGI;

print 
	$cgi->header,
	$cgi->start_html('Hello World'),
	$cgi->h1('Hello World!'),
	$cgi->end_html;

exit;