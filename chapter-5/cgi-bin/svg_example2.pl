#! /usr/bin/perl

use strict;
use warnings;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use SVG::TT::Graph::Line;

# Field names for the x-axis
my $fields = [ "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th" ];

# Our data sets
my $data1  = [ 1,     2,     5,     6,     3,     1.5,   1,     3,     4 ];
my $data2  = [ 1,     1,     4,     7,     2,     3,     7,     4,     6 ];

# Create our new graph object
my $graph = SVG::TT::Graph::Line->new(
    {
        height           => '300',
        width            => '400',
        fields           => $fields,
        x_title          => 'X Label',
        show_x_title     => 1,
        y_label          => 'Y Label',
        show_y_title     => 1,
        scale_integers   => 1,
        stagger_y_labels => 2,
        show_graph_title => 1,
        graph_title      => 'A simple graph'
    }
);

# Add data to our graph
$graph->add_data({ 'data'  => $data1, 'title' => 'Dataset 1' });
$graph->add_data({ 'data'  => $data2, 'title' => 'Dataset 2' });

# And insert our new graph we prepared above
print "Content-type: image/svg+xml\r\n\r\n";
print $graph->burn();
exit(0);
