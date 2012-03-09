#! /usr/bin/perl

use strict;
use warnings;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use GD::Graph::bars;

# First load our data into an array - this is an array
# of array references
my @data = ( 
	["1st","2nd","3rd","4th","5th","6th","7th", "8th", "9th"],
	[    1,    2,    5,    6,    3,  1.5,    1,     3,     4],
	[    1,    1,    4,    7,    2,  3,      7,     4,     6]
);

# Declare our new GD::Graph image and its size
my $graph = GD::Graph::bars->new(400, 300);

# Outline some paramaters for our graph
$graph->set( 
	x_label           => 'X Label',
	y_label           => 'Y label',
	title             => 'A simple graph',
	y_max_value       => 8,
	y_tick_number     => 8,
	y_label_skip      => 2 
) or die $graph->error;

# Calculate the graph and image
my $img = $graph->plot(\@data) or die $graph->error;

# Print it to the page
print "Content-type: image/png\n\n";
print $img->png;

exit;


